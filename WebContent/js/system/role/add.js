	//单独验证某一个input  class="checkpass"
	 jQuery.validator.addMethod("checkRole", function(value, element) {
	 	 return this.optional(element) || ((value.length <= 10) && (value.length>=3));
	 }, "角色名由3至10位字符组合构成");
	 $(function() {
		 var zTree;
		 function checkstate(obj){
				if(obj.checked){
					$("#state").val("1")
				}else{
					$("#state").val("0")
				}
			}
			onloadurl("selUser");
				var setting = {
					check: {
						enable: true
					},
					data : {
						simpleData : {
							enable : true,
							idKey: "id",
							pIdKey: "parentId"
						}
					},
					callback: {
						onCheck: onCheck,
					}
				};
				function onCheck(e, treeId, treeNode){
					var sNodes = zTree.getCheckedNodes(true);
					var resId = new Array();
					for(var i=0;i<sNodes.length;i++){
						resId.push(sNodes[i].id);
					};
					$("#resId").val(resId.join(','));
				}
				
	CommonUtil.ajax(rootPath + '/system/resources/jsonlist.shtml',{FormMap:"ResFormMap"},'json',true)
      .success(function(res) {
    	  for(var i=0;i<res.length;i++){
    		  delete res[i].icon;
    		  delete res[i].description
    		  delete res[i].resUrl
    		  delete res[i].type
    	  }
			zTree = $.fn.zTree.init($("#pztree"), setting, res);
			//zTree.expandAll(true);
			zTree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
		}).error(function(err) {
			
		});
		 
	 	$("#addform").validate({
	 		submitHandler : function(form) {//必须写在验证前面，否则无法ajax提交
	 			ly.ajaxSubmit(form,{//验证新增是否成功
	 				type : "post",
	 				dataType:"json",
	 				success : function(data) {
	 					if (data=="success") {
	 						layer.msg('添加成功!');
							grid.loadData();
							layer.close(pageii);
	 					} else {
	 						layer.msg('添加失败！'+data);
	 					}
	 				}
	 			});
	 		},
	 		errorPlacement : function(error, element) {//自定义提示错误位置
	 			$(".l_err").css('display','block');
	 			//element.css('border','3px solid #FFCCCC');
	 			$(".l_err").html(error.html());
	 		},
	 		success: function(label) {//验证通过后
	 			$(".l_err").css('display','none');
	 		}
	 	});
	 });

