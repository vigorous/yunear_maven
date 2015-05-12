var mongoose = require('mongoose')
    , utils = require('../../../../lib/utils')
    , async = require('async')
    , _ = require('underscore')
    , request = require('request')
    , config = require('../../../../config/config')
    , QRCodeActivity = mongoose.model('QRCodeActivity')
    , Affiliate = mongoose.model('Affiliate')
    , QRCodeActivityJoin = mongoose.model('QRCodeActivityJoin')
    , Customer = mongoose.model('Customer')
    , moment = require('moment');

var common_dao = require('../../../common/common_dao');
var QRCodeActivityDao = common_dao.get('QRCodeActivity');
var raffleApplyDao = common_dao.get('Raffle_Apply');
var affiliateDao = common_dao.get('Affiliate');
var carCodeshopHasParkingDao = common_dao.get('Car_Codeshop_Has_Parking');

var CouponService = require('../../../models_services/CouponService');
var SaleService = require('../../../models_services/SaleService');

module.exports = function(req, res,next) {
    if(req.method == "GET") {
        doGet(req,res,next);
    } else if(req.method == "POST") {
        doPost(req,res,next);
    }else{
        res.send('not support');
    }
};

function handleWeb(req,res,next){

    var activityProduct;
    async.series([
        function(callback){
            QRCodeActivity.loadByOP({_id: req.query.id, status: 1}, function(err, item){
                if (err) return callback(err);
                if(!item) return callback(new Error('无效活动!'));
                activityProduct = item;
                return callback();
            });
        }
    ], function(err) {
        if (err) return res.redirect('/a');
        //console.log(activityProduct);
        return res.render("app/activity_goods",{
            activityGoods:activityProduct
        });
    });

}

//扫码获取返利活动
function doGet(req,res,next){
    if(!req.query.c){
        //return res.redirect('/public/app/show')
        return handleWeb(req,res,next);
    }
    // user:req.user
    var mCustomer;
    var mQRCodeActivityJoin;
    async.series([
        function(callback) {
            Customer.loadByOp({_id:req.query.cid},function(err,customer){
                if(err) return callback(err);
                // if(!customer) return callback(new Error('user not found:'+req.user))
                mCustomer = customer;
                return callback();
            })
        },
        function(callback){
            if(!mCustomer) return callback();
            QRCodeActivityJoin.loadByOp({customer: mCustomer, activity: req.query.id}, function(err, item){
                if(err) return callback(err);
                mQRCodeActivityJoin = item;
                callback();
            });
        }
    ], function(err) { //console.log(res.locals.datas)
        if (err) return res.json({r:500,error:err.message});

        if(mQRCodeActivityJoin){
            //已经参加，不需要限制活动是否可用
//            console.log(JSON.stringify(mQRCodeActivityJoin.activity_info));
            if(mQRCodeActivityJoin.activity_info && mQRCodeActivityJoin.activity_info.aid){//20141020以后的新数据
                var oldItem = JSON.parse(JSON.stringify(mQRCodeActivityJoin.activity_info));
//                oldItem = setCommissionAndTime(oldItem);
                oldItem._id = oldItem.aid;
//                delete oldItem.aid;

                getActivityInfo({_id: req.query.id},function(err,item){
                    if (err) return res.json({r:500,error:err.message});
//                    console.log('oldItem.products======',oldItem.products);
                    oldItem.raffles = item.raffles ? item.raffles : [];
                    delete oldItem.products;

                    if(item){
                        oldItem.products = item.products;

                        var currentTime = new Date();
                        var beginTime = new Date(item.beginTime);
                        if (currentTime < beginTime){
                            var curr_date = beginTime.getDate();
                            var curr_month = beginTime.getMonth();
                            return res.json({r:401,error:'活动未开始！',datas:item,btn:'活动将开始于'+(1+curr_month)+'月'+curr_date+'日'})
                        }
                        if (currentTime > new Date(item.endTime)){
                            return res.json({r:402,error:'活动已结束！',datas:item})
                        }
                        oldItem.beginTime = item.beginTime;
                        oldItem.endTime = item.endTime;
                        oldItem.created = item.created;
                    } else {
                        return res.json({r:404,error:'无效活动'});
                    }
                    res.json({r:mQRCodeActivityJoin.status,datas:oldItem});
                },mCustomer);
            } else {//20141020以前的老数据
                return res.json({r:404,error:'无效活动'});
            }
        } else {//未参加返利活动的
            getActivityInfo({_id: req.query.id, status: 1},function(err,item){
                if (err) return res.json({r:500,error:err.message});

                var oldItem = JSON.parse(JSON.stringify(item));
                oldItem.aid = item._id;
                if(item){
                    var currentTime = new Date();
                    var beginTime = new Date(item.beginTime);
                    if (currentTime < beginTime){
                        var curr_date = beginTime.getDate();
                        var curr_month = beginTime.getMonth();
                        return res.json({r:401,error:'活动未开始！',datas:oldItem,btn:'活动将开始于'+(1+curr_month)+'月'+curr_date+'日'})
                    }
                    if (currentTime > new Date(item.endTime)){
                        return res.json({r:402,error:'活动已结束！',datas:oldItem})
                    }
                } else {
                    return res.json({r:404,error:'无效活动'});
                }
                var resutl = {r:-1,datas:oldItem};//r == -1 未加入活动
                if(0 == oldItem.autoPass || 2 == oldItem.autoPass){
                    resutl.alert = '申请返利活动，需要商家审核后生效(未生效时购买的商品不返利)';
                }

                console.log('resutl====',resutl);
                return res.json(resutl);
            },mCustomer);
        }
    });
}
function doPost(req,res,next){
    next();
}

