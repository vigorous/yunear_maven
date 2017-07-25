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
		<base href="<%=basePath%>">
		
		<meta charset="utf-8" />
		<title>产品明细信息</title>
		
		<!-- <meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
		<meta name="description" content="overview &amp; stats" />
  		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
		<meta charset="utf-8">
		
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/font-awesome.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/ace-fonts.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/jquery-ui.custom.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/chosen.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/datepicker.css" />
		<!-- 下拉框 -->

		<!-- <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script> -->
		
		
		
		
		<!-- <link rel="stylesheet" type="text/css" media="screen" href="combogrid_1.6.3/css/smoothness/jquery-ui-1.10.1.custom.css"/>
		<script type="text/javascript" src="combogrid_1.6.3/jquery/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="combogrid_1.6.3/jquery/jquery-ui-1.10.1.custom.min.js"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="combogrid_1.6.3/css/smoothness/jquery.ui.combogrid.css"/>
		<script type="text/javascript" src="combogrid_1.6.3/plugin/jquery.ui.combogrid-1.6.2.js"></script> -->
		
<script type="text/javascript">

	//保存
	function save(){
		if($("#PRODUCT_NAME").val()==""){
			$("#PRODUCT_NAME").tips({
				side:3,
	            msg:'请输入产品名称',
	            bg:'#AE81FF',
	            time:2
	        });
	        //layer.msg('请输入产品名称');
			//layer.tips('请输入产品名称', '#PRODUCT_NAME',{tips:1});
			$("#PRODUCT_NAME").focus();
			return false;
		}
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<!-- .main-container -->
	<div id="main-container" class="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<!-- .page-content -->
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<!-- form -->
							<form class="form-horizontal" role="form" action="product/${msg }.do" name="Form" id="Form" method="post">
								<input type="hidden" name="PRODUCT_ID" id="PRODUCT_ID" value="${pd.PRODUCT_ID}"/>
								<div id="zhongxin">
								
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right" for="PRODUCT_NAME">产品名称:</label>
										<div class="col-sm-5">
											<input type="text" id="PRODUCT_NAME" name="PRODUCT_NAME" value="${pd.PRODUCT_NAME}" title="产品名称"
												   maxlength="32" placeholder="这里输入产品名称" class="form-control">
										</div>
									</div>
									
									<!-- form-group -->
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right" for="STATUS">状态:</label>
										<div class="col-sm-10">
											<input type="text" id="STATUS" name="STATUS" value="${pd.STATUS}" title="状态"
												   maxlength="32" placeholder="这里输入状态" class="form-control">
										</div>
									</div>
									
									<!-- form-group -->
									<div class="form-group" style="text-align: center">
										<a class="btn btn-small btn-primary" onclick="save();">保存</a>
										<a class="btn btn-small btn-danger" onclick="closeWin();">取消</a>
										<!-- <a class="btn btn-small btn-danger" onclick="top.Dialog.close();">取消</a> -->
									</div>
									
									<!-- <input size="30" id="project"/> -->
								</div>
								
								<!-- 提交动画 -->
								<div id="zhongxin2" class="center" style="display:none">
									<br/><br/><br/><br/><br/>
									<img src="images/jiazai.gif" />
									<br/>
									<h4 class="lighter block green">提交中...</h4>
								</div>
							</form>
							<!-- /form -->
						</div>
					</div>
				</div>
				<!-- /.page-content -->
			</div>
		</div>
	</div>
	<!-- /.main-container -->
	
	
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
		
		<!-- <script src="Ace_Admin_1.3.3/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/date-time/moment.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/chosen.jquery.js"></script> -->
		
		<!-- <script src="js/jquery.tips.js"></script>
		<script src="layer-v2.1/layer/layer.js"></script>
		<script src="layer-v2.1/layer/extend/layer.ext.js"></script> -->
		
		
		
		<script type="text/javascript">
			$(window.parent.hangge());
			
			$(function() {
				
				//layer.config({extend: 'layer-v2.1/layer/extend/layer.ext.js'})
				
				<%-- $( "#project" ).combogrid({
					url: '<%=basePath%>/product/comboGrid.do',
					debug:true,
			    //replaceNull: true,
					colModel: [{'columnName':'PRODUCT_ID','width':'10','label':'ID'}, 
					           {'columnName':'PRODUCT_NAME','width':'60','label':'产品名称'},
					           {'columnName':'STATUS','width':'30','label':'状态'}],
					select: function( event, ui ) {
						$( "#project" ).val( ui.item.name );
						return false;
					}
				}); --%>
			});
			
			function closeWin(){
				//当你在iframe页面关闭自身时
				//先得到当前iframe层的索引
				/* var index = parent.layer.getFrameIndex(window.name);
				layer.alert(index);
		      	parent.layer.close(); //再执行关闭 */
			}
		</script>
</body>
</html>