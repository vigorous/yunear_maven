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
				<a href="#">XX管理</a>
			</li>
			<li class="active">XX管理</li>
		</ul><!-- /.breadcrumb -->
	</div>
	<!-- /section:basics/content.breadcrumbs -->

	<!-- page-content -->
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				
				<div class="row">
					<div class="col-sm-12">
						<!-- #section:elements.tab.option -->
						<div class="tabbable">
							<ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab">
								<li>
									<a data-toggle="tab" href="#product_info">产品档案信息</a>
								</li>

								<li  class="active">
									<a data-toggle="tab" href="#product_technology">产品工艺信息</a>
								</li>

								<li>
									<a data-toggle="tab" href="#product_material">产品物料信息</a>
								</li>
							</ul>

							<div class="tab-content">
								<div id="product_info" class="tab-pane">
									<!-- <p>Raw denim you probably haven't heard of them jean shorts Austin.</p> -->
									<iframe name="mainFrame" id="mainFrame" frameborder="0"
										src="<%=basePath%>/product/goEdit.do" style="margin: 0 auto; width: 100%; height: 100%;overflow-x:hidden;"></iframe>
								</div>

								<div id="product_technology" class="tab-pane in active">
									<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
								</div>

								<div id="product_material" class="tab-pane">
									<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade.</p>
								</div>
							</div>
						</div>

						<!-- /section:elements.tab.option -->
					</div><!-- /.col -->
				</div><!-- /.row -->
				
				
			</div><!-- /.col-xs-12 -->
		</div><!--/.row-->
	</div><!--/.page-content-->
</div><!--/.main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		
		<!-- 引入 -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
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
		
		<!-- <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> -->
		<script type="text/javascript" src="layer-v2.1/layer/layer.js"></script>
		<script type="text/javascript" src="layer-v2.1/layer/extend/layer.ext.js"></script>
		
		
		<script type="text/javascript">
		
		$(window.parent.hangge());
				
		$(function() {
			$("#myTab > li")
		});
		</script>
	</body>
</html>

