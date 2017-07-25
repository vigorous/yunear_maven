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
	<!-- <link rel="stylesheet" href="js/zTree_v3/css/demo.css" type="text/css"> -->
	<link type="text/css" rel="stylesheet" href="js/zTree/zTreeStyle.css" />
	</head>
	
	
<body>
	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a>生产管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
				<li class="active">工序信息</li>
			</ul><!--.breadcrumb-->
			
			<div id="nav-search">
			</div><!--#nav-search-->
		</div><!--#breadcrumbs-->

	<div id="page-content" class="clearfix">
	  	<div class="row-fluid">
			<div class="row-fluid">
				
				<div class="span2">
					<div class="widget-box">
						<div class="widget-header">
							<h5>树形结构</h5>
						</div>
						<div class="widget-body">
								<div id="zhongxin">
									<ul id="tree" class="tree" style="overflow: auto;"></ul>
								</div>
								<!-- <iframe style="margin: 0 auto; width: 100%; height: auto;" frameborder="0" 
				    				src="process/right_content.do" name="frm2" id="frm2" onscroll="false"/> -->
			    		</div>
					</div>
				</div>
				
				<div class="span10">
					<div class="widget-box">
						<div class="widget-header">
							<h5>查询结果</h5>
						</div>
						<div class="widget-body">
							<div id="div1">
								<!-- <iframe style="margin: 0 auto; width: 100%; height: auto;" frameborder="0" 
				    				src="process/list.do" name="frm1" id="frm1" onscroll="auto"/> -->
							</div>
			    		</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
		
		
		
		<script type="text/javascript">window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/ace-elements.min.js"></script>
		<script src="js/ace.min.js"></script>
		
		<script type="text/javascript" src="js/jquery-ui-1.10.2.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.ui.touch-punch.min.js"></script>
		<script type="text/javascript" src="js/jquery.slimscroll.min.js"></script>
		<script type="text/javascript" src="js/jquery.easy-pie-chart.min.js"></script>
		<script type="text/javascript" src="js/jquery.sparkline.min.js"></script>
		<script type="text/javascript" src="js/jquery.flot.min.js"></script>
		<script type="text/javascript" src="js/jquery.flot.pie.min.js"></script>
		<script type="text/javascript" src="js/jquery.flot.resize.min.js"></script>
		
		<script type="text/javascript" src="js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="js/jquery.tips.js"></script><!-- 提示框 -->
		
		<!-- <script type="text/javascript" src="js/zTree_v3/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="js/zTree_v3/js/jquery.ztree.core-3.5.min.js"></script> -->
		<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="js/zTree/jquery.ztree-2.6.min.js"></script>
		
		<script type="text/javascript">
			$(window.parent.hangge());
		</script>
		
		<script type="text/javascript">
		var zTree;
		
		var zn = '${zTreeNodes}';
		var zTreeNodes = eval(zn);
		
		var setting = {
			showLine : true,
			checkable : false,
			callback : {
				click : zTreeOnClick,
			}
		};
		function zTreeOnClick(event, treeId, treeNode) {
			alert(treeNode.tId + ", " + treeNode.name);
			$("#div1").empty();
			$("#div1").append("<iframe style='margin: 0 auto; width: 100%; height: 550px;' frameborder='0' src='process/list.do' name='frm1' id='frm1' onscroll='auto'/>");
		}
		zTree = $("#tree").zTree(setting, zTreeNodes);
		
		$(function() {
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			
		});
		</script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
</body>
</html>

