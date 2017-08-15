<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript">
$(function() {
	$.ajax({
		type : "post",
		url : rootPath + '/system/messageLogging/getLog.shtml',
		data : {
			uuid:"BIOC000001",
			upper:"2017-08-11 10:00:12",
			low:"2017-08-11 10:00:03"
		},
		async : true,
		dataType : "json",
		success : function(data) {
			$('.page-content').text(data);
		}
	});}
);
</script>
</head>
<body>
	<div class="page-content">
		
	</div>
</body>
</html>