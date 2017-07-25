<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="top.jsp"%>

	<style type="text/css">
		.commitopacity {
			position: absolute;
			width: 100%;
			height: 100px;
			background: #7f7f7f;
			filter: alpha(opacity = 50);
			-moz-opacity: 0.8;
			-khtml-opacity: 0.5;
			opacity: 0.5;
			top: 0px;
			z-index: 99999;
		}
	</style>


</head>
<body class="no-skin">

	<!-- 页面顶部¨ -->
	<%@ include file="head.jsp"%>

	<div id="main-container" class="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<!-- menu toggler -->

		<!-- 左侧菜单 -->
		<%@ include file="left.jsp"%>
		
		
		<div class="main-content">
		
			<div id="jzts" style="display: none; width: 100%; position: fixed; z-index: 99999999;">
				<div class="commitopacity" id="bkbgjz"></div>
				<div style="padding-left: 16%; padding-top: 2px;">
					<div style="float: left; margin-top: 7px;">
						<img src="images/loadingi.gif" />
					</div>
					<div>
						<h4 class="lighter block red">&nbsp;加载中 ...</h4>
					</div>
				</div>
			</div>
			
			<!-- 换肤 -->
			<div id="ace-settings-container" class="ace-settings-container">
				
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
					<i class="ace-icon fa fa-cog bigger-130"></i>
				</div>
				
				<div class="ace-settings-box clearfix" id="ace-settings-box">
					<div class="pull-left width-50">
						<!-- #section:settings.skins -->
						<div class="ace-settings-item">
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="no-skin" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>
						<!-- /section:settings.navbar -->
						
						<!-- #section:settings.navbar -->
						<!-- <div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
						</div> -->
						<!-- /section:settings.navbar -->
						<!-- #section:settings.sidebar -->
						<!-- <div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div> -->

						<!-- /section:settings.sidebar -->

						<!-- #section:settings.breadcrumbs -->
						<!-- <div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div> -->

						<!-- /section:settings.breadcrumbs -->

						<!-- #section:settings.rtl -->
						<!-- <div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div> -->

						<!-- /section:settings.rtl -->

						<!-- #section:settings.container -->
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								Inside
								<b>.container</b>
							</label>
						</div>
						
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
							<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
						</div>
						<!-- /section:settings.container -->
					</div>
					
					<div class="pull-left width-50">
						<!-- #section:basics/sidebar.options -->
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
							<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
						</div>

						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
							<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
						</div>
						<!-- /section:basics/sidebar.options -->
					</div><!-- /.pull-left -->
					
				</div>
			</div>
			<!-- /换肤 -->
			
			<!-- #main-content-inner -->
			<!-- <div> -->
			<iframe name="mainFrame" id="mainFrame" frameborder="0"
							src="login_default.do" style="margin: 0 auto; width: 100%; height: 100%;overflow-x:hidden;"></iframe>
			<!-- </div> -->
			<!-- /#main-content-inner -->
			
		</div><!-- /.main-content -->
		
		<div class="footer">
			<div class="footer-inner">
				<!-- #section:basics/footer -->
				<div class="footer-content">
					<span class="bigger-120">
						<span class="blue bolder">Ace</span>
						杭州逐旭智能科技有限公司 &copy; 2016
					</span>

					&nbsp; &nbsp;
					<span class="action-buttons">
						<a href="#">
							<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
						</a>

						<a href="#">
							<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
						</a>

						<a href="#">
							<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
						</a>
					</span>
				</div>

				<!-- /section:basics/footer -->
			</div>
		</div>

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		
	</div><!-- /.main-container -->
	
	<!-- basic scripts -->
	<!-- 引入 -->
	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.js'>"+"<"+"/script>");
	</script>
	
	<script type="text/javascript">
		window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>

	<!-- <![endif]-->

	<!--[if IE]>
	<script type="text/javascript">
	 window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery1x.js'>"+"<"+"/script>");
	</script>
	<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
	</script>
	<script src="Ace_Admin_1.3.3/assets/js/bootstrap.js"></script>

	<!-- page specific plugin scripts -->

	<!--[if lte IE 8]>
	  <script src="Ace_Admin_1.3.3/assets/js/excanvas.js"></script>
	<![endif]-->
	<script src="Ace_Admin_1.3.3/assets/js/jquery-ui.custom.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/jquery.ui.touch-punch.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/jquery.easypiechart.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/jquery.sparkline.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/flot/jquery.flot.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/flot/jquery.flot.pie.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/flot/jquery.flot.resize.js"></script>
	
	
	<script src="Ace_Admin_1.3.3/assets/js/chosen.jquery.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/fuelux/fuelux.spinner.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/date-time/bootstrap-datepicker.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/date-time/bootstrap-timepicker.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/date-time/moment.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/date-time/daterangepicker.js"></script>
	<script src="Ace_Admin_1.3.3/assets/js/date-time/bootstrap-datetimepicker.js"></script>

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

	
	<!-- <script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/myjs/menusf.js"></script> -->

	<script type="text/javascript">
		/* $(function() {
			if (typeof ($.cookie('menusf')) == "undefined") {
				$("#sidebar").attr("class", "");
			} else {
				$("#menusf").attr("checked", true);
				$("#sidebar").attr("class", "menu-min");
			}
		}); */
		function cmainFrame() {
			var hmain = document.getElementById("mainFrame");
			var bheight = document.documentElement.clientHeight;
			hmain.style.width = '100%';
			hmain.style.height = (bheight-51) + 'px';
			var bkbgjz = document.getElementById("bkbgjz");
			bkbgjz.style.height = (bheight-41) + 'px';
		}
		cmainFrame();
		window.onresize = function() {
			cmainFrame();
		}
		jzts();
	</script>
</body>
</html>
