var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey: "id",
			name : "id",
			hide : true
		}, {
			colkey : "user",
			name : "用户"
		}, {
			colkey : "sessionId",
			name : "会话ID"
		}, {
			colkey : "description",
			name : "会话描述"
		}, {
			colkey : "createTime",
			name : "创建时间"
		}, {
			colkey : "status",
			name : "直播状态",
			renderData : function(rowindex, data, rowdata, column) {
				var content = null;
				if(data == "READY")
					content = '<i class="fa fa-circle" style="color:#1dc359"></i><font style="color:#1dc359;font-weight:bolder;"> 已就绪</font>';
				else if(data == "ONGOING")
					//直播中，有输入流     直播中，无输入流      拉流尝试中
					content = '<i class="fa fa-circle" style="color:#f5a148"></i><font style="color:#f5a148;font-weight:bolder;"> 直播中</font>';
				else if(data == "PAUSED")
					content = '<i class="fa fa-circle" style="color:#a3b1a8"></i><font style="color:#a3b1a8;font-weight:bolder;"> 已暂停</font>';
				else if(data == "CLOSED")
					content = '<i class="fa fa-circle" style="color:#1dc359"></i><font style="color:#1dc359;font-weight:bolder;"> 已就绪</font>';
				return content;
			}
		}, {
			colkey : "status",
			name : "操作",
			renderData : function(rowindex, data, rowdata, column) {
				if(data == "READY")
					return '<a href="javascript:void(0)" style="text-decoration:none">暂停</a>&nbsp;&nbsp;<a href="javascript:void(0)" style="text-decoration:none">删除</a>';
				else if(data == "ONGOING")
					return '<a href="javascript:void(0)" style="text-decoration:none">观看</a>&nbsp;&nbsp;<a href="javascript:void(0)" style="text-decoration:none">暂停</a>';
				else if(data == "PAUSED")
					return '<a href="javascript:void(0)" style="text-decoration:none">恢复</a>&nbsp;&nbsp;<a href="javascript:void(0)" style="text-decoration:none">删除</a>';
			}
		} ],
		data:{FormMap:"LssSessionInfo",mapper_id:"LssSessionInfoMapper.findUserLssSession"},
		jsonUrl : rootPath + '/system/lssSession/findByPage.shtml',
		checkbox : true,
		serNumber : true
		
	});
	//创建直播
	$('#streamDialog').click(function(){
		var url = rootPath + '/system/lssSession/add.shtml';
		pageii = layer.open({
			title : "创建直播",
			type : 1,
			area : [ "400px", "50%" ],
			content : CommonUtil.ajax(url)
		});
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