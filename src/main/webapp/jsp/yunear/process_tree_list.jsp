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
		
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="../../Ace_Admin_1.3.3/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="../../Ace_Admin_1.3.3/assets/css/font-awesome.css" />
	
		<!-- page specific plugin styles -->
	
		<!-- text fonts -->
		<link rel="stylesheet" href="../../Ace_Admin_1.3.3/assets/css/ace-fonts.css" />
	
		<!-- ace styles -->
		<link rel="stylesheet" href="../../Ace_Admin_1.3.3/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
	
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="../assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->
	
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="../assets/css/ace-ie.css" />
		<![endif]-->
	
		<!-- inline styles related to this page -->
	
		<!-- ace settings handler -->
		<script src="../../Ace_Admin_1.3.3/assets/js/ace-extra.js"></script>
	</head>
<body>
		
<div class="container-fluid" id="main-container">
	<script type="text/javascript">
		try{ace.settings.check('main-container' , 'fixed')}catch(e){}
	</script>

	<div id="breadcrumbs">
	<script type="text/javascript">
		try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
	</script>
	<ul class="breadcrumb">
		<li><i class="icon-home"></i> <a>生产管理</a><span class="divider"><i class="icon-angle-right"></i></span></li>
		<li class="active">工序信息</li>
	</ul><!--.breadcrumb-->
	
	<div id="nav-search">
	</div><!--#nav-search-->
	
	</div><!--#breadcrumbs-->

	
	<div class="page-header">
		<h1>
			Treeview
			<small>
				<i class="ace-icon fa fa-angle-double-right"></i>
				with selectable items(single &amp; multiple) and custom icons
			</small>
		</h1>
	</div><!-- /.page-header -->

	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->

			<!-- #section:plugins/fuelux.treeview -->
			<div class="row">
				<div class="col-sm-6">
					<div class="widget-box widget-color-blue2">
						<div class="widget-header">
							<h4 class="widget-title lighter smaller">Choose Categories</h4>
						</div>

						<div class="widget-body">
							<div class="widget-main padding-8">
								<ul id="tree1"></ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-6">
					<div class="widget-box widget-color-green2">
						<div class="widget-header">
							<h4 class="widget-title lighter smaller">Browse Files</h4>
						</div>

						<div class="widget-body">
							<div class="widget-main padding-8">
								<ul id="tree2"></ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- /section:plugins/fuelux.treeview -->
			<script type="text/javascript">
				var $assets = "../../Ace_Admin_1.3.3/assets";//this will be used in fuelux.tree-sampledata.js
			</script>

			<!-- PAGE CONTENT ENDS -->
		</div><!-- /.col -->
	</div><!-- /.row -->
	
	<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='../../Ace_Admin_1.3.3/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='../assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../../Ace_Admin_1.3.3/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="../../Ace_Admin_1.3.3/assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->
		<script src="../../Ace_Admin_1.3.3/assets/js/fuelux/fuelux.tree.js"></script>

		<!-- ace scripts -->
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.scroller.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.colorpicker.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.fileinput.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.typeahead.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.spinner.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.treeview.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.wizard.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.aside.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.ajax-content.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.touch-drag.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.sidebar.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.widget-box.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.settings.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.settings-skin.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.searchbox-autocomplete.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		
		 $(window.parent.hangge());
		 $(function() {
			var sampleData = initiateDemoData();//see below
		
		
			$('#tree1').ace_tree({
				dataSource: sampleData['dataSource1'],
				multiSelect: true,
				cacheItems: true,
				'open-icon' : 'ace-icon tree-minus',
				'close-icon' : 'ace-icon tree-plus',
				'selectable' : true,
				'selected-icon' : 'ace-icon fa fa-check',
				'unselected-icon' : 'ace-icon fa fa-times',
				loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
			});
			
			$('#tree2').ace_tree({
				dataSource: sampleData['dataSource2'] ,
				loadingHTML:'<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
				'open-icon' : 'ace-icon fa fa-folder-open',
				'close-icon' : 'ace-icon fa fa-folder',
				'selectable' : false,
				multiSelect: false,
				'selected-icon' : null,
				'unselected-icon' : null
			});
			
			/**
			//please refer to docs for more info
			$('#tree1')
			.on('loaded.fu.tree', function(e) {
			})
			.on('updated.fu.tree', function(e, result) {
			})
			.on('selected.fu.tree', function(e) {
			})
			.on('deselected.fu.tree', function(e) {
			})
			.on('opened.fu.tree', function(e) {
			})
			.on('closed.fu.tree', function(e) {
			});
			*/
			
			
			function initiateDemoData(){
				var tree_data = {
					'for-sale' : {text: 'For Sale', type: 'folder'}	,
					'vehicles' : {text: 'Vehicles', type: 'folder'}	,
					'rentals' : {text: 'Rentals', type: 'folder'}	,
					'real-estate' : {text: 'Real Estate', type: 'folder'}	,
					'pets' : {text: 'Pets', type: 'folder'}	,
					'tickets' : {text: 'Tickets', type: 'item'}	,
					'services' : {text: 'Services', type: 'item'}	,
					'personals' : {text: 'Personals', type: 'item'}
				}
				tree_data['for-sale']['additionalParameters'] = {
					'children' : {
						'appliances' : {text: 'Appliances', type: 'item'},
						'arts-crafts' : {text: 'Arts & Crafts', type: 'item'},
						'clothing' : {text: 'Clothing', type: 'item'},
						'computers' : {text: 'Computers', type: 'item'},
						'jewelry' : {text: 'Jewelry', type: 'item'},
						'office-business' : {text: 'Office & Business', type: 'item'},
						'sports-fitness' : {text: 'Sports & Fitness', type: 'item'}
					}
				}
				tree_data['vehicles']['additionalParameters'] = {
					'children' : {
						'cars' : {text: 'Cars', type: 'folder'},
						'motorcycles' : {text: 'Motorcycles', type: 'item'},
						'boats' : {text: 'Boats', type: 'item'}
					}
				}
				tree_data['vehicles']['additionalParameters']['children']['cars']['additionalParameters'] = {
					'children' : {
						'classics' : {text: 'Classics', type: 'item'},
						'convertibles' : {text: 'Convertibles', type: 'item'},
						'coupes' : {text: 'Coupes', type: 'item'},
						'hatchbacks' : {text: 'Hatchbacks', type: 'item'},
						'hybrids' : {text: 'Hybrids', type: 'item'},
						'suvs' : {text: 'SUVs', type: 'item'},
						'sedans' : {text: 'Sedans', type: 'item'},
						'trucks' : {text: 'Trucks', type: 'item'}
					}
				}
		
				tree_data['rentals']['additionalParameters'] = {
					'children' : {
						'apartments-rentals' : {text: 'Apartments', type: 'item'},
						'office-space-rentals' : {text: 'Office Space', type: 'item'},
						'vacation-rentals' : {text: 'Vacation Rentals', type: 'item'}
					}
				}
				tree_data['real-estate']['additionalParameters'] = {
					'children' : {
						'apartments' : {text: 'Apartments', type: 'item'},
						'villas' : {text: 'Villas', type: 'item'},
						'plots' : {text: 'Plots', type: 'item'}
					}
				}
				tree_data['pets']['additionalParameters'] = {
					'children' : {
						'cats' : {text: 'Cats', type: 'item'},
						'dogs' : {text: 'Dogs', type: 'item'},
						'horses' : {text: 'Horses', type: 'item'},
						'reptiles' : {text: 'Reptiles', type: 'item'}
					}
				}
		
				var dataSource1 = function(options, callback){
					var $data = null
					if(!("text" in options) && !("type" in options)){
						$data = tree_data;//the root tree
						callback({ data: $data });
						return;
					}
					else if("type" in options && options.type == "folder") {
						if("additionalParameters" in options && "children" in options.additionalParameters)
							$data = options.additionalParameters.children || {};
						else $data = {}//no data
					}
					
					if($data != null)//this setTimeout is only for mimicking some random delay
						setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);
		
					//we have used static data here
					//but you can retrieve your data dynamically from a server using ajax call
					//checkout examples/treeview.html and examples/treeview.js for more info
				}
		
		
		
		
				var tree_data_2 = {
					'pictures' : {text: 'Pictures', type: 'folder', 'icon-class':'red'}	,
					'music' : {text: 'Music', type: 'folder', 'icon-class':'orange'}	,
					'video' : {text: 'Video', type: 'folder', 'icon-class':'blue'}	,
					'documents' : {text: 'Documents', type: 'folder', 'icon-class':'green'}	,
					'backup' : {text: 'Backup', type: 'folder'}	,
					'readme' : {text: '<i class="ace-icon fa fa-file-text grey"></i> ReadMe.txt', type: 'item'},
					'manual' : {text: '<i class="ace-icon fa fa-book blue"></i> Manual.html', type: 'item'}
				}
				tree_data_2['music']['additionalParameters'] = {
					'children' : [
						{text: '<i class="ace-icon fa fa-music blue"></i> song1.ogg', type: 'item'},
						{text: '<i class="ace-icon fa fa-music blue"></i> song2.ogg', type: 'item'},
						{text: '<i class="ace-icon fa fa-music blue"></i> song3.ogg', type: 'item'},
						{text: '<i class="ace-icon fa fa-music blue"></i> song4.ogg', type: 'item'},
						{text: '<i class="ace-icon fa fa-music blue"></i> song5.ogg', type: 'item'}
					]
				}
				tree_data_2['video']['additionalParameters'] = {
					'children' : [
						{text: '<i class="ace-icon fa fa-film blue"></i> movie1.avi', type: 'item'},
						{text: '<i class="ace-icon fa fa-film blue"></i> movie2.avi', type: 'item'},
						{text: '<i class="ace-icon fa fa-film blue"></i> movie3.avi', type: 'item'},
						{text: '<i class="ace-icon fa fa-film blue"></i> movie4.avi', type: 'item'},
						{text: '<i class="ace-icon fa fa-film blue"></i> movie5.avi', type: 'item'}
					]
				}
				tree_data_2['pictures']['additionalParameters'] = {
					'children' : {
						'wallpapers' : {text: 'Wallpapers', type: 'folder', 'icon-class':'pink'},
						'camera' : {text: 'Camera', type: 'folder', 'icon-class':'pink'}
					}
				}
				tree_data_2['pictures']['additionalParameters']['children']['wallpapers']['additionalParameters'] = {
					'children' : [
						{text: '<i class="ace-icon fa fa-picture-o green"></i> wallpaper1.jpg', type: 'item'},
						{text: '<i class="ace-icon fa fa-picture-o green"></i> wallpaper2.jpg', type: 'item'},
						{text: '<i class="ace-icon fa fa-picture-o green"></i> wallpaper3.jpg', type: 'item'},
						{text: '<i class="ace-icon fa fa-picture-o green"></i> wallpaper4.jpg', type: 'item'}
					]
				}
				tree_data_2['pictures']['additionalParameters']['children']['camera']['additionalParameters'] = {
					'children' : [
						{text: '<i class="ace-icon fa fa-picture-o green"></i> photo1.jpg', type: 'item'},
						{text: '<i class="ace-icon fa fa-picture-o green"></i> photo2.jpg', type: 'item'},
						{text: '<i class="ace-icon fa fa-picture-o green"></i> photo3.jpg', type: 'item'},
						{text: '<i class="ace-icon fa fa-picture-o green"></i> photo4.jpg', type: 'item'},
						{text: '<i class="ace-icon fa fa-picture-o green"></i> photo5.jpg', type: 'item'},
						{text: '<i class="ace-icon fa fa-picture-o green"></i> photo6.jpg', type: 'item'}
					]
				}
		
		
				tree_data_2['documents']['additionalParameters'] = {
					'children' : [
						{text: '<i class="ace-icon fa fa-file-text red"></i> document1.pdf', type: 'item'},
						{text: '<i class="ace-icon fa fa-file-text grey"></i> document2.doc', type: 'item'},
						{text: '<i class="ace-icon fa fa-file-text grey"></i> document3.doc', type: 'item'},
						{text: '<i class="ace-icon fa fa-file-text red"></i> document4.pdf', type: 'item'},
						{text: '<i class="ace-icon fa fa-file-text grey"></i> document5.doc', type: 'item'}
					]
				}
		
				tree_data_2['backup']['additionalParameters'] = {
					'children' : [
						{text: '<i class="ace-icon fa fa-archive brown"></i> backup1.zip', type: 'item'},
						{text: '<i class="ace-icon fa fa-archive brown"></i> backup2.zip', type: 'item'},
						{text: '<i class="ace-icon fa fa-archive brown"></i> backup3.zip', type: 'item'},
						{text: '<i class="ace-icon fa fa-archive brown"></i> backup4.zip', type: 'item'}
					]
				}
				var dataSource2 = function(options, callback){
					var $data = null
					if(!("text" in options) && !("type" in options)){
						$data = tree_data_2;//the root tree
						callback({ data: $data });
						return;
					}
					else if("type" in options && options.type == "folder") {
						if("additionalParameters" in options && "children" in options.additionalParameters)
							$data = options.additionalParameters.children || {};
						else $data = {}//no data
					}
					
					if($data != null)//this setTimeout is only for mimicking some random delay
						setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);
		
					//we have used static data here
					//but you can retrieve your data dynamically from a server using ajax call
					//checkout examples/treeview.html and examples/treeview.js for more info
				}
		
				
				return {'dataSource1': dataSource1 , 'dataSource2' : dataSource2}
			}

		});
		</script>

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="../../Ace_Admin_1.3.3/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="../../Ace_Admin_1.3.3/docs/assets/js/themes/sunburst.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/elements.onpage-help.js"></script>
		<script src="../../Ace_Admin_1.3.3/assets/js/ace/ace.onpage-help.js"></script>
		<script src="../../Ace_Admin_1.3.3/docs/assets/js/rainbow.js"></script>
		<script src="../../Ace_Admin_1.3.3/docs/assets/js/language/generic.js"></script>
		<script src="../../Ace_Admin_1.3.3/docs/assets/js/language/html.js"></script>
		<script src="../../Ace_Admin_1.3.3/docs/assets/js/language/css.js"></script>
		<script src="../../Ace_Admin_1.3.3/docs/assets/js/language/javascript.js"></script>
	
		
</body>
</html>

