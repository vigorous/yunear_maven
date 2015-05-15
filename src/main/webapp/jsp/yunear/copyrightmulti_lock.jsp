<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<link rel="stylesheet" href="css/datepicker.css" />
<!-- 日期框 -->
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/jquery.tips.js"></script>

<!--引入弹窗组件start-->
<script type="text/javascript" src="js/attention/zDialog/zDrag.js"></script>
<script type="text/javascript" src="js/attention/zDialog/zDialog.js"></script>
<!--引入弹窗组件end-->
		
<script type="text/javascript">
	function pass(status,id) {
		var COPYRIGHTMULTI_ID = id;
		var status = status;
		alert(status+"--"+COPYRIGHTMULTI_ID);
		<%-- var url = "<%=basePath%>/copyrightmulti/lock.do"; --%>
		
		var url = "<%=basePath%>/copyrightmulti/lock.do?COPYRIGHTMULTI_ID="+COPYRIGHTMULTI_ID+"&status="+status;
		$.get(url,function(data){
			if(data=="success"){
				nextPage(${page.currentPage});
			}
		});
		<%-- $.post(url,{'status':status,'COPYRIGHTMULTI_ID':COPYRIGHTMULTI_ID},function(data){
			window.location = "<%=basePath%>/copyrightmulti/auditlist.do";
		}); --%>
		
		Dialog.close();
	}
</script>
</head>
<body>
	<div class="container-fluid" id="main-container">

		<div id="breadcrumbs">

			<ul class="breadcrumb">
				<li><i class="icon-home"></i> <a>多媒体管理</a><span class="divider"><i
						class="icon-angle-right"></i></span></li>
				<li class="active">审核多媒体</li>
			</ul>
			<!--.breadcrumb-->

		</div>
		<!--#breadcrumbs-->
	</div>
		<input type="hidden" name="COPYRIGHTMULTI_ID" id="COPYRIGHTMULTI_ID"
			value="${pd.COPYRIGHTMULTI_ID}" />
		<div id="zhongxin" align="center">
			<table>
				<tr >
					<td align="right"></td>
					<td align="center"><input type="hidden" name="USER_ID" id="USER_ID"
						value="${pd.USER_ID}" maxlength="32" placeholder="版权方ID"
						title="版权方ID" readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">多媒体名称:</td>
					<td align="center"><input type="text" name="MEDIA_NAME" id="MEDIA_NAME"
						value="${pd.MEDIA_NAME}" maxlength="32" placeholder="多媒体名称"
						title="多媒体名称" readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">标签:</td>
					<td align="center"><input type="text" name="KEYWORDS" id="KEYWORDS"
						value="${pd.KEYWORDS}" maxlength="32" placeholder="标签" title="标签"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">收费类型:</td>
					<td align="center"><input type="text" name="PAY_TYPE" id="PAY_TYPE"
						value="${pd.PAY_TYPE=="0"?"免费":"收费"}" maxlength="32"
						placeholder="收费类型" title="标签" readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">价格:</td>
					<td align="center"><input type="text" name="PRICE" id="PRICE"
						value="${pd.PRICE}" maxlength="32" placeholder="价格" title="标签"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">多媒体描述:</td>
					<td align="center"><input type="text" name="DESCR" id="DESCR"
						value="${pd.DESCR}" maxlength="32" placeholder="描述" title="标签"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">多媒体:</td>
					<td><video width="500" height="450" controls="controls"
							preload="auto">
							<source src="/uploadify/uploads/${pd.PATH}" type="video/mp4" />
						</video></td>
				</tr>
				<tr>
					<td align="right">视频类型:</td>
					<td align="center"><input type="text" name="TYPE" id="TYPE"
						value="${pd.TYPE==" 01"?"视频":"音频"}" maxlength="32"
						placeholder="多媒体类型" title="标签" readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">创建时间:</td>
					<td align="center"><input type="text" name="DATE_CREATE" id="DATE_CREATE"
						value="${pd.DATE_CREATE}" maxlength="32" placeholder="创建时间"
						title="标签" readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">修改时间:</td>
					<td align="center"><input type="text" name="DATE_MODIFY" id="DATE_MODIFY"
						value="${pd.DATE_MODIFY}" maxlength="32" placeholder="修改时间"
						title="标签" readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">状态:</td>
					<td align="center"><input type="text" name="IS_DELETE" id="IS_DELETE"
						value="${pd.IS_DELETE=="0"?"未删除":"已删除"}" maxlength="32"
						placeholder="状态" title="标签" readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right">审核状态:</td>
					<td align="center"><input type="text" name="AUDIT_STATUS" id="AUDIT_STATUS"
						value="${pd.AUDIT_STATUS==" 99"?"待审核":""}${pd.AUDIT_STATUS==
						"00"?"审核通过":""}${pd.AUDIT_STATUS==
						"01"?"审核不通过":""}" maxlength="32" placeholder="审核状态" title="标签"
						readonly="readonly" /></td>
				</tr>

				<tr>
					
					<td style="text-align: center;" colspan="2"><a
						class="btn btn-mini btn-primary" onclick="pass(1,'${pd.COPYRIGHTMULTI_ID}');">审核通过</a> <a
						class="btn btn-mini btn-primary" onclick="pass(2,'${pd.COPYRIGHTMULTI_ID}');">审核不通过</a>
					</td>
					<td></td>
				</tr>
			</table>
		</div>

		<div id="zhongxin2" class="center" style="display: none">
			<br />
			<br />
			<br />
			<br />
			<br />
			<img src="images/jiazai.gif" /><br />
			<h4 class="lighter block green">提交中...</h4>
		</div>


	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/ace-elements.min.js"></script>
	<script src="js/ace.min.js"></script>
	<script type="text/javascript" src="js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript">
		$(window.parent.hangge());

		</script>
</body>
</html>