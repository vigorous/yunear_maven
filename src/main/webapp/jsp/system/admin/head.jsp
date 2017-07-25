
<%
	String pathh = request.getContextPath();
	String basePathh = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathh+"/";
%>
<!-- .navbar -->
<div id="navbar" class="navbar navbar-default">
	
	<script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){}
	</script>
	
	<!-- navbar-container -->
	<div class="navbar-container" id="navbar-container">
	
		<!-- #section:basics/sidebar.mobile.toggle -->
		<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>
		</button>
		<!-- /section:basics/sidebar.mobile.toggle -->
		
		<div class="navbar-header pull-left">
			<a class="navbar-brand" href="login_index.do">
				<small>
					<i class="fa fa-leaf"></i> 
					${pdm.SYSNAME}
				</small> 
			</a>
		</div>
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<!-- <li class="green">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
						<span class="badge badge-success">5</span>
					</a>

					<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header">
							<i class="ace-icon fa fa-envelope-o"></i>
							5 Messages
						</li>

						<li class="dropdown-content">
							<ul class="dropdown-menu dropdown-navbar">
								<li>
									<a href="javascript:alert('预留功能,待开发');" class="clearfix">
										<img src="Ace_Admin_1.3.3/assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Alex:</span>
												Ciao sociis natoque penatibus et auctor ...
											</span>

											<span class="msg-time">
												<i class="ace-icon fa fa-clock-o"></i>
												<span>a moment ago</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="javascript:alert('预留功能,待开发');" class="clearfix">
										<img src="Ace_Admin_1.3.3/assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Susan:</span>
												Vestibulum id ligula porta felis euismod ...
											</span>

											<span class="msg-time">
												<i class="ace-icon fa fa-clock-o"></i>
												<span>20 minutes ago</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="javascript:alert('预留功能,待开发');" class="clearfix">
										<img src="Ace_Admin_1.3.3/assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Bob:</span>
												Nullam quis risus eget urna mollis ornare ...
											</span>

											<span class="msg-time">
												<i class="ace-icon fa fa-clock-o"></i>
												<span>3:15 pm</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="javascript:alert('预留功能,待开发');" class="clearfix">
										<img src="Ace_Admin_1.3.3/assets/avatars/avatar2.png" class="msg-photo" alt="Kate's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Kate:</span>
												Ciao sociis natoque eget urna mollis ornare ...
											</span>

											<span class="msg-time">
												<i class="ace-icon fa fa-clock-o"></i>
												<span>1:33 pm</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="javascript:alert('预留功能,待开发');" class="clearfix">
										<img src="Ace_Admin_1.3.3/assets/avatars/avatar5.png" class="msg-photo" alt="Fred's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Fred:</span>
												Vestibulum id penatibus et auctor  ...
											</span>

											<span class="msg-time">
												<i class="ace-icon fa fa-clock-o"></i>
												<span>10:09 am</span>
											</span>
										</span>
									</a>
								</li>
							</ul>
						</li>

						<li class="dropdown-footer">
							<a href="inbox.html">
								See all messages
								<i class="ace-icon fa fa-arrow-right"></i>
							</a>
						</li>
					</ul>
				</li>
				 -->
				<li class="light-blue">
					<a class="dropdown-toggle" href="javascript:alert('预留功能,待开发');" data-toggle="dropdown"> 
						<img alt="FH" src="Ace_Admin_1.3.3/assets/avatars/user.jpg" class="nav-user-photo" /> 
						<span class="user_info"></span> 
						<i class="ace-icon fa fa-caret-down"></i>
					</a>
					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li>
							<a onclick="editUserH();" style="cursor: pointer;">
							<i class="ace-icon fa fa-user"></i> 修改资料</a>
						</li>
						<li id="systemset">
							<a onclick="editSys();" style="cursor: pointer;">
							<i class="ace-icon fa fa-cog"></i> 系统设置</a>
						</li>
						<li id="productCode">
							<a onclick="productCode();" style="cursor: pointer;">
							<i class="ace-icon fa fa-cogs"></i> 代码生成</a>
						</li>
						<li class="divider"></li>
						<li><a href="logout.do"><i class="ace-icon fa fa-power-off"></i> 退出</a></li>
					</ul>
				</li>
			</ul><!--/.ace-nav-->
		</div><!-- /.navbar-buttons -->
	</div><!-- /.navbar-container -->
</div>
<!--/.navbar-->


