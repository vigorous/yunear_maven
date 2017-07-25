﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<li class="active">组织管理</li>
		</ul><!-- /.breadcrumb -->
	</div>
	<!-- /section:basics/content.breadcrumbs -->
		
	<!-- #page-content -->
	<div class="page-content">
  		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-sm-12">
						<table class="center" style="width:100%;">
							<tr height="35">
								<c:if test="${QX.add == 1 }">
									<td style="width:69px;">
										<a href="javascript:addRole();" class="btn btn-small btn-success">新增</a>
									</td>
								</c:if>
								<c:choose>
									<c:when test="${not empty roleList}">
										<c:forEach items="${roleList}" var="role" varStatus="vs">
											<td style="width:100px;" class="center" <c:choose><c:when test="${pd.ROLE_ID == role.ROLE_ID}">bgcolor="#FFC926" onMouseOut="javascript:this.bgColor='#FFC926';"</c:when><c:otherwise>bgcolor="#E5E5E5" onMouseOut="javascript:this.bgColor='#E5E5E5';"</c:otherwise></c:choose>  onMouseMove="javascript:this.bgColor='#FFC926';" >
												<a href="role.do?ROLE_ID=${role.ROLE_ID }" style="text-decoration:none; display:block;"><li class="ace-icon fa fa-group"></li>&nbsp;<font color="#666666">${role.ROLE_NAME }</font></a>
											</td>
											<td style="width:5px;"></td>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="100">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<td></td>
							</tr>
						</table>
						
						<table>
							<tr height="7px;"><td colspan="100"></td></tr>
							<tr>
							<td><font color="#808080">本部门：</font></td>
							<td>
							<c:if test="${QX.edit == 1 }">
							<a class="btn btn-mini btn-info" onclick="editRole('${pd.ROLE_ID }');">修改名称<i class="icon-arrow-right  icon-on-right"></i></a>
							</c:if>
								<c:choose>
									<c:when test="${pd.ROLE_ID == '99'}">
									</c:when>
									<c:otherwise>
									<c:if test="${QX.edit == 1 }">
									<a class="btn btn-mini btn-purple" onclick="editRights('${pd.ROLE_ID }');"><i class="icon-pencil"></i>菜单权限</a>
									</c:if>
									</c:otherwise>
								</c:choose>
								<c:choose> 
									<c:when test="${pd.ROLE_ID == '6' or pd.ROLE_ID == '4' or pd.ROLE_ID == '1' or pd.ROLE_ID == '7'}">
									</c:when>
									<c:otherwise>
									 <c:if test="${QX.del == 1 }">
									 <a class='btn btn-mini btn-danger' title="删除" onclick="delRole('${pd.ROLE_ID }','z','${pd.ROLE_NAME }');"><i class='ace-icon glyphicon glyphicon-trash'></i></a>
									 </c:if>
									</c:otherwise>
								</c:choose>
							</td>
							</tr>
							<tr height="7px;"><td colspan="100"></td></tr>
						</table>
					
						<table id="simple-table" class="table table-striped table-bordered table-hover">
							<thead>
							<tr>
								<th class="center">序号</th>
								<th>职位</th>
								<c:if test="${QX.edit == 1 }">
									<th class="center" bgcolor="#FFBF00">备用</th>
									<th class="center" bgcolor="#EFFFBF">备用</th>
									<th class="center" bgcolor="#BFEFFF">邮件</th>
									<th class="center" bgcolor="#EFBFFF">短信</th>
									<th class="center" bgcolor="#BFEFFF" title="每天可发条数">站内信</th>
									<th class="center">增</th>
									<th class="center">删</th>
									<th class="center">改</th>
									<th class="center">查</th>
								</c:if>
								<th style="width:155px;"  class="center">操作</th>
							</tr>
							</thead>
							<c:choose>
								<c:when test="${not empty roleList_z}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${roleList_z}" var="var" varStatus="vs">
									
								
									<c:forEach items="${kefuqxlist}" var="varK" varStatus="vsK">
										<c:if test="${var.QX_ID == varK.GL_ID }">
											<c:set value="${varK.FX_QX }" var="fx_qx"></c:set>
											<c:set value="${varK.FW_QX }" var="fw_qx"></c:set>
											<c:set value="${varK.QX1 }" var="qx1"></c:set>
											<c:set value="${varK.QX2 }" var="qx2"></c:set>
										</c:if>
									</c:forEach>
									<c:forEach items="${gysqxlist}" var="varG" varStatus="vsG">
										<c:if test="${var.QX_ID == varG.U_ID }">
											<c:set value="${varG.C1 }" var="c1"></c:set>
											<c:set value="${varG.C2 }" var="c2"></c:set>
											<c:set value="${varG.Q1 }" var="q1"></c:set>
											<c:set value="${varG.Q2 }" var="q2"></c:set>
										</c:if>
									</c:forEach>
									
									<tr>
									<td class='center' style="width:80px;">${vs.index+1}</td>
									<td id="ROLE_NAMETd${var.ROLE_ID }">${var.ROLE_NAME }</td>
									<c:if test="${QX.edit == 1 }">
									<td style="width:60px;" class="center"><label><input type="checkbox" class="ace" id="qx1${vs.index+1}" <c:if test="${qx1 == 1 }">checked="checked"</c:if> onclick="kf_qx1(this.id,'${var.QX_ID}','kfqx1')" /><span class="lbl"></span></label></td>
									<td style="width:60px;" class="center"><label><input type="checkbox" class="ace" id="qx2${vs.index+1}" <c:if test="${qx2 == 1 }">checked="checked"</c:if>  onclick="kf_qx2(this.id,'${var.QX_ID}','kfqx2')"/><span class="lbl"></span></label></td>
									<td style="width:60px;" class="center"><label><input type="checkbox" class="ace" id="qx3${vs.index+1}" <c:if test="${fx_qx == 1 }">checked="checked"</c:if>  onclick="kf_qx3(this.id,'${var.QX_ID}','fxqx')"/><span class="lbl"></span></label></td>
									<td style="width:60px;" class="center"><label><input type="checkbox" class="ace" id="qx4${vs.index+1}" <c:if test="${fw_qx == 1 }">checked="checked"</c:if>  onclick="kf_qx4(this.id,'${var.QX_ID}','fwqx')"/><span class="lbl"></span></label></td>
									
									<td style="width:55px;" class="center">
										<input title="每天可发条数" name="xinjian" id="xj${vs.index+1}" value="${c1 }" 
											   style="width:50px;height:100%;text-align:center; padding-top: 0px;padding-bottom: 0px;" 
											   onkeyup="c1(this.id,'c1',this.value,'${var.QX_ID}')" type="number"/>
									</td>
									
									<td style="width:30px;"><a onclick="roleButton('${var.ROLE_ID }','add_qx');" class="btn btn-warning btn-mini" title="分配新增权限"><i class="fa fa-wrench"></i></a></td>
									<td style="width:30px;"><a onclick="roleButton('${var.ROLE_ID }','del_qx');" class="btn btn-warning btn-mini" title="分配删除权限"><i class="fa fa-wrench"></i></a></td>
									<td style="width:30px;"><a onclick="roleButton('${var.ROLE_ID }','edit_qx');" class="btn btn-warning btn-mini" title="分配修改权限"><i class="fa fa-wrench"></i></a></td>
									<td style="width:30px;"><a onclick="roleButton('${var.ROLE_ID }','cha_qx');" class="btn btn-warning btn-mini" title="分配查看权限"><i class="fa fa-wrench"></i></a></td>
									</c:if>
									<td style="width:155px;">
									
									<c:if test="${QX.edit != 1 && QX.del != 1 }">
									<div style="width:100%;" class="center">
									<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
									</div>
									</c:if>
									
									<c:if test="${QX.edit == 1 }">
									<a class="btn btn-mini btn-purple" onclick="editRights('${var.ROLE_ID }');"><i class="icon-pencil"></i>菜单权限</a>
									<a class='btn btn-mini btn-info' title="编辑" onclick="editRole('${var.ROLE_ID }');"><i class='ace-icon fa fa-edit'></i></a>
									</c:if>
									<c:choose> 
										<c:when test="${var.ROLE_ID == '2' or var.ROLE_ID == '1'}">
										</c:when>
										<c:otherwise>
										 <c:if test="${QX.del == 1 }">
											 <a class='btn btn-mini btn-danger' title="删除" onclick="delRole('${var.ROLE_ID }','c','${var.ROLE_NAME }');">
											 	<i class='ace-icon glyphicon glyphicon-trash'></i>
											 </a>
										 </c:if>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:forEach>
									</c:if>
											<c:if test="${QX.cha == 0 }">
												<tr>
													<td colspan="100" class="center">您无权查看</td>
												</tr>
											</c:if>
								</c:when>
								<c:otherwise>
									<tr>
									<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					
						<div class="page-header position-relative">
							<c:if test="${QX.add == 1 }">
								<table style="width:100%;">
									<tr>
										<td style="vertical-align:top;"><a class="btn btn-small btn-success" onclick="addRole2('${pd.ROLE_ID }');">新增</a></td>
									</tr>
								</table>
							</c:if>
						</div>
					</div>
				</div>
			</div><!--/row-->
			
		</div><!--/row-->
	</div><!--/#page-content-->
