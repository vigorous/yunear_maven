<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="sidebar responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				
				<div id="sidebar-shortcuts" class="sidebar-shortcuts">

					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success" title="Ace_Admin_1.3.3" onclick="window.open('<%=basePathl%>Ace_Admin_1.3.3');">
							<i class="ace-icon fa fa-signal"></i>
						</button>
						<button class="btn btn-info" title="UI实例11" onclick="window.open('<%=basePathl%>UI_new');">
							<i class="ace-icon fa fa-pencil"></i>
						</button>
						<button class="btn btn-warning" title="数据字典" id="adminzidian" onclick="zidian();">
							<i class="ace-icon fa fa-users"></i>
						</button>
						<button class="btn btn-danger" title="菜单管理" id="adminmenu" onclick="menu();">
							<i class="ace-icon fa fa-cogs"></i>
						</button>
					</div>

					<div id="sidebar-shortcuts-mini" class="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>
						<span class="btn btn-info"></span>
						<span class="btn btn-warning"></span>
						<span class="btn btn-danger"></span>
					</div>

				</div><!-- #sidebar-shortcuts -->


				<ul class="nav nav-list">

					<li class="active" id="fhindex">
					  <a href="login_index.do"><i class="menu-icon fa fa-tachometer"></i><span>后台首页</span></a>
					  <b class="arrow"></b>
					</li>

					<c:forEach items="${menuList}" var="menu">
						<c:if test="${menu.hasMenu}">
							<li id="lm${menu.MENU_ID }" class="">
								<a href="#" class="dropdown-toggle" >
									<i class="${menu.MENU_ICON == null ? 'icon-desktop' : menu.MENU_ICON}"></i>
									<span class="menu-text">${menu.MENU_NAME }</span>
									<c:if test="${! empty menu.subMenu}">
										<b class="arrow fa fa-angle-down"></b>
									</c:if>
								</a>
								<b class="arrow"></b>
								
								<c:if test="${! empty menu.subMenu}">
								
									<ul class="submenu">
										<c:forEach items="${menu.subMenu}" var="sub">
											
												<c:if test="${sub.hasMenu}">
													<c:choose>
														<c:when test="${not empty sub.MENU_URL}">
															<li id="z${sub.MENU_ID }" class="">
																<a href="${sub.MENU_URL }" target="mainFrame" " onclick="siMenu('z${sub.MENU_ID }','lm${menu.MENU_ID }')">
																	<i class="menu-icon fa fa-caret-right"></i>
																	${sub.MENU_NAME }
																</a>
																<b class="arrow"></b>
															</li>
														</c:when>
														
														<c:otherwise>
															<li><a href="javascript:void(0);"><i class="menu-icon fa fa-caret-right"></i>${sub.MENU_NAME }</a></li>
															<b class="arrow"></b>
														</c:otherwise>
													</c:choose>
												</c:if>
											
										</c:forEach>
									</ul>
								</c:if>
							</li>
						</c:if>
					</c:forEach>

				</ul><!--/.nav-list-->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>

			</div><!--/#sidebar-->

