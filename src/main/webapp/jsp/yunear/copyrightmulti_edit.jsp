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
		if($("#KEYWORDS").val()==""){
			$("#KEYWORDS").tips({
				side:3,
	            msg:'请输入标签',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#KEYWORDS").focus();
			return false;
		}
		if($("#PAY_TYPE").val()==""){
			$("#PAY_TYPE").tips({
				side:3,
	            msg:'请输入付费类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PAY_TYPE").focus();
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
		if($("#PRICE").val() <= "-1"){
			$("#PRICE").tips({
				side:3,
	            msg:'价格不能为负值',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRICE").focus();
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
		if($("#PRICE").val() <= "-1"){
			$("#PRICE").tips({
				side:3,
	            msg:'价格不能为负值',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PRICE").focus();
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
		<li><i class="icon-home"></i> <a>多媒体管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
		<li class="active">修改多媒体</li>
	</ul><!--.breadcrumb-->
	
</div><!--#breadcrumbs-->
</div>
	<form action="copyrightmulti/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="COPYRIGHTMULTI_ID" id="COPYRIGHTMULTI_ID" value="${pd.COPYRIGHTMULTI_ID}"/>
		<div id="zhongxin" align="center">
		<table>
			<tr>
				<td><input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="版权方ID" title="版权方ID" readonly="readonly"/></td>
			</tr>
			<tr>
				<td><input type="text" name="MEDIA_NAME" id="MEDIA_NAME" value="${pd.MEDIA_NAME}" maxlength="32" placeholder="多媒体名称" title="多媒体名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="KEYWORDS" id="KEYWORDS" value="${pd.KEYWORDS}" maxlength="32" placeholder="标签" title="标签"/></td>
			</tr>
			<tr>
				<td><select id="selectError3" name="PAY_TYPE" id="PAY_TYPE"
						onchange="feeType()" style="width: 220px" class="chzn-select">
							<option value="0" ${pd.PAY_TYPE=="0"?"selected":""}>免费</option>
							<option value="1" ${pd.PAY_TYPE=="1"?"selected":""}>付费</option>
					</select>
						<div id="v2" style="display: none;">
							<div>
								<input type="number" name="PRICE" id="PRICE"
									maxlength="32" placeholder="价格" title="价格" value="${pd.PRICE}" />
							</div>
						</div></td>
			</tr>
			<tr>
				<td><textarea rows="" cols="" name="DESCR" id="DESCR"
							maxlength="127" placeholder="描述（最多127个字）" title="描述" >${pd.DESCR}</textarea>
			</tr>
			<tr>
				<td><input type="file" name="file_upload" id="file_upload">
						<input type="hidden" name="PATH" id="PATH" value="${pd.PATH}"
						maxlength="32" placeholder="多媒体路径" title="多媒体路径" /></td>
			</tr>
			<tr>
				<td><select name="TYPE" id="TYPE" style="width: 220px" class="chzn-select">
							<option value="01"  ${pd.TYPE=="01"?"selected":""}>视频</option>
							<option value="02"  ${pd.TYPE=="02"?"selected":""}>音频</option>
					</select>
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
		<link href="uploadify/uploadify.css" rel="stylesheet" type="text/css" />
		<script src="uploadify/jquery.uploadify.v2.1.4.min.js"
		type="text/javascript"></script>
		<script src="uploadify/swfobject.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(window.parent.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		 $(document).ready(function () {
			  //$('#file_upload').change(function(){
				  $('#file_upload')
					.uploadify({
								//校验数据				
								'script' : '<%=basePath%>uploadify/uploadFile.jsp', //指定上传控件的主体文件，默认‘uploader.swf’
								'uploader' : 'uploadify/uploadify.swf', //指定服务器端上传处理文件，默认‘upload.php’
								'auto' : true, //自动上传												
								'multi' : false, //单文件上传
								'cancelImg': 'uploadify/cancel.png', //取消图片路径 
								'fileExt' : '*.avi;*.rmvb;*.rm;*.asf;*.divx;*.mpg;*.mpeg;*.mpe;*.wmv;*.mp4;*.mkv;*.vob',//允许的格式
								'sizeLimit' : 314572800, //上传文件的大小限制，单位为B, KB, MB, 或 GB
								'successTimeout' : '30', //成功等待时间
								'buttonText' : 'Upload Multi',//按钮上的文字  
								'displayData' : 'speed',//有speed和percentage两种，一个显示速度，一个显示完成百分比   
								'onComplete' : function(event, queueID, fileObj,  
			                            response, data) { 
									document.getElementById("PATH").value=response;
			                    },
								'onUploadError' : function(file, data, response) {//当上传返回错误时触发
									$('#url').append("<li>" + data + "</li>");
								}
							});
			//});
			  })
			
		
		function feeType(){
			var feeType = $("#selectError3").val();
			if (feeType == "0") {
				document.getElementById("v2").style.display="none";
			} else{
				document.getElementById("v2").style.display="block";
			};
		}
		
		</script>
</body>
</html>