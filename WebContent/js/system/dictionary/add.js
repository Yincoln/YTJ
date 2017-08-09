$(function() {
	$("#addform").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data == "success") {
						layer.msg('添加成功!');
						grid.loadData();
						layer.close(pageii);
					} else {
						layer.alert('添加失败！', 3);
					}
				}
			});
		},
		rules : {
			"userFormMap.code" : {
				required : true,
				remote : { // 异步验证是否存在
					type : "POST",
					url : rootPath + '/user/isExist.shtml',
					data : {
						name : function(){
							return $("#dictionarycode").val();
						}
					}
				}
			}
		},
		messages : {
			"userFormMap.code" : {
				required : "请输入code",
				remote : "该code已经存在"
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
function showpopForm() {
	var trHTML = "<tr><td><input required='required' class='input text ' type='text' name='childCode' value='' size='20' maxlength='64'></td><td><input class='input text' required=\"required\" type='text' name='childValue' value='' size='20' maxlength='64'></td><td><input class='btn btn-lg btn-danger' type='button' value='删除'onclick='$(this).parents(\"tr\").remove();'></td></tr>";
	$("#valuemaps").append(trHTML);
}