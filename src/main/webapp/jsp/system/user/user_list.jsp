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
		<!-- jsp文件头和头部 -->
		<%@ include file="../admin/top.jsp"%> 
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/jquery-ui.custom.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/chosen.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/datepicker.css" />
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
				<a href="#">系统管理</a>
			</li>
			<li class="active">系统用户</li>
		</ul><!-- /.breadcrumb -->
	</div>
	<!-- /section:basics/content.breadcrumbs -->
	
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<!-- <div class="hr hr-18 dotted hr-double"></div> -->
				<!-- 检索  -->
				<form action="user/listUsers.do" method="post" name="userForm" id="userForm" class="form-horizontal">
					<table>
						<tr>
							<td>
								<span class="input-icon">
									<input autocomplete="off" class="nav-search-input" id="nav-search-input" type="text" name="USERNAME" value="${pd.USERNAME }" placeholder="这里输入关键词" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</td>
							<td>
								<div class="input-group">
									<input id="lastLoginStart" name="lastLoginStart" class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" style="width:88px;" placeholder="开始日期" title="最近登录开始">
									<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
									</span>
								</div>
							</td>
							<td>
								<div class="input-group">
									<input id="lastLoginEnd" name="lastLoginEnd" class="form-control date-picker" type="text" data-date-format="yyyy-mm-dd" style="width:88px;" placeholder="结束日期" title="最近登录结束">
									<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
									</span>
								</div>
							</td>
							<td style="vertical-align:top;"> 
							 	<select class="form-control" name="ROLE_ID" id="role_id" placeholder="请选择职位" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<c:forEach items="${roleList}" var="role">
										<option value="${role.ROLE_ID }" <c:if test="${pd.ROLE_ID==role.ROLE_ID}">selected</c:if>>${role.ROLE_NAME }</option>
									</c:forEach>
							  	</select>
							</td>
							<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;">
									<button class="btn btn-white btn-info" onclick="search();" title="检索">
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</button>
								</td>
								<td style="vertical-align:top;">
									<a class="btn btn-white btn-info" onclick="window.location.href='<%=basePath%>/user/listtabUsers.do';" title="切换模式">
										<i class="ace-icon fa fa-exchange nav-search-icon"></i>
									</a>
								</td>
								<td style="vertical-align:top;">
									<a class="btn btn-white btn-info" onclick="toExcel();" title="导出到EXCEL">
										<i class="ace-icon fa fa-download nav-search-icon"></i>
									</a>
								</td>
								
								<c:if test="${QX.edit == 1 }">
									<td style="vertical-align:top;">
										<a class="btn btn-white btn-info" onclick="fromExcel();" title="从EXCEL导入">
											<i class="ace-icon fa fa-upload nav-search-icon"></i>
										</a>
									</td>
								</c:if>
								
							</c:if>
						</tr>
					</table>
					<!-- 检索  -->
					
					<div class="hr hr-18 dotted hr-double"></div>
			
					<table id=simple-table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center">
									<label>
										<input type="checkbox" class="ace" id="zcheckbox"/>
										<span class="lbl"></span>
									</label>
								</th>
								<th>序号</th>
								<th>编号</th>
								<th>用户名</th>
								<th>姓名</th>
								<td class="hidden-480">职位</th>
								<!-- <th>余额</th> -->
								<th><i class="ace-icon fa fa-envelope"></i>邮箱</th>
								<th><i class="ace-icon glyphicon glyphicon-time"></i>最近登录</th>
								<th>上次登录IP</th>
								<th class="center">操作</th>
							</tr>
						</thead>
												
						<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty userList}">
									<c:if test="${QX.cha == 1 }">
										<c:forEach items="${userList}" var="user" varStatus="vs">
											<tr>
												<td class='center' style="width: 30px;">
													<c:if test="${user.USERNAME != 'admin'}">
														<label>
															<input type='checkbox' class="ace" name='ids' value="${user.USER_ID }" id="${user.EMAIL }" alt="${user.PHONE }"/>
															<span class="lbl"></span>
														</label>
													</c:if>
													<c:if test="${user.USERNAME == 'admin'}">
														<label>
															<input type='checkbox' class="ace" disabled="disabled" />
															<span class="lbl"></span>
														</label>
													</c:if>
												</td>
												<td class='center' style="width:43px;">${vs.index+1}</td>
												<td>${user.NUMBERNO }</td>
												<td><a>${user.USERNAME }</a></td>
												<td>${user.NAME }</td>
												<td class="hidden-480">${user.ROLE_NAME }</td>
												<%-- <td>${user.BALANCE }</td> --%>
												<c:if test="${QX.FX_QX == 1 }">
												<td><a title="发送电子邮件" style="text-decoration:none;cursor:pointer;" onclick="sendEmail('${user.EMAIL }');">${user.EMAIL }&nbsp;<i class="ace-icon fa fa-envelope"></i></a></td>
												</c:if>
												<c:if test="${QX.FX_QX != 1 }">
												<td><a title="您无权发送电子邮件" style="text-decoration:none;cursor:pointer;">${user.EMAIL }&nbsp;<i class="ace-icon fa fa-envelope"></i></a></td>
												</c:if>
												<td>${user.LAST_LOGIN}</td>
												<td>${user.IP}</td>
												
												<td class='center' style="width: 110px;">
													<!-- 正常窗口 -->
													<div class='hidden-sm hidden-xs btn-group'>
														<c:if test="${QX.FW_QX != 1 && QX.edit != 1 && QX.del != 1 }">
															<span class="label label-large label-grey arrowed-in-right arrowed-in">
																<i class="ace-icon fa fa-lock" title="无权限"></i>
															</span>
														</c:if>
														<!-- 发送短信 -->
														<c:if test="${QX.FW_QX == 1 }">
															<a class='btn btn-mini btn-warning' title="发送短信" onclick="sendSms('${user.PHONE }');">
																<i class='ace-icon fa fa-envelope-o'></i>
															</a>
														</c:if>
														
														<!-- 编辑 -->
														<c:if test="${QX.edit == 1 }">
															<c:if test="${user.USERNAME != 'admin'}">
																<a class='btn btn-mini btn-info' title="编辑" onclick="editUser('${user.USER_ID }');">
																	<i class='ace-icon fa fa-edit'></i>
																</a>
															</c:if>
															
															<c:if test="${user.USERNAME == 'admin'}">
																<a class='btn btn-mini btn-info' title="您不能编辑">
																	<i class='ace-icon fa fa-edit'></i>
																</a>
															</c:if>
														</c:if>
														
														<!-- 删除 -->
														<c:choose>
															<c:when test="${user.USERNAME=='admin'}">
																<a class='btn btn-mini btn-danger' title="不能删除">
																	<i class='ace-icon glyphicon glyphicon-trash'></i>
																</a>
															</c:when>
															<c:otherwise>
																<c:if test="${QX.del == 1 }">
																	<a class='btn btn-mini btn-danger' title="删除" onclick="delUser('${user.USER_ID }','${user.USERNAME }');">
																		<i class='ace-icon glyphicon glyphicon-trash'></i>
																	</a>
																</c:if>
															</c:otherwise>
														</c:choose>
													</div>
													
													
													<!-- 窗口变小 操作按钮放到一起 -->
													<div class="hidden-md hidden-lg">
													
														<c:choose>
															<c:when test="${QX.FW_QX != 1 && QX.edit != 1 && QX.del != 1 }">
																<span class="label label-large label-grey arrowed-in-right arrowed-in">
																	<i class="ace-icon fa fa-lock" title="无权限"></i>
																</span>
															</c:when>
															<c:otherwise>
																<div class="inline pos-rel">
																	<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>
										
																	<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<!-- 发送短信 -->
																		<c:if test="${QX.FW_QX == 1 }">
																			<li>
																				<a href="javascript:sendSms('${user.PHONE }');" class="tooltip-info" data-rel="tooltip" title="发送短信">
																					<span class="blue">
																						<i class="ace-icon fa fa-search-plus bigger-120"></i>
																					</span>
																				</a>
																			</li>
																		</c:if>
																		<!-- 编辑 -->
																		<c:if test="${QX.edit == 1 }">
																			<c:if test="${user.USERNAME != 'admin'}">
																				<li>
																					<a href="javascript:editUser('${user.USER_ID }');" class="tooltip-success" data-rel="tooltip" title="编辑">
																						<span class="green">
																							<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																						</span>
																					</a>
																				</li>
																			</c:if>
																			
																			<c:if test="${user.USERNAME == 'admin'}">
																				<li>
																					<a href="javascript:void(0);" class="tooltip-success" data-rel="tooltip" title="您不能编辑">
																						<span class="green">
																							<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																						</span>
																					</a>
																				</li>
																			</c:if>
																		</c:if>
																		
																		<c:choose>
																			<c:when test="${user.USERNAME=='admin'}">
																				<li>
																					<a href="javascript:void(0);" class="tooltip-error" data-rel="tooltip" title="不能删除">
																						<span class="red">
																							<i class="ace-icon fa fa-trash-o bigger-120"></i>
																						</span>
																					</a>
																				</li>
																			</c:when>
																			<c:otherwise>
																				<c:if test="${QX.del == 1 }">
																					<li>
																						<a href="javascript:delUser('${user.USER_ID }','${user.USERNAME }');" class="tooltip-error" data-rel="tooltip" title="删除">
																							<span class="red">
																								<i class="ace-icon fa fa-trash-o bigger-120"></i>
																							</span>
																						</a>
																					</li>
																				</c:if>
																			</c:otherwise>
																			
																		</c:choose>
																	</ul>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="10" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</form>
			</div>
		<!-- PAGE CONTENT ENDS HERE -->
		</div><!--/row-->
		
		<div class="row">
			<div class="col-sm-5">
				<div>
					<c:if test="${QX.add == 1 }">
						<a class="btn btn-success" onclick="add();">新增</a>
					</c:if>
					
					<c:if test="${QX.FX_QX == 1 }">
						<a title="批量发送电子邮件" class="btn btn-info" onclick="makeAll('确定要给选中的用户发送邮件吗?');">
							<i class="ace-icon fa fa-envelope-o"></i>
						</a>
					</c:if>
					
					<c:if test="${QX.FW_QX == 1 }">
						<a title="批量发送短信" class="btn btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');">
							<i class="ace-icon fa fa-envelope"></i>
						</a>
					</c:if>
					
					<c:if test="${QX.del == 1 }">
						<a title="批量删除" class="btn btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" >
							<i class='ace-icon glyphicon glyphicon-trash'></i>
						</a>
					</c:if>
				</div>
			</div>
			<div class="col-sm-7">
				<div style="float: right;padding-top: 0px;margin-top: 0px;">
					${page.pageStr}
				</div>
			</div>
		</div>
		
	</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.js'>"+"<"+"/script>");
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
		<script src="Ace_Admin_1.3.3/assets/js/bootbox.js"></script>
		<!-- page specific plugin scripts -->
		<!--[if lte IE 8]>
		  <script src="Ace_Admin_1.3.3/assets/js/excanvas.js"></script>
		<![endif]-->
		<script src="Ace_Admin_1.3.3/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/date-time/moment.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/chosen.jquery.js"></script>
		
		<script type="text/javascript" src="js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(window.parent.hangge());
		
		//检索
		function search(){
			window.parent.jzts();
			$("#userForm").submit();
		}
		
		
		//去发送电子邮件页面
		function sendEmail(EMAIL){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送电子邮件";
			 diag.URL = '<%=basePath%>/head/goSendEmail.do?EMAIL='+EMAIL;
			 diag.Width = 600;
			 diag.Height = 470;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//去发送短信页面
		function sendSms(phone){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送短信";
			 diag.URL = '<%=basePath%>/head/goSendSms.do?PHONE='+phone+'&msg=appuser';
			 diag.Width = 600;
			 diag.Height = 265;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		//新增
		function add(){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = 'user/goAddU.do';
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 window.parent.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage('${page.currentPage}');
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editUser(user_id){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = 'user/goEditU.do?USER_ID='+user_id;
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delUser(userId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					var url = "user/deleteU.do?USER_ID="+userId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if(data=="success"){
							nextPage('${page.currentPage}');
						}
					});
				}
			});
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
						  }
					}
					if(str==''){
						bootbox.dialog({  
							message: "您没有选择任何内容!",  
							/* title: "Confirm title",   */
							buttons: {  
								Cancel: {  
									label: "关闭",  
									className: "btn-small btn-success",  
									callback: function () {
										
									}  
								}  
							}  
						});
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							$.ajax({
								type: "POST",
								url: 'user/deleteAllU.do?tm='+new Date().getTime(),
						    	data: {USER_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage('${page.currentPage}');
									 });
								}
							});
						}else if(msg == '确定要给选中的用户发送邮件吗?'){
							sendEmail(emstr);
						}else if(msg == '确定要给选中的用户发送短信吗?'){
							sendSms(phones);
						}
						
						
					}
				}
			});
		}
		
		
		
		$(function() {
			
			//And for the first simple table, which doesn't have TableTools or dataTables
			//select/deselect all rows according to table header checkbox
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
			
			//select/deselect a row when the checkbox is checked/unchecked
			$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
				var $row = $(this).closest('tr');
				if(this.checked) $row.addClass(active_class);
				else $row.removeClass(active_class);
			});
			
			var ksrq = $('#lastLoginStart')[0];
		 	if(ksrq.type !== 'date') {//if browser doesn't support "date" input
		    	$(ksrq).datepicker({
		      	//options
		    	})
			}
		 	
		 	var jsrq = $('#lastLoginEnd')[0];
		 	if(jsrq.type !== 'date') {//if browser doesn't support "date" input
		    	$(jsrq).datepicker({
		      	//options
		    	})
			}
			
		});
		
		//导出excel
		function toExcel(){
			var USERNAME = $("#nav-search-input").val();
			var lastLoginStart = $("#lastLoginStart").val();
			var lastLoginEnd = $("#lastLoginEnd").val();
			var ROLE_ID = $("#role_id").val();
			window.location.href='<%=basePath%>/user/excel.do?USERNAME='+USERNAME+'&lastLoginStart='+lastLoginStart+'&lastLoginEnd='+lastLoginEnd+'&ROLE_ID='+ROLE_ID;
		}
		
		//打开上传excel页面
		function fromExcel(){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="EXCEL 导入到数据库";
			 diag.URL = 'user/goUploadExcel.do';
			 diag.Width = 300;
			 diag.Height = 150;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		</script>
		
	</body>
</html>

