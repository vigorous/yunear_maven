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
		<title></title>
		
		<!-- <meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/font-awesome.min.css" /> -->
		
		<!--[if IE 7]><link rel="stylesheet" href="css/font-awesome-ie7.min.css" /><![endif]-->
		<!--[if lt IE 9]><link rel="stylesheet" href="css/ace-ie.min.css" /><![endif]-->
		
		<!-- <link rel="stylesheet" href="css/ace.min.css" />
		<link rel="stylesheet" href="css/ace-responsive.min.css" />
		<link rel="stylesheet" href="css/ace-skins.min.css" /> -->
		
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/font-awesome.css" />
		<!-- text fonts -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/ace-fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
		
		<script type="text/javascript" src="js/bootbox.min.js"></script><!-- 确认窗口 -->
				
		<!--引入弹窗组件start-->
		<script type="text/javascript" src="js/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="js/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
		
<script type="text/javascript">
	
	$(window.parent.hangge());
	
	$(function() {
		
		//And for the first simple table, which doesn't have TableTools or dataTables
		//select/deselect all rows according to table header checkbox
		var active_class = 'active';
		$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
			var th_checked = this.checked;//checkbox inside "TH" table header
			
			$(this).closest('table').find('tbody > tr').each(function(){
				var row = this;
				if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
				else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
			});
		});
	});
	//新增
	function add(PARENT_ID){
		 window.parent.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>/zidian/toAdd.do?PARENT_ID='+PARENT_ID;
		 diag.Width = 223;
		 diag.Height = 175;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var num = '${page.currentPage}';
			 	if(num == '0'){
			 		window.parent.jzts();
			 		location.href = location.href;
			 	}else{
			 		nextPage('${page.currentPage}');
			 	}
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	//修改
	function edit(ZD_ID){
		 window.parent.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>/zidian/toEdit.do?ZD_ID='+ZD_ID;
		 diag.Width = 223;
		 diag.Height = 175;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage('${page.currentPage}');
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	//删除
	function del(ZD_ID){
		var flag = false;
		if(confirm("确定要删除该数据吗?")){
			flag = true;
		}
		if(flag){
			var url = "<%=basePath%>/zidian/del.do?ZD_ID="+ZD_ID+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if(data=="success"){
					nextPage('${page.currentPage}');
				}else{
					alert("删除失败，请先删除其下级数据!"); 
				}
			});
		}
	}
	
</script>
</head>

<body>
<div class="page-content">
<div class="row">
	
	<!-- 检索  -->
	<form action="<%=basePath%>/zidian.do" method="post" name="userForm" id="userForm">
		<input name="PARENT_ID" id="PARENT_ID" type="hidden" value="${pd.PARENT_ID }" />
		<table>
			<tr>
				<td><font color="#808080">检索：</font></td>
				<td><input type="text" name="NAME" value="${pd.NAME }" placeholder="这里输入名称" style="width:130px;height:30px;"/></td>
				<td style="vertical-align:top;">
					<button class="btn btn-xs" onclick="search();">
						<i class="ace-icon fa fa-search nav-search-icon"></i>
					</button>
				</td>
				<c:if test="${pd.PARENT_ID != '0'}">
					<c:choose>
						<c:when test="${not empty varsList}">
							<td style="vertical-align:top;">
								<a href="<%=basePath%>/zidian.do?PARENT_ID=0" class="btn btn-xs btn-purple" title="查看">顶级
									<i class="fa fa-arrow-right"></i>
								</a>
							</td>
							<c:forEach items="${varsList}" var="var" varStatus="vsd">
								<td style="vertical-align:top;">
									&nbsp;
									<a href="<%=basePath%>/zidian.do?PARENT_ID=${var.ZD_ID }" class="btn btn-xs btn-purple" title="查看">${var.NAME }
										<i class="fa fa-arrow-right"></i>
									</a>
								</td>
							</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:if>
				
			</tr>
		</table>
	<!-- 检索  -->
		
		<br/>

		<table id="simple-table" class="table table-striped table-bordered table-hover">
			<thead>
			<tr>
				<th class="center"  style="width: 50px;">序号</th>
				<th class='center'>名称</th>
				<th class='center'>编码</th>
				<th class='center'>级别</th>
				<th class='center'>操作</th>
			</tr>
			</thead>
			<c:choose>
				<c:when test="${not empty varList}">
					<c:forEach items="${varList}" var="var" varStatus="vs">
					<tr>
					<td class="center">${var.ORDY_BY }</td>
					<td class='center'><a href="<%=basePath%>/zidian.do?PARENT_ID=${var.ZD_ID }" title="查看下级"><i class="fa fa-long-arrow-right"></i>&nbsp;${var.NAME }</a></td>
					<td class='center'>${var.P_BM }</td>
					<td class='center'><b class="green">${var.JB }</b></td>
					<td style="width: 88px;">
					<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.ZD_ID }')" ><i class='ace-icon fa fa-edit'></i></a>
					<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.ZD_ID }')"><i class='glyphicon glyphicon-trash'></i></a>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
					<td colspan="100" class="center">没有相关数据</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;width:50px;"><a class="btn btn-small btn-success" onclick="add('${pd.PARENT_ID}');">新增</a></td>
				<c:if test="${pd.PARENT_ID != '0'}">
					<td style="vertical-align:top;" class="left">
						<a class="btn btn-small btn-info" onclick="location.href='<%=basePath%>/zidian.do?PARENT_ID=${pdp.PARENT_ID }';">返回</a>
					</td>
				</c:if>
				<td style="vertical-align:top;">
					<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">
						${page.pageStr}
					</div>
				</td>
			</tr>
		</table>
		</div>
	
	</form>
</div>
</div>

</body>
</html>