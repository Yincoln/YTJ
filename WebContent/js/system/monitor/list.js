var dialog;
var grid;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide:true
		}, {
			colkey : "cpuUsage",
			name : "cpu使用率",
			width : "85px"
		}, {
			colkey : "setCpuUsage",
			name : "预设cpu使用率",
			width : "115px"
		}, {
			colkey : "jvmUsage",
			name : "Jvm使用率",
			width : "90px"
		}, {
			colkey : "setJvmUsage",
			name : "预设Jvm使用率",
			width : "115px"
		} ,{
			colkey : "ramUsage",
			name : "Ram使用率",
			width : "90px"
		} ,{
			colkey : "setRamUsage",
			name : "预设Ram使用率",
			width : "115px"
		} ,{
			colkey : "email",
			name : "发送的邮件"
		} ,{
			colkey : "operTime",
			name : "发送的时间"
		} ,{
			colkey : "mark",
			name : "备注"
		} ],
		data:{FormMap:"ServerInfoFormMap"},
		jsonUrl : rootPath + '/system/monitor/findByPage.shtml',
		checkbox : true
	});
	$("#searchForm").click("click", function() {//绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();
		grid.setOptions({
			data : searchParams
		});
	});
});