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
		
		<meta charset="utf-8" />
		<title></title>
		
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<!--[if IE 7]><link rel="stylesheet" href="css/font-awesome-ie7.min.css" /><![endif]-->
		<!--[if lt IE 9]><link rel="stylesheet" href="css/ace-ie.min.css" /><![endif]-->
		<!-- 下拉框 -->
		<link rel="stylesheet" href="css/chosen.css" />
		
		<link rel="stylesheet" href="css/ace.min.css" />
		<link rel="stylesheet" href="css/ace-responsive.min.css" />
		<link rel="stylesheet" href="css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	
	//保存
	function save(){
			if($("#MESSAGE_ID").val()==""){
			$("#MESSAGE_ID").tips({
				side:3,
	            msg:'请输入消息ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MESSAGE_ID").focus();
			return false;
		}
		if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入用户ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		}
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入状态：0-未阅读，1-已阅读',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		if($("#DATE_CREATE").val()==""){
			$("#DATE_CREATE").tips({
				side:3,
	            msg:'请输入创建日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DATE_CREATE").focus();
			return false;
		}
		if($("#DATE_MODIFY").val()==""){
			$("#DATE_MODIFY").tips({
				side:3,
	            msg:'请输入修改日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DATE_MODIFY").focus();
			return false;
		}
		if($("#IS_DELETE").val()==""){
			$("#IS_DELETE").tips({
				side:3,
	            msg:'请输入状态：0-未删除，1-已删除',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_DELETE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="messageuser/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="MESSAGEUSER_ID" id="MESSAGEUSER_ID" value="${pd.MESSAGEUSER_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="MESSAGE_ID" id="MESSAGE_ID" value="${pd.MESSAGE_ID}" maxlength="32" placeholder="这里输入消息ID" title="消息ID"/></td>
			</tr>
			<tr>
				<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入用户ID" title="用户ID"/></td>
			</tr>
			<tr>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入状态：0-未阅读，1-已阅读" title="状态：0-未阅读，1-已阅读"/></td>
			</tr>
			<tr>
				<td><input type="text" name="DATE_CREATE" id="DATE_CREATE" value="${pd.DATE_CREATE}" maxlength="32" placeholder="这里输入创建日期" title="创建日期"/></td>
			</tr>
			<tr>
				<td><input type="text" name="DATE_MODIFY" id="DATE_MODIFY" value="${pd.DATE_MODIFY}" maxlength="32" placeholder="这里输入修改日期" title="修改日期"/></td>
			</tr>
			<tr>
				<td><input type="text" name="IS_DELETE" id="IS_DELETE" value="${pd.IS_DELETE}" maxlength="32" placeholder="这里输入状态：0-未删除，1-已删除" title="状态：0-未删除，1-已删除"/></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/ace-elements.min.js"></script>
		<script src="js/ace.min.js"></script>
		<script type="text/javascript" src="js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(window.parent.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>