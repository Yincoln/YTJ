var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide : true
		}, {
			colkey : "name",
			name : "菜单名称",
			align : 'left'
		},  {
			colkey : "resKey",
			name : "唯一KEY",
			align : 'left'
		},{
			colkey : "type",
			name : "菜单类型",
			width : "70px",
		}, {
			colkey : "resUrl",
			name : "URL地址"
		},{
			colkey : "ishide",
			name : "是否隐藏",
			renderData : function(rowindex, data, rowdata, column) {
				if(data=="0"){
					return "否";
				}else if(data=="1"){
					return "是";
				}
			}
		}, {
			colkey : "description",
			width : "350px",
			name : "描述"
		} ],
		data:{FormMap:"ResFormMap",$orderby:" order by level asc "},
		jsonUrl : rootPath + '/system/resources/findByPage.shtml',
		pageSize:100,
		checkbox : true,
		usePage : false,
		treeGrid : {
			type:2,
			tree : true,
			hide:true,
			name : "name",
			id:"id",
			pid:"parentId"
		}
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addFun").click("click", function() {
		addFun();
	});
	$("#editFun").click("click", function() {
		editFun();
	});
	$("#delFun").click("click", function() {
		delFun();
	});
	$("#lyGridUp").click("click", function() {// 上移
		var jsonUrl=rootPath + '/system/resources/sortUpdate.shtml';
		grid.lyGridUp(jsonUrl);
	});
	$("#lyGridDown").click("click", function() {// 下移
		var jsonUrl=rootPath + '/system/resources/sortUpdate.shtml';
		grid.lyGridDown(jsonUrl);
	});
});
function editFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.alert("只能选中一个");
		return;
	}
	var url = rootPath + '/system/resources/edit.shtml?FormMap=ResFormMap&id=' + cbox;
	pageii = layer.open({
		title : "编辑",
		type : 1,
		area : [ "600px", "550px" ],
		content : CommonUtil.ajax(url)
	});
}
function addFun() {
	var url =rootPath + '/system/resources/add.shtml';
	pageii = layer.open({
		title : "新增",
		type : 1,
		area : [ "600px", "550px" ],
		content : CommonUtil.ajax(url)
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.alert("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/system/resources/deleteByIds.shtml';
		var s = CommonUtil.ajax(url, {
			id : cbox.join(","),
			FormMap:"ResFormMap"
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
