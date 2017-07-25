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
		<!-- jsp文件头和头部 -->
		<%@ include file="../admin/top.jsp"%> 
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/jquery-ui.custom.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/chosen.css" />
		<link rel="stylesheet" href="Ace_Admin_1.3.3/assets/css/datepicker.css" />
	</head> 

<body>
		
		
<div class="main-content-inner">
	
	<!-- #section:basics/content.breadcrumbs -->
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="#">系统管理</a>
			</li>
			<li class="active">系统用户</li>
		</ul><!-- /.breadcrumb -->
	</div>
	<!-- /section:basics/content.breadcrumbs -->
	
	<div class="page-content">
	 	<div class="row">
			<div class="col-xs-12">
			
				<!-- <h3 class="header smaller lighter blue">jQuery dataTables</h3>

				<div class="clearfix">
					<div class="pull-right tableTools-container"></div>
				</div>
				<div class="table-header">
					Results for "Latest Registered Domains"
				</div> -->

				<!-- div.table-responsive -->

				<!-- div.dataTables_borderWrap -->
				
				<div>
					<table id="dynamic-table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" id="zcheckbox" />
										<span class="lbl"></span>
									</label>
								</th>
								<th>编号</th>
								<th>用户名</th>
								<th>姓名</th>
								<th>职位</th>
								<th><i class="fa fa-envelope"></i>邮箱</th>
								<th class="center">操作</th>
							</tr>
						</thead>
											
						<tbody>
							
					<!-- 开始循环 -->	
					<c:choose>
						<c:when test="${not empty userList}">
							<c:if test="${QX.cha == 1 }">
							<c:forEach items="${userList}" var="user" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">
									<c:if test="${user.USERNAME != 'admin'}">
										<label class="pos-rel">
											<input type='checkbox' class="ace" name='ids' value="${user.USER_ID }"/>
											<span class="lbl"></span>
										</label>
									</c:if>
									<c:if test="${user.USERNAME == 'admin'}">
										<label class="pos-rel">
											<input type='checkbox' class="ace" disabled="disabled" />
											<span class="lbl"></span>
										</label>
									</c:if>
								</td>
								<td>${user.NUMBER }</td>
								<td><a>${user.USERNAME }</a></td>
								<td>${user.NAME }</td>
								<td>${user.ROLE_NAME }</td>
								<td>${user.EMAIL }</td>
								<td>
									<div class='hidden-sm hidden-xs action-buttons'>
													
										<c:if test="${QX.edit != 1 && QX.del != 1 }">
											<span class="label label-large label-grey arrowed-in-right arrowed-in">
												<i class="fa fa-lock" title="无权限"></i>
											</span>
										</c:if>
										
										<c:if test="${QX.edit == 1 }">
											<c:if test="${user.USERNAME != 'admin'}">
												<a class='btn btn-mini btn-info' title="编辑" onclick="editUser('${user.USER_ID }');">
													<i class='fa fa-edit'></i>
												</a>
											</c:if>
											<c:if test="${user.USERNAME == 'admin'}">
												<a class='btn btn-mini btn-info' title="不能编辑">
													<i class='fa fa-edit'></i>
												</a>
											</c:if>
										</c:if>
										
										<c:choose>
											<c:when test="${user.USERNAME=='admin'}"></c:when>
											<c:otherwise>
												<c:if test="${QX.del == 1 }">
												 <a class='btn btn-mini btn-danger' title="删除" onclick="delUser('${user.USER_ID }','${user.USERNAME }');"><i class='fa fa-trash'></i></a>
												</c:if>
											</c:otherwise>
										</c:choose>
									</div>
								</td>
							</tr>
							
							</c:forEach>
							</c:if>
							
							<c:if test="${QX.cha == 0 }">
								<tr>
									<td colspan="10" class="center">您无权查看</td>
								</tr>
							</c:if>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="10" class="center">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>				
							
						</tbody>
					</table>
				</div>
			
		 	
				<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;">
								<c:if test="${QX.add == 1 }">
								<a class="btn btn-small btn-success" onclick="add();">新增</a>
								</c:if>
								<c:if test="${QX.del == 1 }">
								<a class="btn btn-small btn-danger" onclick="delAll();" title="批量删除" ><i class='fa fa-trash'></i></a>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- PAGE CONTENT ENDS HERE -->
	  	</div><!--/row-->
		
	</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
		
		<!-- 引入 -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='Ace_Admin_1.3.3/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		
		<script src="Ace_Admin_1.3.3/assets/js/bootstrap.js"></script>
		
		<!-- page specific plugin scripts -->
		<script src="Ace_Admin_1.3.3/assets/js/dataTables/jquery.dataTables.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/dataTables/jquery.dataTables.bootstrap.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/dataTables/extensions/TableTools/js/dataTables.tableTools.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/dataTables/extensions/ColVis/js/dataTables.colVis.js"></script>
		
		
		<script src="Ace_Admin_1.3.3/assets/js/bootbox.js"></script>
		
		<!-- ace scripts -->
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.scroller.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.colorpicker.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.fileinput.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.typeahead.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.spinner.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.treeview.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.wizard.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/elements.aside.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.ajax-content.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.touch-drag.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.sidebar.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.widget-box.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.settings-skin.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/ace/ace.searchbox-autocomplete.js"></script>
		<!-- page specific plugin scripts -->
		<!--[if lte IE 8]>
		  <script src="Ace_Admin_1.3.3/assets/js/excanvas.js"></script>
		<![endif]-->
		<!-- <script src="Ace_Admin_1.3.3/assets/js/date-time/bootstrap-datepicker.js"></script>
		<script src="Ace_Admin_1.3.3/assets/js/date-time/moment.js"></script> -->
		<script src="Ace_Admin_1.3.3/assets/js/chosen.jquery.js"></script>
		
		<script type="text/javascript">
		$(window.parent.hangge());
		
		$(function() {
			//initiate dataTables plugin
			var oTable1 = 
			$('#dynamic-table')
			//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
			.dataTable( {
				bAutoWidth: false,
				"aoColumns": [
				  { "bSortable": false },
				  null, null,null, null, null,
				  { "bSortable": false }
				],
				"aaSorting": [],
		
				//,
				//"sScrollY": "200px",
				//"bPaginate": false,
		
				//"sScrollX": "100%",
				//"sScrollXInner": "120%",
				//"bScrollCollapse": true,
				//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
				//you may want to wrap the table inside a "div.dataTables_borderWrap" element
		
				//"iDisplayLength": 50
		    } );
			//oTable1.fnAdjustColumnSizing();
		
		
			//TableTools settings
			TableTools.classes.container = "btn-group btn-overlap";
			TableTools.classes.print = {
				"body": "DTTT_Print",
				"info": "tableTools-alert gritter-item-wrapper gritter-info gritter-center white",
				"message": "tableTools-print-navbar"
			}
		
			//initiate TableTools extension
			var tableTools_obj = new $.fn.dataTable.TableTools( oTable1, {
				"sSwfPath": "Ace_Admin_1.3.3/assets/js/dataTables/extensions/TableTools/swf/copy_csv_xls_pdf.swf", //in Ace demo ../assets will be replaced by correct assets path
				
				"sRowSelector": "td:not(:last-child)",
				"sRowSelect": "multi",
				"fnRowSelected": function(row) {
					//check checkbox when row is selected
					try { $(row).find('input[type=checkbox]').get(0).checked = true }
					catch(e) {}
				},
				"fnRowDeselected": function(row) {
					//uncheck checkbox
					try { $(row).find('input[type=checkbox]').get(0).checked = false }
					catch(e) {}
				},
		
				"sSelectedClass": "success",
		        "aButtons": [
					{
						"sExtends": "copy",
						"sToolTip": "Copy to clipboard",
						"sButtonClass": "btn btn-white btn-primary btn-bold",
						"sButtonText": "<i class='fa fa-copy bigger-110 pink'></i>",
						"fnComplete": function() {
							this.fnInfo( '<h3 class="no-margin-top smaller">Table copied</h3>\
								<p>Copied '+(oTable1.fnSettings().fnRecordsTotal())+' row(s) to the clipboard.</p>',
								1500
							);
						}
					},
					
					{
						"sExtends": "csv",
						"sToolTip": "Export to CSV",
						"sButtonClass": "btn btn-white btn-primary  btn-bold",
						"sButtonText": "<i class='fa fa-file-excel-o bigger-110 green'></i>"
					},
					
					{
						"sExtends": "pdf",
						"sToolTip": "Export to PDF",
						"sButtonClass": "btn btn-white btn-primary  btn-bold",
						"sButtonText": "<i class='fa fa-file-pdf-o bigger-110 red'></i>"
					},
					
					{
						"sExtends": "print",
						"sToolTip": "Print view",
						"sButtonClass": "btn btn-white btn-primary  btn-bold",
						"sButtonText": "<i class='fa fa-print bigger-110 grey'></i>",
						
						"sMessage": "<div class='navbar navbar-default'><div class='navbar-header pull-left'><a class='navbar-brand' href='#'><small>Optional Navbar &amp; Text</small></a></div></div>",
						
						"sInfo": "<h3 class='no-margin-top'>Print view</h3>\
								  <p>Please use your browser's print function to\
								  print this table.\
								  <br />Press <b>escape</b> when finished.</p>",
					}
		        ]
		    } );
			//we put a container before our table and append TableTools element to it
		    $(tableTools_obj.fnContainer()).appendTo($('.tableTools-container'));
			
			//also add tooltips to table tools buttons
			//addding tooltips directly to "A" buttons results in buttons disappearing (weired! don't know why!)
			//so we add tooltips to the "DIV" child after it becomes inserted
			//flash objects inside table tools buttons are inserted with some delay (100ms) (for some reason)
			setTimeout(function() {
				$(tableTools_obj.fnContainer()).find('a.DTTT_button').each(function() {
					var div = $(this).find('> div');
					if(div.length > 0) div.tooltip({container: 'body'});
					else $(this).tooltip({container: 'body'});
				});
			}, 200);
			
			
			
			//ColVis extension
			var colvis = new $.fn.dataTable.ColVis( oTable1, {
				"buttonText": "<i class='fa fa-search'></i>",
				"aiExclude": [0, 6],
				"bShowAll": true,
				//"bRestore": true,
				"sAlign": "right",
				"fnLabel": function(i, title, th) {
					return $(th).text();//remove icons, etc
				}
				
			}); 
			
			//style it
			$(colvis.button()).addClass('btn-group').find('button').addClass('btn btn-white btn-info btn-bold')
			
			//and append it to our table tools btn-group, also add tooltip
			$(colvis.button())
			.prependTo('.tableTools-container .btn-group')
			.attr('title', 'Show/hide columns').tooltip({container: 'body'});
			
			//and make the list, buttons and checkboxed Ace-like
			$(colvis.dom.collection)
			.addClass('dropdown-menu dropdown-light dropdown-caret dropdown-caret-right')
			.find('li').wrapInner('<a href="javascript:void(0)" />') //'A' tag is required for better styling
			.find('input[type=checkbox]').addClass('ace').next().addClass('lbl padding-8');
		
		
			
			/////////////////////////////////
			//table checkboxes
			$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
			
			//select/deselect all rows according to table header checkbox
			$('#dynamic-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) tableTools_obj.fnSelect(row);
					else tableTools_obj.fnDeselect(row);
				});
			});
			
			//select/deselect a row when the checkbox is checked/unchecked
			$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
				var row = $(this).closest('tr').get(0);
				if(!this.checked) tableTools_obj.fnSelect(row);
				else tableTools_obj.fnDeselect($(this).closest('tr').get(0));
			});
			
		
			
			
				$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
				e.stopImmediatePropagation();
				e.stopPropagation();
				e.preventDefault();
			});
			
			
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
		
			
		
			/********************************/
			//add tooltip for small view action buttons in dropdown menu
			$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
			
			//tooltip placement on right or left
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('table')
				var off1 = $parent.offset();
				var w1 = $parent.width();
		
				var off2 = $source.offset();
				//var w2 = $source.width();
		
				if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
				return 'left';
			}
				
			/*var oTable1 = $('#table_report').dataTable( {
			"aoColumns": [
		      { "bSortable": false },
		      null, null,null, null, null,
			  { "bSortable": false }
			] } );
			
			
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			$('[data-rel=tooltip]').tooltip();*/
		})
		
		//检索
		function search(){
			window.parent.jzts();
			$("#userForm").submit();
		}
		
		//新增
		function add(){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = 'user/goAddU.do';
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					setTimeout("self.location.reload()",100);
					window.parent.jzts();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function editUser(user_id){
			 window.parent.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="资料";
			 diag.URL = 'user/goEditU.do?USER_ID='+user_id;
			 diag.Width = 225;
			 diag.Height = 415;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					setTimeout("self.location.reload()",100);
					window.parent.jzts();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delUser(userId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					var url = "user/deleteU.do?USER_ID="+userId+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if(data=="success"){
							document.location.reload();
							window.parent.jzts();
						}
					});
				}
			});
		}
		
		
		//批量删除
		function delAll(){
			bootbox.confirm("确定要删除选中的数据吗?", function(result) {
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
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						$.ajax({
							type: "POST",
							url: 'user/deleteAllU.do?tm='+new Date().getTime(),
					    	data: {USER_IDS:str},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								 $.each(data.list, function(i, list){
									 document.location.reload();
									 window.parent.jzts();
								 });
							}
						});
						
					}
				}
			});
		}
		
		</script>
		
		<!-- <script type="text/javascript">
		$(function() {
			//日期框
			$('.date-picker').datepicker();
		});
		</script> -->
		
	</body>
</html>

