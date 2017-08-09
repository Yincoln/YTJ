$(function() {
	// 异步加载所有菜单列表
	$("#editform").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form,{//验证新增是否成功
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data == "success") {
						layer.msg('更新成功!');
						grid.loadData();
						layer.close(pageii);
					} else {
						layer.alert('编辑失败！', 3);
					}
				}
			});
		},
		rules : {
			resKey : {
				required : true
			},
			resUrl : {
				required : true
			}
		},
		messages : {
			resKey : {
				required : "菜单标识不能为空"
			},
			resUrl : {
				required : "url连接不能为空"
			}
		},
		errorPlacement : function(error, element) {// 自定义提示错误位置
			$(".l_err").css('display', 'block');
			// element.css('border','3px solid #FFCCCC');
			$(".l_err").html(error.html());
		},
		success : function(label) {// 验证通过后
			$(".l_err").css('display', 'none');
		}
	});
});
function but(v){
	if(v.value==2){
		 showBut();
	}else{
		$("#divbut").css("display","none");
		$("#divbutshe").css("display","none")
	}
}
function toBut(b){
	var bt = $(b).find("button");
	$("#btnId").val(bt.attr("id"));
	$("#btnName").val(bt.attr("name"));
	$("#btnClass").val(bt.attr("class"));
	$("#btnValue").val(bt.html());
}
function showBut(){
	$("#divbut").css("display","block");
	$("#divbutshe").css("display","block");
	$("#but").html(CommonUtil.btnlist());
}
function byRes(id){
	var url = rootPath + '/system/resources/reslists.shtml';
	var data = CommonUtil.ajax(url, null,"json");
	if (data != null) {
		var h = "<option value='0'>------顶级目录------</option>";
		for ( var i = 0; i < data.length; i++) {
			if(id==data[i].id){
				h+="<option value='" + data[i].id + "' selected='selected'>"
								+ data[i].name + "</option>";
			}else{
				h+="<option value='" + data[i].id + "'>"+ data[i].name + "</option>";
			}
		}
		$("#parentId").html(h);
	} else {
		bootbox.alert("获取菜单信息错误，请联系管理员！");
	}
}