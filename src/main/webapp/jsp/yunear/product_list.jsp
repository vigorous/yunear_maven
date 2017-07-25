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

<!-- main-container -->
<div class="main-container">
	<!-- #section:basics/content.breadcrumbs -->
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="#">XX管理</a>
			</li>
			<li class="active">XX管理</li>
		</ul><!-- /.breadcrumb -->
	</div>
	<!-- /section:basics/content.breadcrumbs -->

	<!-- page-content -->
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				
				<div class="col-sm-12 widget-container-col ui-sortable">
					<!-- #section:custom/widget-box.options.transparent -->
					<div class="widget-box transparent ui-sortable-handle" style="opacity: 1;">
						<div class="widget-header">
							<h5 class="widget-title smaller">查询条件</h5>
				
							<div class="widget-toolbar no-border">
								<a data-action="settings" href="#">
									<i class="ace-icon fa fa-cog"></i>
								</a>
				
								<a data-action="reload" href="#">
									<i class="ace-icon fa fa-refresh"></i>
								</a>
				
								<a data-action="collapse" href="#">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>
				
								<a data-action="close" href="#">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>
						
				<div class="widget-body" style="display: block;">
				<div class="widget-main padding-6 no-padding-left no-padding-right">
				<!-- 查询  -->
				<form class="form-horizontal" role="form" action="product/list.do" method="post" name="Form" id="Form">
					<!-- 条件 -->
					<div class="form-group">
						<!--  -->
						<label class="col-sm-1 control-label no-padding-right" for="form-field-1">关键词:</label>
						<div class="col-sm-2">
							<span class="input-icon">
								<input autocomplete="on" id="nav-search-input" class="form-control" type="text" name="field1" placeholder="关键词" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</div>
						
						<!--  -->
						<label class="col-sm-1 control-label no-padding-right" for="lastLoginStart">开始日期:</label>
						<div class="col-sm-2">
							<div class="input-group">
								<input id="lastLoginStart" name="lastLoginStart" class="form-control date-picker" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" placeholder="开始日期" title="开始日期">
								<span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
							</div>
						</div>
						
						<!--  -->
						<label class="col-sm-1 control-label no-padding-right" for="lastLoginEnd">结束日期:</label>
						<div class="col-sm-2">
							<div class="input-group">
								<input id="lastLoginEnd" name="lastLoginEnd" class="form-control date-picker" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" placeholder="结束日期" title="结束日期">
								<span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
							</div>
						</div>
						
						<!--  -->
						<label class="col-sm-1 control-label no-padding-right" for="STATUS">状态:</label>
						<div class="col-sm-2">
							<select class="form-control" name="STATUS" id="status" data-placeholder="请选择状态">
								<option value=""></option>
								<option value="1">正常</option>
								<option value="2">冻结</option>
						  	</select>
						</div>
						
					</div>
					<!-- 条件 -->
					<div class="form-group">
						<!--  -->
						<label class="col-sm-1 control-label no-padding-right" for="form-field-1">关键词:</label>
						<div class="col-sm-2">
							<span class="input-icon">
								<input autocomplete="on" id="nav-search-input" class="form-control" type="text" name="field1" placeholder="关键词" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</div>
						
						<!--  -->
						<label class="col-sm-1 control-label no-padding-right" for="lastLoginStart">开始日期:</label>
						<div class="col-sm-2">
							<div class="input-group">
								<input id="lastLoginStart" name="lastLoginStart" class="form-control date-picker" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" placeholder="开始日期" title="开始日期">
								<span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
							</div>
						</div>
						
						<!--  -->
						<label class="col-sm-1 control-label no-padding-right" for="lastLoginEnd">结束日期:</label>
						<div class="col-sm-2">
							<div class="input-group">
								<input id="lastLoginEnd" name="lastLoginEnd" class="form-control date-picker" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" placeholder="结束日期" title="结束日期">
								<span class="input-group-addon">
									<i class="fa fa-calendar bigger-110"></i>
								</span>
							</div>
						</div>
						
						<!--  -->
						<label class="col-sm-1 control-label no-padding-right" for="STATUS">状态:</label>
						<div class="col-sm-2">
							<select class="form-control" name="STATUS" id="status" data-placeholder="请选择状态">
								<option value=""></option>
								<option value="1">正常</option>
								<option value="2">冻结</option>
						  	</select>
						</div>
						
					</div>
					<!-- /条件 -->
					
					<!-- 按钮控件 -->
					<div class="form-group">
						<label class="col-sm-12 control-label no-padding-right" for="form-field-1-1">
							<button class="btn btn-mini btn-light" onclick="search();"  title="查询">
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</button>
							<c:if test="${QX.cha == 1 }">
								<a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL">
									<i id="nav-search-icon" class="ace-icon fa fa-download"></i>
								</a>
							</c:if>
						</label>
					</div>
					<!-- /按钮控件 -->
				</form>
				</div>
				</div>
				<!-- /查询  -->
				</div>
				</div>
				
				
				<div class="hr hr-8 dotted hr-double"></div>
			
				<!-- 结果 -->
				<table id="simple-table" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" id="zcheckbox" />
									<span class="lbl"></span>
								</label>
							</th>
							<th>序号</th>
							<th>产品名称</th>
							<th>状态</th>
							<th class="center">操作</th>
						</tr>
					</thead>
											
					<tbody>
						
					<!-- 开始循环 -->	
					<c:choose>
						<c:when test="${not empty varList}">
							
							<c:if test="${QX.cha == 1 }">
								<c:forEach items="${varList}" var="var" varStatus="vs">
									<tr>
										<td class='center' style="width:30px;">
											<label class="pos-rel">
												<input type='checkbox' class="ace" name='ids' value="${var.PRODUCT_ID}" />
												<span class="lbl"></span>
											</label>
										</td>
										<td class='center' style="width:50px;">${vs.index+1}</td>
										<td><a href="jsp/yunear/product_tab.jsp">${var.PRODUCT_NAME}</a></td>
										<td>${var.STATUS}</td>
										<td class="center" style="width:120px;">
										
											<!-- 正常窗口	按钮控件 -->
											<div class="hidden-sm hidden-xs btn-group">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
													<span class="label label-large label-grey arrowed-in-right arrowed-in">
														<i class="ace-icon fa fa-lock" title="无权限"></i>
													</span>
												</c:if>
												<c:if test="${QX.edit == 1 }">
													<a title="编辑" onclick="edit('${var.PRODUCT_ID}');" class="btn btn-mini btn-success">
														<i class="ace-icon fa fa-edit"></i>
													</a>
												</c:if>
												<c:if test="${QX.del == 1 }">
													<a title="删除" onclick="del('${var.PRODUCT_ID}');" class="btn btn-mini btn-danger">
														<i class="glyphicon glyphicon-trash"></i>
													</a>
												</c:if>
											</div>
											
											<!-- 缩小窗口	按钮控件 -->
											<div class="hidden-md hidden-lg">
												<c:choose>
													<c:when test="${QX.edit != 1 && QX.del != 1 }">
														<span class="label label-large label-grey arrowed-in-right arrowed-in">
															<i class="ace-icon fa fa-lock" title="无权限"></i>
														</span>
													</c:when>
													<c:otherwise>
														<div class="inline pos-rel">
															<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
																<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
															</button>
															<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																<c:if test="${QX.edit == 1 }">
																	<li>
																		<a href="javascript:edit('${var.PRODUCT_ID}');" class="tooltip-success" data-rel="tooltip" title="编辑">
																			<span class="green">
																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a>
																	</li>
																</c:if>
																
																<c:if test="${QX.del == 1 }">
																	<li>
																		<a href="javascript:del('${var.PRODUCT_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																			<span class="red">
																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a>
																	</li>
																</c:if>
															</ul>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							
							<c:if test="${QX.cha == 0 }">
								<tr>
									<td colspan="100" class="center">您无权查看</td>
								</tr>
							</c:if>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="100" class="center" >没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<!-- /结果 -->
			
			</div><!-- /.col-xs-12 -->
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-sm-5">
						<c:if test="${QX.add == 1 }">
							<a class="btn btn-small btn-success" onclick="add();">新增</a>
						</c:if>
						<c:if test="${QX.del == 1 }">
							<a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >
								<i class='glyphicon glyphicon-trash'></i>
							</a>
						</c:if>
					</div>
					<div class="col-sm-7">
						<div style="float: right;padding-top: 0px;margin-top: 0px;">
							${page.pageStr}
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div><!--/.page-content-->
</div><!--/.main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		
		<!-- 引入 -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->

		<!--[if IE]-->
		<!-- <script type="text/javascript">
			window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script> -->
		<!--[endif]-->
		
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="Ace_Admin_1.3.3/assets/js/bootstrap.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/bootbox.js"></script>
		<!-- page specific plugin scripts -->
		<!--[if lte IE 8]>
		  <script src="Ace_Admin_1.3.3/assets/js/excanvas.js"></script>
		<![endif]-->
		<script src="Ace_Admin_1.3.3/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/date-time/moment.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/chosen.jquery.js"></script>
		
		<!-- <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> -->
		<script type="text/javascript" src="layer-v2.1/layer/layer.js"></script>
		<script type="text/javascript" src="layer-v2.1/layer/extend/layer.ext.js"></script>
		
		<!-- ace scripts -->
		<!-- <script src="Ace_Admin_1.3.3/assets/js/ace/elements.scroller.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.colorpicker.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.fileinput.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.typeahead.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.spinner.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.treeview.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.wizard.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.aside.js"></script> -->
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.js"></script>
		<!-- <script src="Ace_Admin_1.3.3/assets/js/ace/ace.ajax-content.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.touch-drag.js"></script> -->
		<!-- <script src="Ace_Admin_1.3.3/assets/js/ace/ace.sidebar.js"></script> -->
		<!-- <script src="Ace_Admin_1.3.3/assets/js/ace/ace.sidebar-scroll-1.js"></script> -->
		<!-- <script src="Ace_Admin_1.3.3/assets/js/ace/ace.submenu-hover.js"></script> -->
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.widget-box.js"></script>
		<!-- <script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings-skin.js"></script> -->
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.widget-on-reload.js"></script>
		<!-- <script src="Ace_Admin_1.3.3/assets/js/ace/ace.searchbox-autocomplete.js"></script> -->
		
		
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
			
			//select/deselect a row when the checkbox is checked/unchecked
			$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
				var $row = $(this).closest('tr');
				if(this.checked) $row.addClass(active_class);
				else $row.removeClass(active_class);
			});
			
			var ksrq = $('#lastLoginStart')[0];
		 	if(ksrq.type !== 'date') {//if browser doesn't support "date" input
		    	$(ksrq).datepicker({
		      	//options
		    	})
			}
		 	
		 	var jsrq = $('#lastLoginEnd')[0];
		 	if(jsrq.type !== 'date') {//if browser doesn't support "date" input
		    	$(jsrq).datepicker({
		      	//options
		    	})
			}
		 	
		 	/* $('.widget-container-col').sortable({
		        connectWith: '.widget-container-col',
				items:'> .widget-box',
				handle: ace.vars['touch'] ? '.widget-header' : false,
				cancel: '.fullscreen',
				opacity:0.8,
				revert:true,
				forceHelperSize:true,
				placeholder: 'widget-placeholder',
				forcePlaceholderSize:true,
				tolerance:'pointer',
				start: function(event, ui) {
					//when an element is moved, it's parent becomes empty with almost zero height.
					//we set a min-height for it to be large enough so that later we can easily drop elements back onto it
					ui.item.parent().css({'min-height':ui.item.height()})
					//ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
				},
				update: function(event, ui) {
					ui.item.parent({'min-height':''})
					//p.style.removeProperty('background-color');
				}
		    }); */
		});
		
		//检索
		function search(){
			window.parent.jzts();
			$("#Form").submit();
		}
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>/product/excel.do';
		}
		
		//新增
		function add(){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>/product/goAdd.do';
			 diag.Width = 750;
			 diag.Height = 455;
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
			 
			 /* layer.open({
                type: 2,
                title: '员工新增',
                shadeClose: false,
                shade: 0.3,
                closeBtn:2,
                shift:4,
                maxmin: true, //开启最大化最小化按钮
                area: ['950px', '500px'],
                content: 'product_edit.jsp';
            }); */
			 
			 <%-- $.post('<%=basePath%>/product/goAdd.do', {}, function(str){
			    layer.open({
			        type: 1,
			        title: '新增',
			        shadeClose: true,
	                shade: 0.3,
	                closeBtn:2,
	                shift:4,
			        maxmin: true, //开启最大化最小化按钮
	                area: ['750px', '455px'],
			        content: str, //注意，如果str是object，那么需要字符拼接。
			        end:function(){
			        	/* layer.alert("被销毁"); */
			        	/* nextPage('${page.currentPage}'); */
			        }
			    }); 
			});--%>
		}
		
		
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>/product/delete.do?PRODUCT_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if(data=="success"){
							nextPage('${page.currentPage}');
						}
					});
				}
			});
		}
		
		//修改
		var index;
		function edit(Id){
			 <%-- window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>/product/goEdit.do?PRODUCT_ID='+Id;
			 diag.Width = 770;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show(); --%>
			 window.parent.jzts();
			 $.post('<%=basePath%>/product/goEdit.do?PRODUCT_ID='+Id, {},
			 	function(str){
					index = layer.open({
				        type: 1,
				        title: '编辑',
				        shadeClose: true,
		                shade: 0.3,
		                closeBtn:2,
		                shift:4,
				        maxmin: true, //开启最大化最小化按钮
		                area: ['750px', '455px'],
		                btn: ['取消'],
				        content: str, //注意，如果str是object，那么需要字符拼接。
				        end:function(){
				        	//layer.msg(str);
				        	//nextPage('${page.currentPage}');
				        },
					    yes: function(index, layero){
					        //do something
					        nextPage('${page.currentPage}');
					        layer.close(index); //如果设定了yes回调，需进行手工关闭
					    }
					});
				});
		}
		
		//批量操作
		function makeAll(msg){
			/* layer.confirm(msg,{icon: 3, title:'提示'},function(index){
				layer.alert(index);
				layer.close(index);
			});
			return; */
			/* layer.tips('只想提示地精准些', '#zcheckbox',{tips:1});
			return ; */
			bootbox.confirm(msg, function(result) {
				/* layer.alert(result);
				return; */
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog({  
							message: "您没有选择任何内容!",  
							buttons: {  
								Cancel: {  
									label: "关闭",  
									className: "btn-small btn-success",  
									callback: function () {
										
									}  
								}  
							}  
						});
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							$.ajax({
								type: "POST",
								url: '<%=basePath%>/product/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage('${page.currentPage}');
									 });
								}
							});
						}
					}
				}
			});
		}
		</script>
	</body>
</html>