</div><!--/.main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="Ace_Admin_1.3.3/assets/js/bootstrap.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/bootbox.js"></script>	

		<script type="text/javascript">
		
		$(window.parent.hangge());
		
		//新增部门
		function addRole(){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增部门";
			 diag.URL = 'role/toAdd.do?parent_id=0';
			 diag.Width = 222;
			 diag.Height = 90;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					window.parent.jzts();
					setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//新增职位
		function addRole2(pid){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增职位";
			 diag.URL = 'role/toAdd.do?parent_id='+pid;
			 diag.Width = 222;
			 diag.Height = 90;
			 diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					window.parent.jzts();
					setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editRole(ROLE_ID){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = 'role/toEdit.do?ROLE_ID='+ROLE_ID;
			 diag.Width = 222;
			 diag.Height = 90;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					window.parent.jzts();
					setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delRole(ROLE_ID,msg,ROLE_NAME){
			bootbox.confirm("确定要删除["+ROLE_NAME+"]吗?", function(result) {
				if(result) {
					var url = "role/delete.do?ROLE_ID="+ROLE_ID+"&guid="+new Date().getTime();
					$.get(url,function(data){
						if(data=="success"){
							if(msg == 'c'){
								window.parent.jzts();
								document.location.reload();
							}else{
								window.parent.jzts();
								window.location.href="role.do";
							}
							
						}else if(data=="false"){
							bootbox.dialog("删除失败，请先删除此部门下的职位!", 
									[
									  {
										"label" : "关闭",
										"class" : "btn-small btn-success",
										"callback": function() {
											//Example.show("great success");
											}
										}]
								);
						}else if(data=="false2"){
							bootbox.dialog("删除失败，请先删除此职位下的用户!", 
									[
									  {
										"label" : "关闭",
										"class" : "btn-small btn-success",
										"callback": function() {
											//Example.show("great success");
											}
										}]
								);
						}
					});
				}
			});
		}
		
		</script>
		
		<script type="text/javascript">

	
		//扩展权限 ==============================================================
		var hcid1 = '';
		var qxhc1 = '';
		function kf_qx1(id,kefu_id,msg){
			if(id != hcid1){
				hcid1 = id;
				qxhc1 = '';
			}
			var value = 1;
			var wqx = $("#"+id).attr("checked");
			if(qxhc1 == ''){
				if(wqx == 'checked'){
					qxhc1 = 'checked';
				}else{
					qxhc1 = 'unchecked';
				}
			}
			if(qxhc1 == 'checked'){
				value = 0;
				qxhc1 = 'unchecked';
			}else{
				value = 1;
				qxhc1 = 'checked';
			}
				var url = "role/kfqx.do?kefu_id="+kefu_id+"&msg="+msg+"&value="+value+"&guid="+new Date().getTime();
				$.get(url,function(data){
					if(data=="success"){
						//document.location.reload();
					}
				});
		}
		
		var hcid2 = '';
		var qxhc2 = '';
		function kf_qx2(id,kefu_id,msg){
			if(id != hcid2){
				hcid2 = id;
				qxhc2='';
			}
			var value = 1;
			var wqx = $("#"+id).attr("checked");
			if(qxhc2 == ''){
				if(wqx == 'checked'){
					qxhc2 = 'checked';
				}else{
					qxhc2 = 'unchecked';
				}
			}
			if(qxhc2 == 'checked'){
				value = 0;
				qxhc2 = 'unchecked';
			}else{
				value = 1;
				qxhc2 = 'checked';
			}
				var url = "role/kfqx.do?kefu_id="+kefu_id+"&msg="+msg+"&value="+value+"&guid="+new Date().getTime();
				$.get(url,function(data){
					if(data=="success"){
						//document.location.reload();
					}
				});
		}
		
		var hcid3 = '';
		var qxhc3 = '';
		function kf_qx3(id,kefu_id,msg){
			if(id != hcid3){
				hcid3 = id;
				qxhc3='';
			}
			var value = 1;
			var wqx = $("#"+id).attr("checked");
			if(qxhc3 == ''){
				if(wqx == 'checked'){
					qxhc3 = 'checked';
				}else{
					qxhc3 = 'unchecked';
				}
			}
			if(qxhc3 == 'checked'){
				value = 0;
				qxhc3 = 'unchecked';
			}else{
				value = 1;
				qxhc3 = 'checked';
			}
				var url = "role/kfqx.do?kefu_id="+kefu_id+"&msg="+msg+"&value="+value+"&guid="+new Date().getTime();
				$.get(url,function(data){
					if(data=="success"){
						//document.location.reload();
					}
				});
		}
		
		var hcid4 = '';
		var qxhc4 = '';
		function kf_qx4(id,kefu_id,msg){
			if(id != hcid4){
				hcid4 = id;
				qxhc4='';
			}
			var value = 1;
			var wqx = $("#"+id).attr("checked");
			if(qxhc4 == ''){
				if(wqx == 'checked'){
					qxhc4 = 'checked';
				}else{
					qxhc4 = 'unchecked';
				}
			}
			if(qxhc4 == 'checked'){
				value = 0;
				qxhc4 = 'unchecked';
			}else{
				value = 1;
				qxhc4 = 'checked';
			}
				var url = "role/kfqx.do?kefu_id="+kefu_id+"&msg="+msg+"&value="+value+"&guid="+new Date().getTime();
				$.get(url,function(data){
					if(data=="success"){
						//document.location.reload();
					}
				});
		}
		
		//保存信件数
		function c1(id,msg,value,kefu_id){
				if(isNaN(Number(value))){
					alert("请输入数字!");
					$("#"+id).val(0);
					return;
				}else{
				var url = "role/gysqxc.do?kefu_id="+kefu_id+"&msg="+msg+"&value="+value+"&guid="+new Date().getTime();
				$.get(url,function(data){
					if(data=="success"){
						//document.location.reload();
					}
				});
				}
		}
		
		//菜单权限
		function editRights(ROLE_ID){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = "菜单权限";
			 diag.URL = 'role/auth.do?ROLE_ID='+ROLE_ID;
			 diag.Width = 280;
			 diag.Height = 370;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//按钮权限
		function roleButton(ROLE_ID,msg){
			window.parent.jzts();
			if(msg == 'add_qx'){
				var Title = "授权新增权限";
			}else if(msg == 'del_qx'){
				Title = "授权删除权限";
			}else if(msg == 'edit_qx'){
				Title = "授权修改权限";
			}else if(msg == 'cha_qx'){
				Title = "授权查看权限";
			}
			
			 var diag = new top.Dialog();
			 diag.Drag = true;
			 diag.Title = Title;
			 diag.URL = 'role/button.do?ROLE_ID='+ROLE_ID+'&msg='+msg;
			 diag.Width = 200;
			 diag.Height = 370;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		
		</script>
	</body>
</html>

