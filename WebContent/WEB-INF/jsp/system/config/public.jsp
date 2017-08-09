<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript">
$(function(){ 
	var fq = ${query_param};
	var inp = '';
	for(var f in fq){
		var cla = CommonUtil._getValueByName(fq[f],"sel_ck");
		if(cla){
			if(cla.indexOf("time_")>-1){
				inp +='<div class="input-group">';
				inp +='<span class="h4">'+CommonUtil._getValueByName(fq[f],"label")+':</span><input class="'+CommonUtil._getValueByName(fq[f],"btnClass")+'"';
				inp +='type="text" id="'+CommonUtil._getValueByName(fq[f],"btnId")+'" name="'+CommonUtil._getValueByName(fq[f],"btnName")+'" style="padding: 1px;">';
				inp +='	<span class="input-group-addon" style="padding: 3px;">';
				inp +='	<i class="fa fa-calendar bigger-110"></i>';
				inp +='	</span></div>';
				inp +='</div>';
			}else if(cla.indexOf("text_")>-1){
				inp +='<div class="form-group">';
				inp +='<span class="h4">'+CommonUtil._getValueByName(fq[f],"label")+':</span><input class="'+CommonUtil._getValueByName(fq[f],"btnClass")+'" type="text"';
				inp +='id="'+CommonUtil._getValueByName(fq[f],"btnId")+'" name="'+CommonUtil._getValueByName(fq[f],"btnName")+'">';
				inp +='</div>';
			}else if(cla.indexOf("sel_")>-1){
				inp +='<div class="form-group">';
				inp +='<span class="h4">'+CommonUtil._getValueByName(fq[f],"label")+':</span>';
				inp += '<select class="'+CommonUtil._getValueByName(fq[f],"btnClass")+'"';
				inp +='id="'+CommonUtil._getValueByName(fq[f],"btnId")+'" name="'+CommonUtil._getValueByName(fq[f],"btnName")+'">';
				var cm = fq[f].in_select;
				for(var c in cm){
		  			inp +='<option value="'+cm[c].value+'">'+cm[c].text+'</option>';
		  		}
			  	inp +='</select>';
				inp +='</div>';
			}
		}
	}
	inp +='&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="btn btn-info" id="${code}_page_search">查询</a>';
	$("#${code}_pageform").html(inp);
	var l_colum = ${table_colum};
	var table_param = ${table_param};
	var g = {
			pagId:"${code}_paging",
			jsonUrl : rootPath + '/system/config/page.shtml',
			data:{code:"${code}"}
	};
	g= $.extend(g, l_colum);
	g= $.extend(g, table_param);
	var grid_${code}=lyGrid(g);
	$("#${code}_page_search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#${code}_pageform").serializeJSON();// 初始化传参数
		grid_${code}.setOptions({
			data : searchParams
		});
	});
	$('.date-picker').datepicker({
		autoclose: true,
		todayHighlight: true,
		format:'yyyy-mm-dd'
	})
	//show datepicker when clicking on the icon
	.next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
}); 
</script>
</head>
<body>
	<div class="page-content">
		<div class="m-b-md">
			<form class="form-inline" id="${code}_pageform" name="${code}_pageform">
				
			</form>
		</div>
		<div class="doc-buttons" style="padding-bottom: 10px;">
		<c:if test="${fn:length(res) > 0}">
		<c:forEach items="${res}" var="key">
				<button type="button" id="${fn:split(key.btn,',')[0]}" name="${fn:split(key.btn,',')[1]}" class="${fn:split(key.btn,',')[2]}">${fn:split(key.btn,',')[3]}</button>
			</c:forEach>
		</c:if>
		</div>
		<div id="${code}_paging" class="pagclass"></div>
	</div>
<script type="text/javascript" src="" ></script>
</body>
</html>