<script type="text/javascript">
			
			//菜单状态切换
			var fmid = "fhindex";
			var mid = "fhindex";
			function siMenu(id,fid){
				if(id != mid){
					$("#"+mid).removeClass();
					mid = id;
				}
				if(fid != fmid){
					$("#"+fmid).removeClass();
					fmid = fid;
				}
				$("#"+fid).attr("class","active open");
				$("#"+id).attr("class","active");
				//jzts();
			}
		
			<%-- $(function(){
				//换肤
				$("#skin-colorpicker").ace_colorpicker().on("change",function(){
					var b=$(this).find("option:selected").data("class");
					hf(b);
					var url = '<%=basePathh%>/head/setSKIN.do?SKIN='+b+'&tm='+new Date().getTime();
					$.get(url,function(data){});
				
				})
			}) --%>

			var USER_ID;
		
			function getUname(){
				$.ajax({
					type: "POST",
					url: '<%=basePathh%>/head/getUname.do?tm='+new Date().getTime(),
			    	data: encodeURI(""),
					dataType:'json',
					//beforeSend: validateData,
					cache: false,
					success: function(data){
						//alert(data.list.length);
						 $.each(data.list, function(i, list){
							 
							 //登陆者资料
							 $(".user_info").html('<small>Welcome</small> '+list.NAME+'');
							 
							 
							 USER_ID = list.USER_ID;//用户ID
							 //hf(list.SKIN)//皮肤
							 //alert(list.USERNAME);
							 if(list.USERNAME != 'admin'){
								 $("#adminmenu").hide();	//隐藏菜单设置
								 $("#adminzidian").hide();	//隐藏数据字典
								 $("#systemset").hide();	//隐藏系统设置
								 $("#productCode").hide();	//隐藏代码生成
							 }
							 
						 });
					}
				});
			}
			getUname();
			
			/* function hf(b){
				
				var a=$(document.body);
				a.attr("class",a.hasClass("navbar-fixed")?"navbar-fixed":"");
				if(b!="default"){
					a.addClass(b)
				}if(b=="skin-1"){
					$(".ace-nav > li.grey").addClass("dark")
				}else{
					$(".ace-nav > li.grey").removeClass("dark")
				}
				if(b=="skin-2"){
						$(".ace-nav > li").addClass("no-border margin-1");
						$(".ace-nav > li:not(:last-child)").addClass("white-pink")
						.find('> a > [class*="icon-"]').addClass("pink").end()
						.eq(0).find(".badge").addClass("badge-warning")
				}else{
						$(".ace-nav > li").removeClass("no-border").removeClass("margin-1");
						$(".ace-nav > li:not(:last-child)").removeClass("white-pink")
						.find('> a > [class*="icon-"]').removeClass("pink").end()
						.eq(0).find(".badge").removeClass("badge-warning")
				}
				if(b=="skin-3"){
					$(".ace-nav > li.grey").addClass("red").find(".badge").addClass("badge-yellow")
				}else{
					$(".ace-nav > li.grey").removeClass("red").find(".badge").removeClass("badge-yellow")
				}
			} */
			
			//修改个人资料
			function editUserH(){
				 jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="个人资料";
				 diag.URL = '<%=basePathh%>/user/goEditU.do?USER_ID='+USER_ID+'&fx=head';
				 diag.Width = 225;
				 diag.Height = 389;
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				 diag.show();
			}
			
			//系统设置
			function editSys(){
				 jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="系统设置";
				 diag.URL = '<%=basePathh%>/head/goSystem.do';
				 diag.Width = 600;
				 diag.Height = 596;
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				 diag.show();
			}
		
			//代码生成
			function productCode(){
				 jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="代码生成器";
				 diag.URL = '<%=basePathh%>/head/goProductCode.do';
				 diag.Width = 800;
				 diag.Height = 450;
				 diag.CancelEvent = function(){ //关闭事件
					hangge();
					diag.close();
				 };
				 diag.show();
			}
		
			//数据字典
			function zidian(){
				 jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="数据字典";
				 diag.URL = '<%=basePathh%>/zidian.do?PARENT_ID=0';
				 diag.Width = 799;
				 diag.Height = 460;
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				 diag.show();
				 
			}
		
			//菜单
			function menu(){
				 jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="菜单编辑";
				 diag.URL = '<%=basePathh%>/menu.do';
				 diag.Width = 720;
				 diag.Height = 390;
				 diag.CancelEvent = function(){ //关闭事件
					diag.close();
				 };
				 diag.show();
				 
			}
			
			//切换菜单
			function changeMenu(){
				window.location.href='<%=basePathh%>login_index.do?changeMenu=yes';
			}
			
			//清除加载进度
			function hangge(){
				$("#jzts").hide();
			}
			
			//显示加载进度
			function jzts(){
				$("#jzts").show();
			}
		</script>
