<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
		<%@ include file="../system/admin/top.jsp"%> 
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/jquery-ui.custom.css" />
		
		
		<link rel="stylesheet" href="js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="js/zTree_v3/css/metroStyle/metroStyle.css" type="text/css">
		<!-- <script type="text/javascript" src="js/zTree_v3/js/jquery-1.4.4.min.js"></script> -->
		<script type="text/javascript" src="js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="js/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
	</head>
<body>

<!-- main-container -->
<div class="main-container">
	<!-- #section:basics/content.breadcrumbs -->
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="javascript:void(0);">XX管理</a>
			</li>
			<li class="active">XX管理</li>
		</ul><!-- /.breadcrumb -->
	</div>
	<!-- /section:basics/content.breadcrumbs -->

	<div class="main-content">
	<div class="main-content-inner">
	<!-- page-content -->
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				
				<div class="row">
					<div class="col-xs-12 col-sm-3 widget-container-col ui-sortable">
						<!-- #section:custom/widget-box -->
						<div class="widget-box ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title">产品分类</h5>
					
								<!-- #section:custom/widget-box.toolbar -->
								<div class="widget-toolbar">
									<div class="widget-menu">
										<a data-toggle="dropdown" data-action="settings" href="#">
											<i class="ace-icon fa fa-bars"></i>
										</a>
					
										<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
											<li>
												<a onclick="addProductClass();" data-toggle="tab">添加产品分类</a>
											</li>
					
											<li>
												<a href="#dropdown2" data-toggle="tab">Option#2</a>
											</li>
										</ul>
									</div>
					
									<a class="orange2" data-action="fullscreen" href="#">
										<i class="ace-icon fa fa-expand"></i>
									</a>
					
									<a data-action="reload" href="#">
										<i class="ace-icon fa fa-refresh"></i>
									</a>
					
									<a data-action="collapse" href="#">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
					
									<a data-action="close" href="#">
										<i class="ace-icon fa fa-times"></i>
									</a>
								</div>
					
								<!-- /section:custom/widget-box.toolbar -->
							</div>
					
							<div class="widget-body">
								<div class="widget-main">
									<ul id="treeDemo" class="ztree" style="overflow: auto;"></ul>
								</div>
							</div>
						</div>
					
						<!-- /section:custom/widget-box -->
					</div>
					
					<div class="col-xs-12 col-sm-9 widget-container-col ui-sortable">
						<!-- #section:custom/widget-box -->
						<div class="widget-box ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title">产品分类明细</h5>
					
								<!-- #section:custom/widget-box.toolbar -->
								<div class="widget-toolbar">
									<div class="widget-menu">
										<a data-toggle="dropdown" data-action="settings" href="#">
											<i class="ace-icon fa fa-bars"></i>
										</a>
					
										<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
											<li>
												<a href="#dropdown1" data-toggle="tab">Option#1</a>
											</li>
					
											<li>
												<a href="#dropdown2" data-toggle="tab">Option#2</a>
											</li>
										</ul>
									</div>
					
									<a class="orange2" data-action="fullscreen" href="#">
										<i class="ace-icon fa fa-expand"></i>
									</a>
					
									<a data-action="reload" href="#">
										<i class="ace-icon fa fa-refresh"></i>
									</a>
					
									<a data-action="collapse" href="#">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
					
									<a data-action="close" href="#">
										<i class="ace-icon fa fa-times"></i>
									</a>
								</div>
					
								<!-- /section:custom/widget-box.toolbar -->
							</div>
					
							<div class="widget-body">
								<div class="widget-main">
									<p class="alert alert-info">
										Nunc aliquam enim ut arcu aliquet adipiscing. Fusce dignissim volutpat justo non consectetur. Nulla fringilla eleifend consectetur.
									</p>
									<p class="alert alert-success">
										Raw denim you probably haven't heard of them jean shorts Austin.
									</p>
								</div>
							</div>
						</div>
					
						<!-- /section:custom/widget-box -->
					</div>
				</div>
							
			</div><!-- /.col-xs-12 -->
		</div><!--/.row-->
		
	</div><!--/.page-content-->
	</div>
	</div>
