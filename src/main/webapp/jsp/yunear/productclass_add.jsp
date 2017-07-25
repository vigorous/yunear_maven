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
		<title>产品明细信息</title>
		
		<!-- <meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
		
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
		<meta charset="utf-8">
		
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/font-awesome.css" />
		
		<!-- text fonts -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/ace-fonts.css" />
		
		<!-- ace styles -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/jquery-ui.custom.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/chosen.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/datepicker.css" />
		
		<script type="text/javascript" src="js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	
	//保存
	function save(){
			if($("#CLASS_NAME").val()==""){
			$("#CLASS_NAME").tips({
				side:3,
	            msg:'请输入产品分类名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLASS_NAME").focus();
			return false;
		}
		if($("#CLASS_PARENTID").val()==""){
			$("#CLASS_PARENTID").tips({
				side:3,
	            msg:'请输入父节点ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLASS_PARENTID").focus();
			return false;
		}
		if($("#GRADE").val()==""){
			$("#GRADE").tips({
				side:3,
	            msg:'请输入级别',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#GRADE").focus();
			return false;
		}
		if($("#CREATE_DATE").val()==""){
			$("#CREATE_DATE").tips({
				side:3,
	            msg:'请输入创建日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_DATE").focus();
			return false;
		}
		if($("#UPDATE_DATE").val()==""){
			$("#UPDATE_DATE").tips({
				side:3,
	            msg:'请输入修改日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UPDATE_DATE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	
	<div id="main-container" class="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<form action="" class="form-horizontal" role="form">
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right" for="form-field-1"> Text Field </label>

									<div class="col-sm-10">
										<input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-3" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Text Field </label>

									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Text Field </label>

									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <form action="productclass/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PRODUCTCLASS_ID" id="PRODUCTCLASS_ID" value="${pd.PRODUCTCLASS_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="CLASS_NAME" id="CLASS_NAME" value="${pd.CLASS_NAME}" maxlength="32" placeholder="这里输入产品分类名称" title="产品分类名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="CLASS_PARENTID" id="CLASS_PARENTID" value="${pd.CLASS_PARENTID}" maxlength="32" placeholder="这里输入父节点ID" title="父节点ID"/></td>
			</tr>
			<tr>
				<td><input type="number" name="GRADE" id="GRADE" value="${pd.GRADE}" maxlength="32" placeholder="这里输入级别" title="级别"/></td>
			</tr>
			<tr>
				<td><input class="span10 date-picker" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建日期" title="创建日期"/></td>
			</tr>
			<tr>
				<td><input class="span10 date-picker" name="UPDATE_DATE" id="UPDATE_DATE" value="${pd.UPDATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="修改日期" title="修改日期"/></td>
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
		
	</form> --%>
	
	
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