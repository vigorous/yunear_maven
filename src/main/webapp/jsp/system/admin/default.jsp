<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>

</head>
<body>
	
	<div class="main-content-inner">
		<!-- #section:basics/content.breadcrumbs -->
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>

			<ul class="breadcrumb">
				<li>
					<i class="ace-icon fa fa-home home-icon"></i>
					<a href="#">Home</a>
				</li>
				<li class="active">Dashboard</li>
			</ul><!-- /.breadcrumb -->
		</div>
		<!-- /section:basics/content.breadcrumbs -->
	
		<div class="page-content">
		
			<div class="page-header">
				<h1>
					Dashboard
					<small>
						<i class="ace-icon fa fa-angle-double-right"></i>
						overview &amp; stats
					</small>
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					
					<div class="row">
						<div class="space-6"></div>

						<div class="col-sm-7 infobox-container">
							<!-- #section:pages/dashboard.infobox -->
							<div class="infobox infobox-green">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-comments"></i>
								</div>

								<div class="infobox-data">
									<span class="infobox-data-number">32</span>
									<div class="infobox-content">comments + 2 reviews</div>
								</div>

								<!-- #section:pages/dashboard.infobox.stat -->
								<div class="stat stat-success">8%</div>

								<!-- /section:pages/dashboard.infobox.stat -->
							</div>

							<div class="infobox infobox-blue">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-twitter"></i>
								</div>

								<div class="infobox-data">
									<span class="infobox-data-number">11</span>
									<div class="infobox-content">new followers</div>
								</div>

								<div class="badge badge-success">
									+32%
									<i class="ace-icon fa fa-arrow-up"></i>
								</div>
							</div>

							<div class="infobox infobox-pink">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-shopping-cart"></i>
								</div>

								<div class="infobox-data">
									<span class="infobox-data-number">8</span>
									<div class="infobox-content">new orders</div>
								</div>
								<div class="stat stat-important">4%</div>
							</div>

							<div class="infobox infobox-red">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-flask"></i>
								</div>

								<div class="infobox-data">
									<span class="infobox-data-number">7</span>
									<div class="infobox-content">experiments</div>
								</div>
							</div>

							<div class="infobox infobox-orange2">
								<!-- #section:pages/dashboard.infobox.sparkline -->
								<div class="infobox-chart">
									<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
								</div>

								<!-- /section:pages/dashboard.infobox.sparkline -->
								<div class="infobox-data">
									<span class="infobox-data-number">6,251</span>
									<div class="infobox-content">pageviews</div>
								</div>

								<div class="badge badge-success">
									7.2%
									<i class="ace-icon fa fa-arrow-up"></i>
								</div>
							</div>

							<div class="infobox infobox-blue2">
								<div class="infobox-progress">
									<!-- #section:pages/dashboard.infobox.easypiechart -->
									<div class="easy-pie-chart percentage" data-percent="42" data-size="46">
										<span class="percent">42</span>%
									</div>

									<!-- /section:pages/dashboard.infobox.easypiechart -->
								</div>

								<div class="infobox-data">
									<span class="infobox-text">traffic used</span>

									<div class="infobox-content">
										<span class="bigger-110">~</span>
										58GB remaining
									</div>
								</div>
							</div>

							<!-- /section:pages/dashboard.infobox -->
							<div class="space-6"></div>

							<!-- #section:pages/dashboard.infobox.dark -->
							<div class="infobox infobox-green infobox-small infobox-dark">
								<div class="infobox-progress">
									<!-- #section:pages/dashboard.infobox.easypiechart -->
									<div class="easy-pie-chart percentage" data-percent="61" data-size="39">
										<span class="percent">61</span>%
									</div>

									<!-- /section:pages/dashboard.infobox.easypiechart -->
								</div>

								<div class="infobox-data">
									<div class="infobox-content">Task</div>
									<div class="infobox-content">Completion</div>
								</div>
							</div>

							<div class="infobox infobox-blue infobox-small infobox-dark">
								<!-- #section:pages/dashboard.infobox.sparkline -->
								<div class="infobox-chart">
									<span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>
								</div>

								<!-- /section:pages/dashboard.infobox.sparkline -->
								<div class="infobox-data">
									<div class="infobox-content">Earnings</div>
									<div class="infobox-content">$32,000</div>
								</div>
							</div>

							<div class="infobox infobox-grey infobox-small infobox-dark">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-download"></i>
								</div>

								<div class="infobox-data">
									<div class="infobox-content">Downloads</div>
									<div class="infobox-content">1,205</div>
								</div>
							</div>

							<!-- /section:pages/dashboard.infobox.dark -->
						</div>


						
					</div><!-- /.row -->

					<!-- #section:custom/extra.hr -->
					<div class="hr hr32 hr-dotted"></div>

					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.rows -->
			
			
			
			
			<div class="row">
				<div class="col-xs-12">
					
					<div class="row">
						<div class="space-6"></div>

						<div class="col-sm-7 infobox-container">
							<!-- #section:pages/dashboard.infobox -->
							<div class="infobox infobox-green">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-comments"></i>
								</div>

								<div class="infobox-data">
									<span class="infobox-data-number">32</span>
									<div class="infobox-content">comments + 2 reviews</div>
								</div>

								<!-- #section:pages/dashboard.infobox.stat -->
								<div class="stat stat-success">8%</div>

								<!-- /section:pages/dashboard.infobox.stat -->
							</div>

							<div class="infobox infobox-blue">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-twitter"></i>
								</div>

								<div class="infobox-data">
									<span class="infobox-data-number">11</span>
									<div class="infobox-content">new followers</div>
								</div>

								<div class="badge badge-success">
									+32%
									<i class="ace-icon fa fa-arrow-up"></i>
								</div>
							</div>

							<div class="infobox infobox-pink">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-shopping-cart"></i>
								</div>

								<div class="infobox-data">
									<span class="infobox-data-number">8</span>
									<div class="infobox-content">new orders</div>
								</div>
								<div class="stat stat-important">4%</div>
							</div>

							<div class="infobox infobox-red">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-flask"></i>
								</div>

								<div class="infobox-data">
									<span class="infobox-data-number">7</span>
									<div class="infobox-content">experiments</div>
								</div>
							</div>

							<div class="infobox infobox-orange2">
								<!-- #section:pages/dashboard.infobox.sparkline -->
								<div class="infobox-chart">
									<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
								</div>

								<!-- /section:pages/dashboard.infobox.sparkline -->
								<div class="infobox-data">
									<span class="infobox-data-number">6,251</span>
									<div class="infobox-content">pageviews</div>
								</div>

								<div class="badge badge-success">
									7.2%
									<i class="ace-icon fa fa-arrow-up"></i>
								</div>
							</div>

							<div class="infobox infobox-blue2">
								<div class="infobox-progress">
									<!-- #section:pages/dashboard.infobox.easypiechart -->
									<div class="easy-pie-chart percentage" data-percent="42" data-size="46">
										<span class="percent">42</span>%
									</div>

									<!-- /section:pages/dashboard.infobox.easypiechart -->
								</div>

								<div class="infobox-data">
									<span class="infobox-text">traffic used</span>

									<div class="infobox-content">
										<span class="bigger-110">~</span>
										58GB remaining
									</div>
								</div>
							</div>

							<!-- /section:pages/dashboard.infobox -->
							<div class="space-6"></div>

							<!-- #section:pages/dashboard.infobox.dark -->
							<div class="infobox infobox-green infobox-small infobox-dark">
								<div class="infobox-progress">
									<!-- #section:pages/dashboard.infobox.easypiechart -->
									<div class="easy-pie-chart percentage" data-percent="61" data-size="39">
										<span class="percent">61</span>%
									</div>

									<!-- /section:pages/dashboard.infobox.easypiechart -->
								</div>

								<div class="infobox-data">
									<div class="infobox-content">Task</div>
									<div class="infobox-content">Completion</div>
								</div>
							</div>

							<div class="infobox infobox-blue infobox-small infobox-dark">
								<!-- #section:pages/dashboard.infobox.sparkline -->
								<div class="infobox-chart">
									<span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>
								</div>

								<!-- /section:pages/dashboard.infobox.sparkline -->
								<div class="infobox-data">
									<div class="infobox-content">Earnings</div>
									<div class="infobox-content">$32,000</div>
								</div>
							</div>

							<div class="infobox infobox-grey infobox-small infobox-dark">
								<div class="infobox-icon">
									<i class="ace-icon fa fa-download"></i>
								</div>

								<div class="infobox-data">
									<div class="infobox-content">Downloads</div>
									<div class="infobox-content">1,205</div>
								</div>
							</div>

							<!-- /section:pages/dashboard.infobox.dark -->
						</div>


						
					</div><!-- /.row -->

					<!-- #section:custom/extra.hr -->
					<div class="hr hr32 hr-dotted"></div>

					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.rows -->
			
			<!-- <div id="jzts" style="display: none; width: 100%; position: fixed; z-index: 99999999;">
				<div class="commitopacity" id="bkbgjz"></div>
				<div style="padding-left: 16%; padding-top: 2px;">
					<div style="float: left; margin-top: 7px;">
						<img src="images/loadingi.gif" />
					</div>
					<div>
						<h4 class="lighter block red">&nbsp;加载中 ...</h4>
					</div>
				</div>
			</div> -->
			
			<!-- <div>
				<iframe name="mainFrame" id="mainFrame" frameborder="0"
					src="login_default.do" style="margin: 0 auto; width: 100%; height: 100%;"></iframe>
			</div> -->
			
		</div><!-- /.page-content -->
		
	</div><!-- /.main-content-inner -->
	
	<!--[if !IE]> -->
	<!-- <script type="text/javascript">
		window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.js'>"+"<"+"/script>");
	</script> -->
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

	<script type="text/javascript">
		$(window.parent.hangge());
	</script>
</body>
</html>
