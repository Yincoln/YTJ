function Control(uuid) {
	// 控制的对象为当前选中的设备或者为用户指定的设备（如果当前没有选中设备）
	this.uuids = uuid;
	
	this.getList = function(statusname,status,flag){
		this.statusname = statusname;
		this.status = status;
		this.flag = flag;
		return this;
	};

	// 提交操作
	this.post = function() {
		$.ajax({
			type : "post",
			url : rootPath + '/system/deviceStatus/control.shtml',
			data : {
				uuids : this.uuids,
				statusname : this.statusname,
				status : this.status,
				flag : this.flag
			},
			async : true,
			dataType : "json",
			success : function(data) {
				//var widget = $('.widget-control-general').closest('.block.selected');
				if(data == "success"){		
					/*widget.find('.circleChart').circleChart({
						size: 80,
						color: getColor(ledStatus),
				        value: $('#ledSlider .value').text()
				    });*/
					alert("chenggong");
					layer.msg('成功操作了1台设备');
				}else{
					//layer.msg('操作失败');
					layer.alert('操作失败');
					//widget.removeClass('selected');
				}
			}
		});
	};
} //Control
$(function() {
	var uuidKey = $('#uuidKey').text();
	var sessionId = $('#sessionId').text();
	var push = $('#push').text();
	var control = new Control(uuidKey);	
	control.getList('Play_Session', sessionId, 1).post();
	$('#upstream-swf').flash({
        swf: '/upstream.swf',
        flashvars: {
            stream: push //push流
        }
    });
});
