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
			if($("#USER_NAME").val()==""){
			$("#USER_NAME").tips({
				side:3,
	            msg:'请输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_NAME").focus();
			return false;
		}
		if($("#CORPORATION_NAME").val()==""){
			$("#CORPORATION_NAME").tips({
				side:3,
	            msg:'请输入企业名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CORPORATION_NAME").focus();
			return false;
		}
		if($("#COPYRIGHT_FILE").val()==""){
			$("#COPYRIGHT_FILE").tips({
				side:3,
	            msg:'请输入版权证明文件',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COPYRIGHT_FILE").focus();
			return false;
		}
		if($("#COPYRIGHT_NO").val()==""){
			$("#COPYRIGHT_NO").tips({
				side:3,
	            msg:'请输入版权号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COPYRIGHT_NO").focus();
			return false;
		}
		if($("#TAX_CERT").val()==""){
			$("#TAX_CERT").tips({
				side:3,
	            msg:'请输入税务登记证',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TAX_CERT").focus();
			return false;
		}
		if($("#BUSINESS_LICENSE").val()==""){
			$("#BUSINESS_LICENSE").tips({
				side:3,
	            msg:'请输入营业执照',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BUSINESS_LICENSE").focus();
			return false;
		}
		if($("#BANK_NAME").val()==""){
			$("#BANK_NAME").tips({
				side:3,
	            msg:'请输入银行名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BANK_NAME").focus();
			return false;
		}
		if($("#BANK_ACCOUNT").val()==""){
			$("#BANK_ACCOUNT").tips({
				side:3,
	            msg:'请输入银行帐号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BANK_ACCOUNT").focus();
			return false;
		}
		if($("#CONTACT_NAME").val()==""){
			$("#CONTACT_NAME").tips({
				side:3,
	            msg:'请输入联系人姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CONTACT_NAME").focus();
			return false;
		}
		if($("#CONTACT_MOBILE").val()==""){
			$("#CONTACT_MOBILE").tips({
				side:3,
	            msg:'请输入联系人手机号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CONTACT_MOBILE").focus();
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
		if($("#AUDIT_TIME").val()==""){
			$("#AUDIT_TIME").tips({
				side:3,
	            msg:'请输入创建日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AUDIT_TIME").focus();
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
		if($("#ACCOUNT_BALANCE").val()==""){
			$("#ACCOUNT_BALANCE").tips({
				side:3,
	            msg:'请输入账户余额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ACCOUNT_BALANCE").focus();
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
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="user/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="USER_NAME" id="USER_NAME" value="${pd.USER_NAME}" maxlength="32" placeholder="这里输入用户名" title="用户名"/></td>
			</tr>
			<tr>
				<td><input type="text" name="CORPORATION_NAME" id="CORPORATION_NAME" value="${pd.CORPORATION_NAME}" maxlength="32" placeholder="这里输入企业名称" title="企业名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="COPYRIGHT_FILE" id="COPYRIGHT_FILE" value="${pd.COPYRIGHT_FILE}" maxlength="32" placeholder="这里输入版权证明文件" title="版权证明文件"/></td>
			</tr>
			<tr>
				<td><input type="text" name="COPYRIGHT_NO" id="COPYRIGHT_NO" value="${pd.COPYRIGHT_NO}" maxlength="32" placeholder="这里输入版权号" title="版权号"/></td>
			</tr>
			<tr>
				<td><input type="text" name="TAX_CERT" id="TAX_CERT" value="${pd.TAX_CERT}" maxlength="32" placeholder="这里输入税务登记证" title="税务登记证"/></td>
			</tr>
			<tr>
				<td><input type="text" name="BUSINESS_LICENSE" id="BUSINESS_LICENSE" value="${pd.BUSINESS_LICENSE}" maxlength="32" placeholder="这里输入营业执照" title="营业执照"/></td>
			</tr>
			<tr>
				<td><input type="text" name="BANK_NAME" id="BANK_NAME" value="${pd.BANK_NAME}" maxlength="32" placeholder="这里输入银行名称" title="银行名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="BANK_ACCOUNT" id="BANK_ACCOUNT" value="${pd.BANK_ACCOUNT}" maxlength="32" placeholder="这里输入银行帐号" title="银行帐号"/></td>
			</tr>
			<tr>
				<td><input type="text" name="CONTACT_NAME" id="CONTACT_NAME" value="${pd.CONTACT_NAME}" maxlength="32" placeholder="这里输入联系人姓名" title="联系人姓名"/></td>
			</tr>
			<tr>
				<td><input type="text" name="CONTACT_MOBILE" id="CONTACT_MOBILE" value="${pd.CONTACT_MOBILE}" maxlength="32" placeholder="这里输入联系人手机号" title="联系人手机号"/></td>
			</tr>
			<tr>
				<td><input type="text" name="AUDIT_STATUS" id="AUDIT_STATUS" value="${pd.AUDIT_STATUS}" maxlength="32" placeholder="这里输入审核状态" title="审核状态"/></td>
			</tr>
			<tr>
				<td><input type="text" name="AUDIT_TIME" id="AUDIT_TIME" value="${pd.AUDIT_TIME}" maxlength="32" placeholder="这里输入创建日期" title="创建日期"/></td>
			</tr>
			<tr>
				<td><input type="text" name="UPD_TIME" id="UPD_TIME" value="${pd.UPD_TIME}" maxlength="32" placeholder="这里输入修改日期" title="修改日期"/></td>
			</tr>
			<tr>
				<td><input type="text" name="ACCOUNT_BALANCE" id="ACCOUNT_BALANCE" value="${pd.ACCOUNT_BALANCE}" maxlength="32" placeholder="这里输入账户余额" title="账户余额"/></td>
			</tr>
			<tr>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入状态" title="状态"/></td>
			</tr>
			<tr>
				<td><input type="text" name="DESCR" id="DESCR" value="${pd.DESCR}" maxlength="32" placeholder="这里输入描述" title="描述"/></td>
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