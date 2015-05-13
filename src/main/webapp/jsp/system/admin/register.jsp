<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>My JSP 'Login.jsp' starting page</title>

		<meta name="description" content="User login page" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet"
			href="<%=basePath%>css/bootstrap.min.css" />
		<link rel="stylesheet"
			href="<%=basePath%>font-awesome/4.2.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet"
			href="//fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!-- ace styles -->
		<link rel="stylesheet" href="<%=basePath%>css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="dist/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet"
			href="<%=basePath%>dist/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="dist/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="dist/js/html5shiv.min.js"></script>
		<script src="dist/js/respond.min.js"></script>
		<![endif]-->
		<script type="text/javascript">
        function checkLength(){
  
       var password=document.getElementById("pwd"); //获取密码框值
   
    if(password.value.length<6){
         alert("密码长度必须大于六位小于十五位！");
    }
    if(password.value.length>15){
    	alert("密码长度必须大于六位小于十五位！");
    }
      
    }
    
     function checkLength1(){
  
       var password=document.getElementById("pwd1"); //获取密码框值
   
    if(password.value.length<6){
         alert("密码长度必须大于六位小于十五位！");
    }
    if(password.value.length>15){
    	alert("密码长度必须大于六位小于十五位！");
    }
      
    }
    
    function checkMobile(){
      var sMobile = document.getElementById("contactmobile").value;  
     if(sMobile!= null && sMobile != ''){
      if(!(/^1[3|5|8]\d{9}$/.test(sMobile))){ 
    	if(!(/^0\d{2,3}-?\d{7,8}$/.test(sMobile))){
    	 alert("联系方式不正确"); 
        return false; 
			}			
    	}
    }
} 

