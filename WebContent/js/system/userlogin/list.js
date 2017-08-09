var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			width : "50px",
			hide : true
		}, {
			colkey : "userId",
			name : "用户id",
			hide : true
		}, {
			colkey : "accountName",
			name : "账号"
		},{
			colkey : "loginTime",
			name : "登入时间",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		} , {
			colkey : "loginIP",
			name : "登入IP"
		}],
		data:{FormMap:"UserLoginFormMap"},
		jsonUrl : rootPath + '/findByPage.shtml',
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJSON();
		grid.setOptions({
			data : searchParams
		});
	});
});
