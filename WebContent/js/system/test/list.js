var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "test_id",
			name : "id",
			hide:true
		}, {
			colkey : "name",
			name : "用户名"
		},{
			colkey : "age",
			name : "age"
		}, {
			colkey : "des",
			name : "描述"
		}, ],
		data:{FormMap:"TestFormMap"},
		jsonUrl : rootPath + '/findByPage.shtml',
		checkbox : true,
		checkValue:"test_id",
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addTest").click("click", function() {
		addTest();
	});
	$("#editTest").click("click", function() {
		editTest();
	});
	$("#delTest").click("click", function() {
		delTest();
	});
});
function editTest() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath + '/edit.shtml?page_path=/system/test/edit&FormMap=TestFormMap&test_id=' + cbox;
	pageii = layer.open({
		title : "编辑",
		type : 1,
		area : [ "600px", "80%" ],
		content : CommonUtil.ajax(url)
	});
}
function addTest() {
	var url =rootPath + '/add.shtml?page_path=/system/test/add';
	pageii = layer.open({
		title : "新增",
		type : 1,
		area : [ "600px", "80%" ],
		content : CommonUtil.ajax(url)
	});
}
function delTest() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/deleteByIds.shtml';
		var s = CommonUtil.ajax(url, {
			id : cbox.join(","),
			FormMap:"TestFormMap"
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}