function checkMobile1(){ 
    var sMobile = document.getElementById("contactmobile1").value; 
    if(sMobile!=null&&sMobile!=''){
    	if(!(/^1[3|5|8]\d{9}$/.test(sMobile))){ 
    	if(!(/^0\d{2,3}-?\d{7,8}$/.test(sMobile))){
    	 alert("联系方式不正确"); 
        return false; 
			}			
    	}
    }
    
       
    } 
  </script>
	</head>

	<body class="login-layout">
		
							<!-- 版权方注册 -->
							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> 新用户注册
										</h4>

										<div class="space-6"></div>
										<p>
											版权方用户注册:
											<span style="color: red;">带*为必填项</span>
										</p>

										<form id="form1" method="post" action="<%=basePath%>user/add">
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="email" class="form-control" placeholder="邮箱"
															name="email" id="cemail" ONBLUR="CheckMail()" /> <i
														class="ace-icon fa fa-envelope">*</i> </span>
												</label>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="用户名"
															name="username" /> <i class="ace-icon fa fa-user">*</i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="企业名"
															name="corporationname" /> <i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="password" class="form-control" placeholder="密码"
															name="password" id="pwd" onblur="checkLength();" /> <i
														class="ace-icon fa fa-lock">*</i> </span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="password" class="form-control" placeholder="再次输入"
															name="cpassword" id="rpwd" ONBLUR="validate()" /> <i
														class="ace-icon fa fa-lock">*</i> </span>
												</label>
												<label>
													<span id="tishi" class="block input-icon input-icon-right"
														style="font-size: 10"></span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="银行帐号"
															name="bankaccount" /> <i class="ace-icon fa fa-retweet"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="联系人"
															name="contactname" /> <i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="联系方式 若为座机前面需加区号"
															name="contactmobile" id="contactmobile"
															onblur="checkMobile();" /> <i
														class="ace-icon fa fa-retweet"></i> </span>
												</label>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i>
														<span class="bigger-110">重置</span>
													</button>

													<button type="button"
														class="width-65 pull-right btn btn-sm btn-success"
														onclick="checksign();">
														<span class="bigger-110">注册</span>

														<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> 返回登陆 </a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->

							<!-- 发布方注册 -->
							<div id="signup-box2" class="signup-box widget-box no-border">
								<!--  style="width: 325px; margin-left: 36%;" -->
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> 新用户注册
										</h4>

										<div class="space-6"></div>
										<p>
											发布方用户注册:
											<span style="color: red;">带*为必填项</span>
										</p>

										<form id="form2" method="post"
											action="<%=basePath%>publisher/publisher">
											<fieldset>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="email" class="form-control" placeholder="邮箱"
															name="email" id="cemail1" ONBLUR="CheckMail1()" /> <i
														class="ace-icon fa fa-envelope">*</i> </span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="用户名"
															name="username" /> <i class="ace-icon fa fa-user">*</i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="password" class="form-control" placeholder="密码"
															name="password" id="pwd1" onblur="checkLength1();" /> <i
														class="ace-icon fa fa-lock">*</i> </span>

												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="password" class="form-control" placeholder="再次输入"
															name="cpassword" id="rpwd1" ONBLUR="validate1()" /> <i
														class="ace-icon fa fa-lock">*</i> </span>
												</label>
												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="联系人"
															name="contactname" /> <i class="ace-icon fa fa-user"></i>
													</span>
												</label>

												<label class="block clearfix">
													<span class="block input-icon input-icon-right"> <input
															type="text" class="form-control" placeholder="联系方式 若为座机前面需加区号"
															name="contactmobile" id="contactmobile1"
															onblur="checkMobile1();" /> <i
														class="ace-icon fa fa-retweet"></i> </span>
												</label>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="ace-icon fa fa-refresh"></i>
														<span class="bigger-110">重置</span>
													</button>

													<button type="button"
														class="width-65 pull-right btn btn-sm btn-success"
														onclick="checksign1();">
														<span class="bigger-110">注册</span>

														<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box"
											class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> 返回登陆 </a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->
						</div>
						<!-- /.position-relative -->


						<div class="navbar-fixed-top align-right">
							<br />
							&nbsp;
							<a id="btn-login-dark" href="#">Dark</a> &nbsp;
							<span class="blue">/</span> &nbsp;
							<a id="btn-login-blur" href="#">Blur</a> &nbsp;
							<span class="blue">/</span> &nbsp;
							<a id="btn-login-light" href="#">Light</a> &nbsp; &nbsp; &nbsp;
						</div>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
		</div>
		<!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="<%=basePath%>ajax/libs/jquery/2.1.1/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=basePath%>dist/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='dist/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=basePath%>dist/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			function dl(){
				   var cname=$("#cname").val();
				   var cpassword=$("#cpassword").val();
				   if(cname == "" && cpassword == ""){
				   	alert("用户名或密码不能为空！！");
				   	return false;
				   }else{
				     document.getElementById("log").submit();
				   }
				 }
			function checksign(){
				document.getElementById("form1").submit();
			}
			
			function checksign1(){
				document.getElementById("form2").submit();
			}
			
			function CheckMail() {
				var cemail = document.getElementById("cemail").value;
				if(cemail!=null&&cemail!=''){
					var filter  = /[_a-z\d\-\./]+@[_a-z\d\-]+(\.[_a-z\d\-]+)*(\.(info|biz|com|edu|gov|net|am|bz|cn|cx|hk|jp|tw|vc|vn))$/;
					 if (filter.test(cemail))
					  return false;
					 else {
					 alert("邮箱格式不正确！！");
					 return true;
					 }
				}else{
					alert("邮箱不能为空！！");
					return true;
				}
				 
				}
				
				function CheckMail1() {
				var cemail = document.getElementById("cemail1").value;
				if(cemail!=null&&cemail!=''){
				 var filter  = /[_a-z\d\-\./]+@[_a-z\d\-]+(\.[_a-z\d\-]+)*(\.(info|biz|com|edu|gov|net|am|bz|cn|cx|hk|jp|tw|vc|vn))$/;
				 if (filter.test(cemail))
				  return false;
				 else {
				 alert("邮箱格式不正确！！");
				 return true;
				 }
				 }else{
					alert("邮箱不能为空！！");
					return true;
				}
				}
	          function validate() {
	              var pw1 = document.getElementById("pwd").value;
	              var pw2 = document.getElementById("rpwd").value;
	              if(pw1 == pw2) {
	                  return false;
	              }
	              else {
	                  alert("密码不一致！！");
	               	  return true;
	              }
	          }
			
			function validate1() {
	              var pw1 = document.getElementById("pwd1").value;
	              var pw2 = document.getElementById("rpwd1").value;
	              if(pw1 == pw2) {
	                  return false;
	              }
	              else {
	                  alert("密码不一致！！");
	               	  return true;
	              }
	          }
				jQuery(function($) {
				 $(document).on('click', '.toolbar a[data-target]', function(e) {
					e.preventDefault();
					var target = $(this).data('target');
					$('.widget-box.visible').removeClass('visible');//hide others
					$(target).addClass('visible');//show target
				 });
				});
				
				
				
				//you don't need this, just used for changing background
				jQuery(function($) {
				 $('#btn-login-dark').on('click', function(e) {
					$('body').attr('class', 'login-layout');
					$('#id-text2').attr('class', 'white');
					$('#id-company-text').attr('class', 'blue');
					
					e.preventDefault();
				 });
				 $('#btn-login-light').on('click', function(e) {
					$('body').attr('class', 'login-layout light-login');
					$('#id-text2').attr('class', 'grey');
					$('#id-company-text').attr('class', 'blue');
					
					e.preventDefault();
				 });
				 $('#btn-login-blur').on('click', function(e) {
					$('body').attr('class', 'login-layout blur-login');
					$('#id-text2').attr('class', 'white');
					$('#id-company-text').attr('class', 'light-blue');
					
					e.preventDefault();
				 });
				 
				});
		</script>
	</body>
</html>
