<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/monitor/list.js"></script>
	</head>
<body>
	<div class="page-content">
<div class="m-b-md">
	<form class="form-inline" id="searchForm" name="searchForm">
		<div class="form-group">
			<label class="control-label"> <span
				class="h4 font-thin v-middle">发送的邮件:</span></label> <input
				class="input-medium ui-autocomplete-input" id="email"
				name="email">
		</div>
		<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
	</form>
</div><br/>
<div id="paging" class="pagclass"></div>
</div>
</body>
</html>