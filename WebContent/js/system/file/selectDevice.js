//用于发送控制信息
function Control(uuid) {
	// 控制的对象为当前选中的设备或者为用户指定的设备（如果当前没有选中设备）
	this.uuids = uuid;
	this.list=[];// 操作列表
	this.getList = function(statusname, status, flag) {
		var s = {
			statusname : statusname,
		 	status : status,
			flag : flag
		};	
		this.list.push(s);
		return this;
	};

	// 提交操作
	this.post = function() {
		var data = JSON.stringify({
	        list : this.list
	    });
		$.ajax({
			type : "post",
			url : rootPath + '/system/deviceStatus/control.shtml',
			data : {
				uuid : this.uuids, //设备列表
				data : data //操作列表数据，json字符串格式
			},
			async : true,
			dataType : "json",
			success : function(data) {
				if (data === "success") {
					layer.msg('下载成功');
				} else {
					layer.msg('下载失败');
				}
			}
		});
	};
} // Control

// 要下载的音乐的Id
var id = $("#id").text();

$('button#download').click(function() {
	// 已选择的uuidKey
	// 目前只针对一个设备
	var uuidKey = $("#uuidKey").val().toString();
	var control = new Control(uuidKey);
	control.getList('Play_Music', id, 3);
	control.post();
	closeWin();
});