/**
 * 获得码店信息
 * @param filter
 * @param callback
 * @param customer
 */
function getActivityInfo(filter,callback,customer){
    QRCodeActivityDao.load(filter,{'products.product': 'nameinmobile name sellprice price mobileimages',raffles:'name imageLink image url'}, null, function(err, item){
        if (err) return callback(err);
        if(!item) return callback(new Error('无效活动'));


        setCommissionAndTime(item,function(err,item){
            if (err) return callback(err);

            var raffles = item.raffles;
            for(var i=0;i<raffles.length;i++){
                raffles[i].imageLink = raffles[i].image && raffles[i].image.url ? raffles[i].image.url : '';
                delete raffles[i].image;
            }
            item.raffles = raffles;

            Affiliate.load(item.affiliate,function(err,aitem){
                if(!aitem || aitem.status == -1) //码商被禁用
                    return callback(new Error('无效活动'));
                callback(null,item);
            });
        },customer);

    });
}

/**
 * 设置码店时间以及店中商品的返利金额
 * @param item
 * @param callback
 * @param customer
 */
function setCommissionAndTime(item,callback,customer){
    var newItem = JSON.parse(JSON.stringify(item));
    delete newItem.filter;
    delete newItem.link;
    delete newItem.is_fee_setting;
    delete newItem.uuid;
    delete newItem.date_modified;
    delete newItem.is_amount_setting;
    delete newItem.__v;

    newItem.beginTime = moment(item.beginTime).format('YYYY-MM-DD HH:mm:ss');
    newItem.endTime = moment(item.endTime).format('YYYY-MM-DD HH:mm:ss');
    newItem.created = moment(item.created).format('YYYY-MM-DD HH:mm:ss');

    if(item.products && item.products.length > 0 && (0 == item.products[0].selffee || item.products[0].selffee)){

        var affiliateForCoupon;
        var affiliateId = item.affiliate;
        var datas = [];
        async.forEachSeries(item.products, function(p_item, callback) {
            var data = {
                product:JSON.parse(JSON.stringify(p_item.product))
            };

            var productId = p_item.product._id;
            async.series([
                function(callback) {//处理商品返利金额
                    if(p_item.product.sellprice && p_item.selffee){
                        var commission = (p_item.product.sellprice * p_item.selffee /100).toFixed(2);

                        if(commission - item.amount > 0){//产品设置的佣金大于活动总的返利
                            commission = item.amount;
                        }
                        data.commission = commission;
                        data.product.mobileimages = JSON.parse(JSON.stringify(p_item.product.mobileimages,['thumbnailUrl','url']));
                    }
                    delete data.sort_order;
                    callback();
                },
                function(callback){
                    affiliateDao.load({_id:affiliateId},null,null,function(err,item){
                        if(err) return callback(err);
                        if(!item) return callback(new Error('码商未找到'));
                        if(-1 == item.status) return callback(new Error('产品不可用'));

                        affiliateForCoupon = item.parent ? item.parent : item._id;
                        callback();
                    });
                },
                function(callback){//查询是否有抽奖
                    var option = {
                        filter: {
                            product: productId,
                            affiliate: affiliateId,
                            status: 1
                        }
                    };
                    raffleApplyDao.list(option,null,null,function(err,items){
                        if (err) return callback(err);
                        var raffle = {
                            hasRaffle: false
                        };
                        if(items && items.length){
                            raffle.hasRaffle = true;
                            raffle._id = items[0].raffle;
                        }

                        data.raffle = raffle;
                        callback();
                    });
                },
                function(callback){//查询是否有红包
                    CouponService.queryCouponsByProductForCustomer({product: productId,affiliate: affiliateForCoupon,customer:customer},function(err,items){
                        if (err) return callback(err);

                        var coupon = {
                            hasCoupon: false
                        };

                        if(items && items.length){
                            coupon.hasCoupon = true;
                            coupon.items = items;
                        }

                        data.coupon = coupon;
                        callback();
                    })
                },
                function(callback){//查询是否有促销品
                    SaleService.querySalesByProduct({
                        product:productId,
                        affiliate:affiliateForCoupon
                    },function(err,items){
                        if (err) return callback(err);
                        if(items && items.length){
                            data.sale = {
                                hasSale: true,
                                items: items
                            };
                        } else {
                            data.sale = {
                                hasSale: false
                            };
                        }

                        callback();
                    });
                }
            ], function(err) {
                if (err) return callback(err);
                datas.push(data);
                callback();
            });

        }, function(err) {
            if (err) return callback(err);
            newItem.products = datas;
            callbackNew(newItem,callback);
        });
    } else {
        callbackNew(newItem,callback);
    }
}

function callbackNew(newItem,callback){
    carCodeshopHasParkingDao.load({codeshop:newItem._id},null,null,function(err,item){
        if(err) return callback(err);
        if(item && item.properties && item.properties.length) {
            newItem.hasPark = true;
        } else {
            newItem.hasPark = false;
        }
        callback(null,newItem);
    });
}