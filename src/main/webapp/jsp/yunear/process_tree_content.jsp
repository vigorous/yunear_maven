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
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../system/admin/top.jsp"%> 
	</head>
<body>
		
<div class="container-fluid" id="main-container">

	<!-- <div class="container-fluid" id="main-container">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i><a>树形结构</a>
					<span class="divider"><i class="icon-angle-right"></i></span></li>
			</ul>.breadcrumb
		</div>#breadcrumbs
	</div> -->

<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
		 
		 <div class="span12">
		 	asdfa
			<%-- <div class="widget-box">
				<div class="widget-header header-color-blue">
					<h5 class="bigger lighter"><i class="icon-table"></i> Tables & Colors</h5>
					<div class="widget-toolbar widget-toolbar-light no-border">
						<select id="simple-colorpicker-1" class="hidden">
							  <option selected data-class="blue" value="#307ECC">#307ECC</option>
							  <option data-class="blue2" value="#5090C1">#5090C1</option>
							  <option data-class="blue3" value="#6379AA">#6379AA</option>
							  
							  <option data-class="green" value="#82AF6F">#82AF6F</option>
							  <option data-class="green2" value="#2E8965">#2E8965</option>
							  <option data-class="green3" value="#5FBC47">#5FBC47</option>
							  
							  <option data-class="red" value="#E2755F">#E2755F</option>
							  <option data-class="red2" value="#E04141">#E04141</option>
							  <option data-class="red3" value="#D15B47">#D15B47</option>
							  
							  <option data-class="orange" value="#FFC657">#FFC657</option>
							  <option data-class="purple" value="#7E6EB0">#7E6EB0</option>
							  <option data-class="pink" value="#CE6F9E">#CE6F9E</option>
							  <option data-class="dark" value="#404040">#404040</option>
							  <option data-class="grey" value="#848484">#848484</option>
							  <option data-class="default" value="#EEE">#EEE</option>
						</select>
					</div>
				</div>
			
				<div class="widget-body">
					<div id="zhongxin" align="center">
						<table id="table_bug_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="text-align: right;color: blue">工序名称：</td>
								<td>${pd.PORCESS_NAME}</td>
								<td style="text-align: right;color: blue">工序名称：</td>
								<td>${pd.PORCESS_NAME}</td>
								<td><input type="text" name="PORCESS_NAME" id="PORCESS_NAME" value="${pd.PORCESS_NAME}" maxlength="32" placeholder="这里输入工序名称" title="工序名称"/></td>
							</tr>
							<tr>
								<td style="text-align: right;color: blue">工序类别：</td>
								<td>${pd.PROCESS_TYPE}</td>
								<td style="text-align: right;color: blue">工序类别：</td>
								<td>${pd.PROCESS_TYPE}</td>
								<td><input type="text" name="PROCESS_TYPE" id="PROCESS_TYPE" value="${pd.PROCESS_TYPE}" maxlength="32" placeholder="这里输入工序类别" title="工序类别"/></td>
							</tr>
							<tr>
								<td style="text-align: right;color: blue">输入单位：</td>
								<td>${pd.PROCESS_INPUT_UNIT}</td>
								<td style="text-align: right;color: blue">输入单位：</td>
								<td>${pd.PROCESS_INPUT_UNIT}</td>
								<td><input type="text" name="PROCESS_INPUT_UNIT" id="PROCESS_INPUT_UNIT" value="${pd.PROCESS_INPUT_UNIT}" maxlength="32" placeholder="这里输入工序投入单位" title="工序投入单位"/></td>
							</tr>
							<tr>
								<td style="text-align: right;color: blue">输出单位：</td>
								<td>${pd.PROCESS_OUTPUT_UNIT}</td>
								<td style="text-align: right;color: blue">输出单位：</td>
								<td>${pd.PROCESS_OUTPUT_UNIT}</td>
								<td><input type="text" name="PROCESS_OUTPUT_UNIT" id="PROCESS_OUTPUT_UNIT" value="${pd.PROCESS_OUTPUT_UNIT}" maxlength="32" placeholder="这里输入工序输出单位" title="工序输出单位"/></td>
							</tr>
							<tr>
								<td style="text-align: right;color: blue">创建时间：</td>
								<td>${pd.PROCESS_CREATE_DATE}</td>
								<td style="text-align: right;color: blue">创建时间：</td>
								<td>${pd.PROCESS_CREATE_DATE}</td>
								<td><input class="span10 date-picker" name="PROCESS_CREATE_DATE" id="PROCESS_CREATE_DATE" value="${pd.PROCESS_CREATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="工序创建日期" title="工序创建日期"/></td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: center;">
									<a class="btn btn-mini btn-primary" href="<%=basePath%>process/list.do">返回</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div> --%>
		</div>
		 
	</div>
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->

</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<!-- <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a> -->
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/ace-elements.min.js"></script>
		<script src="js/ace.min.js"></script>
		
		<script type="text/javascript" src="js/jquery-ui-1.10.2.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.ui.touch-punch.min.js"></script>
		<script type="text/javascript" src="js/jquery.slimscroll.min.js"></script>
		<script type="text/javascript" src="js/jquery.easy-pie-chart.min.js"></script>
		<script type="text/javascript" src="js/jquery.sparkline.min.js"></script>
		<script type="text/javascript" src="js/jquery.flot.min.js"></script>
		<script type="text/javascript" src="js/jquery.flot.pie.min.js"></script>
		<script type="text/javascript" src="js/jquery.flot.resize.min.js"></script>
		
		<script type="text/javascript" src="js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(window.parent.parent.hangge());
		
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		/* 双击事件 */
		function dbClick(process_id){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="工序明细";
			 diag.URL = '<%=basePath%>/process/detail.do?PROCESS_ID='+process_id;
			 diag.Width = 750;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 window.parent.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage('${page.currentPage}');
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		function back(){
			$.ajax({
				type: "POST",
				url: '<%=basePath%>/process/list.do',
		    	data: {DATA_IDS:'123456'},
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					alert(data.varList[0].PROCESS_ID);
					$.each(data.varList, function(i, varList){
						//alert(i);
						$("#home").append("<input type='text' value='按钮'/>");
					});
				}
			});
		}
		</script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		
	</body>
</html>

