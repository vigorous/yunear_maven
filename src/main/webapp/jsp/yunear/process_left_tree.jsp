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
	<link type="text/css" rel="stylesheet" href="js/zTree/zTreeStyle.css" />
	</head>
<body>
		
<div class="container-fluid" id="main-container">

	<!-- <div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i><a>树形结构</a>
					<span class="divider"><i class="icon-angle-right"></i></span></li>
			</ul>.breadcrumb
		</div>#breadcrumbs
	</div> -->

<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
		 
		 <div class="span12">
		 	<div id="zhongxin">
				<ul id="tree" class="tree" style="overflow: auto;"></ul>
			</div>
		</div>
		 
	</div>
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->

</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<!-- <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a> -->
		
		<!-- 引入 -->
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
		<script type="text/javascript" src="js/jquery.tips.js"></script><!--提示框-->
		
		<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="js/zTree/jquery.ztree-2.6.min.js"></script>
		
		<script type="text/javascript">
		
		$(window.parent.parent.hangge());
		
		</script>
		
		<script type="text/javascript">
			var zTree;
			
			var zn = '${zTreeNodes}';
			var zTreeNodes = eval(zn);
			
			/* var setting = {
				data: {
					key: {
						title:"name"
					},
					simpleData: {
						enable: true
					}
				},
				callback: {
					onClick: onClick
				}
			};
			
			function onClick(event, treeId, treeNode, clickFlag) {
				showLog("[ "+getTime()+" onClick ]&nbsp;&nbsp;clickFlag = " + clickFlag + " (" + (clickFlag===1 ? "普通选中": (clickFlag===0 ? "<b>取消选中</b>" : "<b>追加选中</b>")) + ")");
			}
			
			function getTime() {
				var now= new Date(),
				h=now.getHours(),
				m=now.getMinutes(),
				s=now.getSeconds();
				return (h+":"+m+":"+s);
			} */
			
			var setting = {
				showLine : true,
				checkable : false,
				callback : {
					click : zTreeOnClick,
				}
			};
			function zTreeOnClick(event, treeId, treeNode) {
				alert(treeNode.tId + ", " + treeNode.name);
			}
			/* var zn = '${zTreeNodes}';
			var zTreeNodes = eval(zn); */
			zTree = $("#tree").zTree(setting, zTreeNodes);
			
			$(function() {
				
				/* $.fn.zTree.init($("#tree"), setting, zTreeNodes); */
			});
		</script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		
	</body>
</html>

