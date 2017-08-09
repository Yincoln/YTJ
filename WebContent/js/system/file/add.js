$(function() {
	$('#file').bind('change',function(){
		var path = $('#file').val();
		var str = path.split('\\');
		$('#friendlyname').val(str[str.length-1]);
	});

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
			"file" : {
				required : true,
				remote : { // 异步验证是否存在
					type : "POST",
					url : rootPath + '/system/user/isExist.shtml?FormMap=UploadFileFormMap',
					data : {
						filename: function(){
							return $('#friendlyname').val();
						}
					}
				}
			}
		},
		messages : {
			"file" : {
				required : "请选择文件",
				remote : "该文件已经存在"
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
