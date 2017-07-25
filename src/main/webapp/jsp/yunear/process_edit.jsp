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
			if($("#PORCESS_NAME").val()==""){
			$("#PORCESS_NAME").tips({
				side:3,
	            msg:'请输入工序名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PORCESS_NAME").focus();
			return false;
		}
		if($("#PROCESS_TYPE").val()==""){
			$("#PROCESS_TYPE").tips({
				side:3,
	            msg:'请输入工序类别',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCESS_TYPE").focus();
			return false;
		}
		if($("#PROCESS_INPUT_UNIT").val()==""){
			$("#PROCESS_INPUT_UNIT").tips({
				side:3,
	            msg:'请输入工序投入单位',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCESS_INPUT_UNIT").focus();
			return false;
		}
		if($("#PROCESS_OUTPUT_UNIT").val()==""){
			$("#PROCESS_OUTPUT_UNIT").tips({
				side:3,
	            msg:'请输入工序输出单位',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCESS_OUTPUT_UNIT").focus();
			return false;
		}
		if($("#PROCESS_CREATE_DATE").val()==""){
			$("#PROCESS_CREATE_DATE").tips({
				side:3,
	            msg:'请输入工序创建日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROCESS_CREATE_DATE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>

	<div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a>生产管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
				<li class="active">工序信息</li>
			</ul><!--.breadcrumb-->
		</div><!--#breadcrumbs-->
	</div>
	<form action="process/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PROCESS_ID" id="PROCESS_ID" value="${pd.PROCESS_ID}"/>
		<div id="zhongxin" align="center">
			<table>
				<tr>
					<td><input type="text" name="PORCESS_NAME" id="PORCESS_NAME" value="${pd.PORCESS_NAME}" maxlength="32" placeholder="工序名称" title="工序名称"/></td>
				</tr>
				<tr>
					<td><input type="text" name="PROCESS_TYPE" id="PROCESS_TYPE" value="${pd.PROCESS_TYPE}" maxlength="32" placeholder="工序类别" title="工序类别"/></td>
				</tr>
				<tr>
					<td><input type="text" name="PROCESS_INPUT_UNIT" id="PROCESS_INPUT_UNIT" value="${pd.PROCESS_INPUT_UNIT}" maxlength="32" placeholder="工序投入单位" title="工序投入单位"/></td>
				</tr>
				<tr>
					<td><input type="text" name="PROCESS_OUTPUT_UNIT" id="PROCESS_OUTPUT_UNIT" value="${pd.PROCESS_OUTPUT_UNIT}" maxlength="32" placeholder="工序输出单位" title="工序输出单位"/></td>
				</tr>
				<tr>
					<td><input class="span10 date-picker" name="PROCESS_CREATE_DATE" id="PROCESS_CREATE_DATE" value="${pd.PROCESS_CREATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="工序创建日期" title="工序创建日期"/></td>
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