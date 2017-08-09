var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey: "id",
			name : "id",
			hide : true
		},{
			colkey : "user",
			name : "用户"
		}, {
			colkey : "filename",
			name : "文件名",
			width : '350px'
		}, {
			colkey : "friendlyname",
			name : "名称",
			width : '150px'
		}, {
			colkey : "link",
			name : "链接"
		}, {
			colkey : "description",
			name : "描述",
			width : '150px'
		} ],
		data:{FormMap:"UploadFileFormMap",mapper_id:"UploadFileMapper.findUserFiles",resId:$("#resId").text()},
		jsonUrl : rootPath + '/system/file/findByPage.shtml',
		checkbox : true,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addFile").click("click", function() {
		addFile();
	});
	$("#editFile").click("click", function() {
		editFile();
	});
	$("#delFile").click("click", function() {
		delFile();
	});
	$("#download").click("click", function() {
		download();
	});
});

function editFile() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath + '/system/file/edit.shtml?FormMap=UploadFileFormMap&id=' + cbox;
	pageii = layer.open({
		title : "编辑",
		type : 1,
		area : [ "600px", "80%" ],
		content : CommonUtil.ajax(url)
	});
}
function addFile() {
	var url =rootPath + '/system/file/add.shtml?FormMap=UploadFileFormMap&resId=' + $("#resId").text();
	pageii = layer.open({
		title : "新增",
		type : 1,
		area : [ "600px", "50%" ],
		content : CommonUtil.ajax(url)
	});
}
function delFile() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/system/file/deleteByIds.shtml';
		var s = CommonUtil.ajax(url, {
			id : cbox.join(","),
			FormMap:"UploadFileFormMap"
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
function download() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath + '/system/file/selectDevice.shtml?FormMap=UploadFileFormMap&id=' + cbox;
	pageii = layer.open({
		title : "选择设备",
		type : 1,
		area : [ "500px", "60%" ],
		content : CommonUtil.ajax(url)
	});
}