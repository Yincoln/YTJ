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
			name : "角色名"
		}, {
			colkey : "state",
			name : "是否启用",
			width : "100px",
			renderData : function(rowindex,data, rowdata, column) {
				var ck = "";
				if(data=="1"){
					ck = "checked='checked'";
				}
				var html ='<label class="inline">';
				html+='<input id="id-button-borders" '+ck+' onclick="checkstate(this,\''+rowdata.id+'\')" type="checkbox" class="ace ace-switch ace-switch-6">';
				html+='<span class="lbl middle"></span></label>';
				return html;
			}
		}, {
			colkey : "roleKey",
			name : "roleKey"
		}, {
			colkey : "description",
			name : "描述"
		} ],
		data:{FormMap:"RoleFormMap"},
		jsonUrl : rootPath + '/system/role/findByPage.shtml',
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
	$("#addrole").click("click", function() {
		addRole();
	});
	$("#editrole").click("click", function() {
		editRole();
	});
	$("#delrole").click("click", function() {
		delRole();
	});
	$("#permissions").click("click", function() {
		permissions();
	});
});
function checkstate(obj,id){
		var d = '0';
		if(obj.checked){
			d = '1';
		}
		var url = rootPath + '/system/role/update.shtml';
		var s = CommonUtil.ajax(url, {
			FormMap:"RoleFormMap",
			"id" : id,
			"state" : d
		}, "json");
		if (s == "success") {
			layer.msg('操作成功');
		} else {
			layer.msg('操作失败');
		}
}
function editRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	var url = rootPath +'/system/role/edit.shtml?FormMap=RoleFormMap&id=' + cbox;
	pageii = layer.open({
		title : "编辑",
		type : 1,
		area : [ "800px", "70%" ],
		content : CommonUtil.ajax(url)
	});
}
function permissions() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("请选择一个对象！");
		return;
	}
	var url = rootPath + '/system/resources/permissions.shtml?roleId='+cbox;
	pageii = layer.open({
		title : "分配权限",
		type : 1,
		area : [ "250px", "80%" ],
		content : CommonUtil.ajax(url)
	});
}
function addRole() {
	var url = rootPath + '/system/role/add.shtml';
	pageii = layer.open({
		title : "新增",
		type : 1,
		area : [ "800px", "70%" ],
		content : CommonUtil.ajax(url)
	});
}
function delRole() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/system/role/deleteByIds.shtml';
		var s = CommonUtil.ajax(url, {
			id : cbox.join(","),
			FormMap:"RoleFormMap"
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}

