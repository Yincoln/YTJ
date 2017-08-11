var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "device_id",
			name : "id",
			hide : true
		},{
			colkey : "devicename",
			name : "设备名"
		}, {
			colkey : "uuidKey",
			name : "uuidKey"
		}, {
			colkey : "password",
			name : "密码"
		}, {
			colkey : "position_x",
			name : "纬度"
		}, {
			colkey : "position_y",
			name : "经度"
		}, {
			colkey : "online",
			name : "在线",
			renderData : function(rowindex,data, rowdata, column) {
				var status = "";
				if(data == 0)
					status = "ON";
				else
					status = "OFF";
				return status;
			}
		}, {
			colkey : "active_dt",
			name : "生效日期",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}, {
			colkey : "create_dt",
			name : "添加日期",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		} ],
		data:{FormMap:"DeviceFormMap",mapper_id:"DeviceMapper.findUserDevices",resId:$("#resId").text()},
		jsonUrl : rootPath + '/system/device/findByPage1.shtml',
		checkbox : true,
		checkValue : "device_id"
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addDevice").click("click", function() {
		addDevice();
	});
	$("#editDevice").click("click", function() {
		editDevice();
	});
	$("#delDevice").click("click", function() {
		delDevice();
	});
	$("#QRcode").click("click", function() {
		code();
	});
});

function editDevice() {
	var c = grid.getCurrentData();
	var cbox = grid.getSelectedCheckbox();
	var length = cbox.length;
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath + '/system/device/edit.shtml?FormMap=DeviceFormMap&device_id=' + cbox;
	pageii = layer.open({
		title : "编辑",
		type : 1,
		area : [ "600px", "45%" ],
		content : CommonUtil.ajax(url)
	});
}
function addDevice() {
	var url =rootPath + '/system/device/add.shtml';
	pageii = layer.open({
		title : "新增",
		type : 1,
		area : [ "600px", "50%" ],
		content : CommonUtil.ajax(url)
	});
}
function delDevice() {
	
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/system/device/deleteByIds.shtml';
		var s = CommonUtil.ajax(url, {
			device_id : cbox.join(","),
			FormMap:"DeviceFormMap"
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}

function code(){
	var cbox = grid.getSelectedCheckbox(); //device_id
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var row = grid.selectRow();
	var uuidKey = row[0].uuidKey;
	var password = row[0].password;
	var url = rootPath + '/system/device/QRcode.shtml?FormMap=DeviceFormMap&device_id='+cbox+'&uuidKey='+uuidKey+'&password='+password;
	pageii = layer.open({
		title : "二维码  ("+uuidKey+")",
		type : 1,
		area : [ "300px", "50%" ],
		content : CommonUtil.ajax(url)
	});
}
