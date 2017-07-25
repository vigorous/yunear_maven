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
		
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
		<meta charset="utf-8">
		<title>菜单图片</title>
		
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/font-awesome.css" />
		<!-- text fonts -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/ace-fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<script type="text/javascript" src="js/jquery-1.7.2.js"></script>

		<script type="text/javascript">
				
				$(window.parent.hangge());
				//保存
				function save(){
					if($("#MENU_ICON").val()==""){
						alert('请选择图标');
						return false;
					}
					$("#menuForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				}
			function seticon(icon){
				$("#MENU_ICON").val(icon);
			}	
			
		</script>
		
	</head>
	
	<body>
		<form action="menu/editicon.do" name="menuForm" id="menuForm" method="post">
			<input type="hidden" name="MENU_ID" id="menuId" value="${pd.MENU_ID}"/>
			<input type="hidden" name="MENU_ICON" id="MENU_ICON" value=""/>
			<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<tr>
					<td><label onclick="seticon('menu-icon fa fa-desktop');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-desktop"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-list');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-list"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-edit');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-edit"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-list-alt');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-list-alt"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-calendar');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-calendar"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-picture-o');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-picture-o"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-th');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-th"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-file');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-file"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-folder-open');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-folder-open"></i></span></label></td>
				</tr>
				<tr>
					<td><label onclick="seticon('menu-icon fa fa-book');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-book"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-cogs');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-cogs"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-comments');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-comments"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-envelope-o');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-envelope-o"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-film');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-film"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-heart');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-heart"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-lock');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-lock"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-briefcase');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-briefcase"></i></span></label></td>
					<td><label onclick="seticon('menu-icon fa fa-file-video-o');"><input name="form-field-radio" type="radio" value="icon-edit"><span class="lbl">&nbsp;<i class="ace-icon fa fa-file-video-o"></i></span></label></td>
				</tr>
				<tr>
				<td style="text-align: center;" colspan="100">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
			</table>
			</div>
			<div id="zhongxin2" class="center" style="display:none"><img src="images/jzx.gif" /></div>
		</form>
	</body>
</html>