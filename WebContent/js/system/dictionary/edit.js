$(function() {
	$("#editform").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",//ajaxSubmi带有文件上传的。不需要设置json
				success : function(data) {
					if (data == "success") {
						layer.msg('更新成功!');
						grid.loadData();
						layer.close(pageii);
					} else {
						layer.msg('更新失败！', 3);
					}
				}
			});
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
function showpopForm() {
	var trHTML = "<tr><td><input required='required' class='input text ' type='text' name='childCode' value='' size='20' maxlength='64'></td><td><input class='input text' required=\"required\" type='text' name='childValue' value='' size='20' maxlength='64'></td><td><input class='btn btn-lg btn-danger' type='button' value='删除'onclick='$(this).parents(\"tr\").remove();'></td></tr>";
	$("#valuemaps").append(trHTML);
}