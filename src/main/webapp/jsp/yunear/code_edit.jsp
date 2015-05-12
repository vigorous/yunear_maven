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
			if($("#CODE_NAME").val()==""){
			$("#CODE_NAME").tips({
				side:3,
	            msg:'请输入二维码名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CODE_NAME").focus();
			return false;
		}
		if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入发布方ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		}
		if($("#MEDIA_ID").val()==""){
			$("#MEDIA_ID").tips({
				side:3,
	            msg:'请输入多媒体ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MEDIA_ID").focus();
			return false;
		}
		if($("#SCAN_CODE_LINK").val()==""){
			$("#SCAN_CODE_LINK").tips({
				side:3,
	            msg:'请输入扫码链接',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SCAN_CODE_LINK").focus();
			return false;
		}
		if($("#SCAN_CODE_NUM").val()==""){
			$("#SCAN_CODE_NUM").tips({
				side:3,
	            msg:'请输入扫码次数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SCAN_CODE_NUM").focus();
			return false;
		}
		if($("#IMG_LINK").val()==""){
			$("#IMG_LINK").tips({
				side:3,
	            msg:'请输入图片链接',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IMG_LINK").focus();
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
		if($("#CREATE_TIME").val()==""){
			$("#CREATE_TIME").tips({
				side:3,
	            msg:'请输入创建日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_TIME").focus();
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
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="code/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="CODE_ID" id="CODE_ID" value="${pd.CODE_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="CODE_NAME" id="CODE_NAME" value="${pd.CODE_NAME}" maxlength="32" placeholder="这里输入二维码名称" title="二维码名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入发布方ID" title="发布方ID"/></td>
			</tr>
			<tr>
				<td><input type="text" name="MEDIA_ID" id="MEDIA_ID" value="${pd.MEDIA_ID}" maxlength="32" placeholder="这里输入多媒体ID" title="多媒体ID"/></td>
			</tr>
			<tr>
				<td><input type="text" name="SCAN_CODE_LINK" id="SCAN_CODE_LINK" value="${pd.SCAN_CODE_LINK}" maxlength="32" placeholder="这里输入扫码链接" title="扫码链接"/></td>
			</tr>
			<tr>
				<td><input type="number" name="SCAN_CODE_NUM" id="SCAN_CODE_NUM" value="${pd.SCAN_CODE_NUM}" maxlength="32" placeholder="这里输入扫码次数" title="扫码次数"/></td>
			</tr>
			<tr>
				<td><input type="text" name="IMG_LINK" id="IMG_LINK" value="${pd.IMG_LINK}" maxlength="32" placeholder="这里输入图片链接" title="图片链接"/></td>
			</tr>
			<tr>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入状态" title="状态"/></td>
			</tr>
			<tr>
				<td><input type="text" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" maxlength="32" placeholder="这里输入创建日期" title="创建日期"/></td>
			</tr>
			<tr>
				<td><input type="text" name="UPD_TIME" id="UPD_TIME" value="${pd.UPD_TIME}" maxlength="32" placeholder="这里输入修改日期" title="修改日期"/></td>
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