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
			if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入版权方ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		}
		if($("#MEDIA_NAME").val()==""){
			$("#MEDIA_NAME").tips({
				side:3,
	            msg:'请输入多媒体名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MEDIA_NAME").focus();
			return false;
		}
		if($("#MEDIA_THEME").val()==""){
			$("#MEDIA_THEME").tips({
				side:3,
	            msg:'请输入主题',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MEDIA_THEME").focus();
			return false;
		}
		if($("#KEYWORD").val()==""){
			$("#KEYWORD").tips({
				side:3,
	            msg:'请输入关键字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#KEYWORD").focus();
			return false;
		}
		if($("#PAY_TYPE").val()==""){
			$("#PAY_TYPE").tips({
				side:3,
	            msg:'请输入支付方式',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PAY_TYPE").focus();
			return false;
		}
		if($("#DESCR").val()==""){
			$("#DESCR").tips({
				side:3,
	            msg:'请输入描述',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DESCR").focus();
			return false;
		}
		if($("#PATH").val()==""){
			$("#PATH").tips({
				side:3,
	            msg:'请输入多媒体路径',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PATH").focus();
			return false;
		}
		if($("#TYPE").val()==""){
			$("#TYPE").tips({
				side:3,
	            msg:'请输入多媒体类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
			return false;
		}
		if($("#AUDIT_STATUS").val()==""){
			$("#AUDIT_STATUS").tips({
				side:3,
	            msg:'请输入审核状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AUDIT_STATUS").focus();
			return false;
		}
		if($("#PRICE").val()==""){
			$("#PRICE").tips({
				side:3,
	            msg:'请输入价格',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRICE").focus();
			return false;
		}
		if($("#UPLOAD_TIME").val()==""){
			$("#UPLOAD_TIME").tips({
				side:3,
	            msg:'请输入上传日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UPLOAD_TIME").focus();
			return false;
		}
		if($("#UPD_TIME").val()==""){
			$("#UPD_TIME").tips({
				side:3,
	            msg:'请输入修改日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UPD_TIME").focus();
			return false;
		}
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		if($("#SPREAD_NUM").val()==""){
			$("#SPREAD_NUM").tips({
				side:3,
	            msg:'请输入推广次数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SPREAD_NUM").focus();
			return false;
		}
		if($("#CLICK_NUM").val()==""){
			$("#CLICK_NUM").tips({
				side:3,
	            msg:'请输入点击数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLICK_NUM").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="copyrightmulti/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="COPYRIGHTMULTI_ID" id="COPYRIGHTMULTI_ID" value="${pd.COPYRIGHTMULTI_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入版权方ID" title="版权方ID"/></td>
			</tr>
			<tr>
				<td><input type="text" name="MEDIA_NAME" id="MEDIA_NAME" value="${pd.MEDIA_NAME}" maxlength="32" placeholder="这里输入多媒体名称" title="多媒体名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="MEDIA_THEME" id="MEDIA_THEME" value="${pd.MEDIA_THEME}" maxlength="32" placeholder="这里输入主题" title="主题"/></td>
			</tr>
			<tr>
				<td><input type="text" name="KEYWORD" id="KEYWORD" value="${pd.KEYWORD}" maxlength="32" placeholder="这里输入关键字" title="关键字"/></td>
			</tr>
			<tr>
				<td><input type="text" name="PAY_TYPE" id="PAY_TYPE" value="${pd.PAY_TYPE}" maxlength="32" placeholder="这里输入支付方式" title="支付方式"/></td>
			</tr>
			<tr>
				<td><input type="text" name="DESCR" id="DESCR" value="${pd.DESCR}" maxlength="32" placeholder="这里输入描述" title="描述"/></td>
			</tr>
			<tr>
				<td><input type="text" name="PATH" id="PATH" value="${pd.PATH}" maxlength="32" placeholder="这里输入多媒体路径" title="多媒体路径"/></td>
			</tr>
			<tr>
				<td><input type="text" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="32" placeholder="这里输入多媒体类型" title="多媒体类型"/></td>
			</tr>
			<tr>
				<td><input type="text" name="AUDIT_STATUS" id="AUDIT_STATUS" value="${pd.AUDIT_STATUS}" maxlength="32" placeholder="这里输入审核状态" title="审核状态"/></td>
			</tr>
			<tr>
				<td><input type="text" name="PRICE" id="PRICE" value="${pd.PRICE}" maxlength="32" placeholder="这里输入价格" title="价格"/></td>
			</tr>
			<tr>
				<td><input type="text" name="UPLOAD_TIME" id="UPLOAD_TIME" value="${pd.UPLOAD_TIME}" maxlength="32" placeholder="这里输入上传日期" title="上传日期"/></td>
			</tr>
			<tr>
				<td><input type="text" name="UPD_TIME" id="UPD_TIME" value="${pd.UPD_TIME}" maxlength="32" placeholder="这里输入修改日期" title="修改日期"/></td>
			</tr>
			<tr>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入状态" title="状态"/></td>
			</tr>
			<tr>
				<td><input type="text" name="SPREAD_NUM" id="SPREAD_NUM" value="${pd.SPREAD_NUM}" maxlength="32" placeholder="这里输入推广次数" title="推广次数"/></td>
			</tr>
			<tr>
				<td><input type="text" name="CLICK_NUM" id="CLICK_NUM" value="${pd.CLICK_NUM}" maxlength="32" placeholder="这里输入点击数" title="点击数"/></td>
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