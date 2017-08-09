var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [   {
			colkey : "id",
			name : "id",
			hide:true
		},{
			colkey : "device_id",
			name : "id"
		}, {
			colkey : "devicename",
			name : "设备名"
		},{
			colkey : "uuidKey",
			name : "uuid"
		},{
			colkey : "js_str",
			name : "状态信息",
			width : '800px',
			align : "left",
			renderData : function( rowindex ,data, rowdata, colkey)//渲染数据
            {
        //rowindex 当前行号 ,data 当前列的数据 ,rowdata 当前行json数据, colkey 当前列的colkey
            //处理当前列数据。可自定义html
				if(data){
					var extend = JSON.parse(data);
					var result = "";
					if(extend.list){
						var list = extend.list;
						list.forEach(function(l){
							result += '{'+l.statusname+': '+l.status+', '+l.flag+'} ';
						});
					}
					return result;
				}else{
					return data;
				}
            }
		} ],
		data:{FormMap:"DeviceExtendFormMap",mapper_id:"DeviceExtendMapper.findDevicePage"},
		jsonUrl : rootPath + '/system/deviceStatus/findByPage1.shtml',
		checkbox : true,
		checkValue : 'device_id',
		serNumber : true
	});
	$("#search").bind("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	
	$("#toggleStatus").bind("click", function() {
		var cbox = grid.getSelectedCheckbox();
		if (cbox.length > 1 || cbox == "") {
			layer.msg("只能选中一个");
			return;
		}
		var row = grid.selectRow();
		var s = row[0].js_str;
		if(s){
			var uuidKey = row[0].uuidKey;
			var url = rootPath + '/system/deviceStatus/showDashboard.shtml?FormMap=DeviceExtendFormMap&id=' + cbox+'&uuidKey='+uuidKey;
			pageii = layer.open({
				title : "状态信息",
				type : 1,
				area : [ "800px", "70%" ],
				content : CommonUtil.ajax(url)
			});
			refresh_grid(s);
		}else{
			layer.msg("无状态");
			return;
		}
			
	});
	
	//选中某设备，再选择sessionId直播
	$('#streamDialog').click(function(){
		var cbox = grid.getSelectedCheckbox();
		if (cbox.length > 1 || cbox == "") {
			layer.msg("只能选中一个");
			return;
		}
		var row = grid.selectRow();
		var uuidKey = row[0].uuidKey;
		var url = rootPath + '/system/lssSession/selectSession.shtml?FormMap=LssSessionInfo&uuidKey='+uuidKey;
		pageii = layer.open({
			title : "会话信息",
			type : 1,
			area : [ "400px", "50%" ],
			content : CommonUtil.ajax(url)
		});
	});
	//设置进度条刷新
	var refresh_interval = 15;  // 自动刷新间隔,15s
	(function refresh() {
		var bar = $('#bar');
		bar.css({width: '100%'});
		//设备信息每15s刷新
		$.ajax({
			type : "POST",
			url : rootPath + '/system/deviceStatus/findByPage.shtml',
			data : {FormMap:"DeviceExtendFormMap",mapper_id:"DeviceExtendMapper.findDevicePage"},
			async : false,
			dataType : 'json',
			success : function(json) {
				if(json)
					grid.loadData();
			}
		});
		
		setTimeout(function(){
			var step = 100;
			var time = 0, max = refresh_interval*1000/step;
			var int = setInterval(function() {
				bar.css({width: Math.floor(100-100 * time++ / max) + '%'});
				if (time - 1 == max) {
					clearInterval(int);
					refresh();
				}		
			}, step);
		}, 600);
	})();
});