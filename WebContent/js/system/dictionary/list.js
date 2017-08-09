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
			name : "编码code",
			align : 'left'
		}, {
			colkey : "value",
			name : "对应值"
		}, {
			colkey : "description",
			name : "描述"
		}, {
			colkey : "createTime",
			name : "时间",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		}],
		data:{FormMap:"DictionaryFormMap"},
		jsonUrl : rootPath + '/system/dictionary/findByPage.shtml',
		pageSize:100,
		checkbox : true,
		serNumber : true,
		treeGrid : {
			type: 2, //1 表示后台已经处理好父类带children集合 2 表示没有处理,由前端处理树形式
			tree : true,// 是否显示树
			name : 'code',// 以哪个字段 的树形式 如果是多个 name,key
			id: "code",
			pid: "parent_code"
		}
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addDictionary").click("click", function() {
		addDictionary();
	});
	$("#editDictionary").click("click", function() {
		editDictionary();
	});
	$("#delDictionary").click("click", function() {
		delDictionary();
	});
});
function editDictionary() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath + '/system/dictionary/editUI.shtml?id=' + cbox;
	pageii = layer.open({
		title : "编辑",
		type : 1,
		area : [ "650px", "80%" ],
		content : CommonUtil.ajax(url)
	});
}
function addDictionary() {
	var url =rootPath + '/system/dictionary/add.shtml';
	pageii = layer.open({
		title : "新增",
		type : 1,
		area : [ "650px", "80%" ],
		content : CommonUtil.ajax(url)
	});
}
function delDictionary() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/system/dictionary/deleteByIds.shtml';
		var s = CommonUtil.ajax(url, {
			id : cbox.join(","),
			FormMap:"DictionaryFormMap"
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
