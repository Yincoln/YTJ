var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide:true
		}, {
			colkey : "code",
			name : "编码"
		},{
			colkey : "name",
			name : "名称"
		}, {
			colkey : "url",
			name : "地址"
		} ],
		data:{FormMap:"ConfigFormMap"},
		jsonUrl : rootPath + '/findByPage.shtml',
		checkbox : true,
		serNumber : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addConfig").click("click", function() {
		addConfig();
	});
	$("#editConfig").click("click", function() {
		editConfig();
	});
	$("#delConfig").click("click", function() {
		delConfig();
	});
});
function editConfig() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath + '/edit.shtml?page_path=/system/config/devconfig&FormMap=ConfigFormMap&id=' + cbox;
	parent.f_addTab("editConfig"," 修改",url);
}
function addConfig() {
	var url =rootPath + '/system/config/devconfig.shtml';
	parent.f_addTab("addConfig","新增",url);
}
function delConfig() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/deleteByIds.shtml';
		var s = CommonUtil.ajax(url, {
			id : cbox.join(","),
			FormMap:"ConfigFormMap"
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}