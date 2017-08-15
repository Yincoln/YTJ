//单独验证某一个input  class="checkpass"
jQuery.validator.addMethod("checkacc", function(value, element) {
	return this.optional(element)
			|| ((value.length <= 30) && (value.length >= 3));
}, "账号由3至30位字符组合构成");
$(function() {
	$("#addform").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交，通过验证后执行的函数
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data == "success") {
						layer.msg('添加成功!');
						grid.loadData();
						layer.close(pageii);
					} else {
						layer.alert('添加失败！', data);
					}
				}
			});
		},
		rules : {
			"suffix" : {
				required : true,
				remote : { // 异步验证是否存在
					type : "POST",
					url : rootPath + '/system/user/isExist.shtml?FormMap=DeviceFormMap',
					data : {
						uuidKey : function(){
							return $('#prefix').val()+$('#suffix').val();
						}
					}
				}
			}
		},
		messages : {
			"suffix" : {
				required : "请输入uuid",
				remote : "该设备已经存在"
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