</div><!--/.main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		
		<!-- 引入 -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->

		<!--[if IE]-->
		<!-- <script type="text/javascript">
			window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script> -->
		<!--[endif]-->
		
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="Ace_Admin_1.3.3/assets/js/bootstrap.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/bootbox.js"></script>
		<!-- page specific plugin scripts -->
		<!--[if lte IE 8]>
		  <script src="Ace_Admin_1.3.3/assets/js/excanvas.js"></script>
		<![endif]-->
		<script src="Ace_Admin_1.3.3/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/date-time/moment.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/chosen.jquery.js"></script>
		
		<!-- page specific plugin scripts -->
		<script src="Ace_Admin_1.3.3/assets/js/jquery-ui.custom.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/jquery.ui.touch-punch.js"></script>
		
		<!-- ace scripts -->
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.scroller.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.colorpicker.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.fileinput.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.typeahead.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.spinner.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.treeview.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.wizard.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.aside.js"></script>
		
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.js"></script>
		
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.ajax-content.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.touch-drag.js"></script>
		
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.sidebar.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.submenu-hover.js"></script>
		
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.widget-box.js"></script>
		
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings-skin.js"></script>
		
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.searchbox-autocomplete.js"></script>
		
		<!-- <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> -->
		<script type="text/javascript" src="layer-v2.1/layer/layer.js"></script>
		<script type="text/javascript" src="layer-v2.1/layer/extend/layer.ext.js"></script>
		
		<script type="text/javascript">
		
			$(window.parent.hangge());
		
			var setting = {
	        	view: {
	                addHoverDom: addHoverDom,
	                removeHoverDom: removeHoverDom,
	                selectedMulti: false
	            },
	            check: {
	                enable: false
	            },
	            data: {
	                simpleData: {
	                    enable: true
	                }
	            },
	            edit: {
	                enable: true
	            },
	            callback:{
	            	onClick: zTreeOnClick,
	            	beforeRename: zTreeBeforeRename,
	            	beforeRemove: zTreeBeforeRemove,
	            	onDrag: zTreeOnDrag,
	            	onDragMove: zTreeOnDragMove
	            }
	         };
         
         	var zNodes = [{"pId":"0","id":"f7687a5c2ea14c55b84431bc6c4f4ee1","name":"烟标"}];
		
			$(document).ready(function(){
            	
        	});

         	var newCount = 1;
			function addHoverDom(treeId, treeNode) {
	             var sObj = $("#" + treeNode.tId + "_span");
	             if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
	             var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
	                 + "' title='add node' onfocus='this.blur();'></span>";
	             sObj.after(addStr);
	             var btn = $("#addBtn_"+treeNode.tId);
	             if (btn) btn.bind("click", function(){
	                 var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	                 
	                 //判断是否添加节点
	                 layer.confirm('确定添加分类吗？',{icon: 3, title:'提示'},function(index){
						layer.close(index);
						zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
					 },function(index){
						 layer.close(index);
					 });
	                 
	                 
	                 return false;
	             });
	        };
            function removeHoverDom(treeId, treeNode) {
            	$("#addBtn_"+treeNode.tId).unbind().remove();
         	};
         
            /*单击 */
            function zTreeOnClick(event, treeId, treeNode){
         		//layer.alert(treeNode.tId +", "+ treeNode.id + ", " + treeNode.name);
            }
         
            /* 编辑 */
            function zTreeBeforeRename(treeId, treeNode, newName, isCancel) {
            	layer.prompt({
	            	formType: 0,
	            	value: '',
	            	title: '修改分类名称'
	        	}, function(value, index, elem){
		            $.ajax({
						type: "POST",
						url: '<%=basePath%>/productclass/editProductClass.do?',
				    	data: {CLASS_NAME:value,PRODUCTCLASS_ID:treeNode.id},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							if(data[0].msg == "success"){
								layer.msg("修改成功！");
							}else{
								
							}
						},
						error:function(XMLHttpRequest, textStatus, errorThrown){
							layer.alert("修改失败！");
						}
					});
	            	layer.close(index);
	        	});
       	 	}
            /* 拖拽目标节点信息 */
            function zTreeOnDragMove(event, treeId, treeNodes) {
            	layer.msg(treeId);
            };
            
            /* 被拖拽的节点信息 */
            function zTreeOnDrag(event, treeId, treeNodes) {
            	//var arr = new Array(treeNodes);
                alert(treeNodes[0].id);
            };
            
            /* 删除 */
			function zTreeBeforeRemove(treeId, treeNode) {
        	 
        		layer.confirm('确定删除该分类吗?', {icon: 3, title:'提示'}, function(index){
       		    	$.ajax({
						type: "POST",
						url: '<%=basePath%>/productclass/deleteProductClass.do?',
			    		data: {PRODUCTCLASS_ID:treeNode.id},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							if(data[0].msg == "success"){
								layer.alert("删除成功！");
							}else{
								
							}
						},
						error:function(XMLHttpRequest, textStatus, errorThrown){
							layer.alert("删除失败！");
						}
					});
       		    	
       		    	layer.close(index);
       		    	return true;
       			});
       	 	}
            /* 添加产品分类 */
            function addProductClass(){
	        	layer.prompt({
	            	formType: 0,
	            	value: '',
	            	title: '分类名称'
	        	}, function(value, index, elem){
	            	//layer.alert(value+","+index+","+elem); //得到value
		            $.ajax({
						type: "POST",
						url: '<%=basePath%>/productclass/addProductClass.do?',
				    	data: {CLASS_NAME:value},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							//alert(data[0].msg);
							if(data[0].msg == "success"){
								var zTree = $.fn.zTree.getZTreeObj("treeDemo");
								zTree.addNodes(null, {id:data[0].PRODUCTCLASS_ID, pId:0, name:value});
							}else{
								
							}
						},
						error:function(XMLHttpRequest, textStatus, errorThrown){
							alert("error");
						}
					});
	            	layer.close(index);
	        	});
         	};
		
			$(function() {
				//json字符串转换成json对象eval(jsonStr)
				zNodes = eval('${zTreeNodes}');
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				
			 	/* $('.widget-container-col').sortable({
			        connectWith: '.widget-container-col',
					items:'> .widget-box',
					handle: ace.vars['touch'] ? '.widget-header' : false,
					cancel: '.fullscreen',
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'widget-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					start: function(event, ui) {
						//when an element is moved, it's parent becomes empty with almost zero height.
						//we set a min-height for it to be large enough so that later we can easily drop elements back onto it
						ui.item.parent().css({'min-height':ui.item.height()})
						//ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
					},
					update: function(event, ui) {
						ui.item.parent({'min-height':''})
						//p.style.removeProperty('background-color');
					}
			    }); */
			});
		</script>
	</body>
</html>

