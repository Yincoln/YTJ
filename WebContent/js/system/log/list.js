var grid;
$(function() {
	grid = lyGrid({
				pagId : 'paging',
				l_column : [ {
					colkey : "id",
					name : "id",
					hide : true
				}, {
					colkey : "accountName",
					name : "账号"
				}, {
					colkey : "module",
					name : "模块"
				}, {
					colkey : "methods",
					name : "方法"
				}, {
					colkey : "actionTime",
					name : "响应时间",
						width : "150px"
				} , {
					colkey : "userIP",
					name : "IP地址"
				}, {
					colkey : "operTime",
					name : "执行时间",
					renderData : function(rowindex,data, rowdata, column) {
						return new Date(data).format("yyyy-MM-dd hh:mm:ss");
					}
				}, {
					colkey : "description",
					name : "执行描述",
					renderData : function(rowindex,data, rowdata, column) {
						if(data.indexOf("成功")>-1)
						return data;
						else
						return "<a onclick='show(this)' style='cursor: pointer;'><font color='red'>执行方法异常:</font> <font color='blue'>查看详细</font>" +
								"<div style='display: none;'>"+data+"</div></a>";
					}
				}],
				data:{FormMap:"LogFormMap"},
				jsonUrl : rootPath + '/findByPage.shtml',
				checkbox : false
			});
	$("#search").click("click", function() {//绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();
		grid.setOptions({
			data : searchParams
		});
	});
});
function show(tb){
	layer.open({
	    type: 1,
	    skin: 'layui-layer-rim', //加上边框
	    area: ['80%', '80%'], //宽高
	    content: $(tb).find("div").html()
	});
}