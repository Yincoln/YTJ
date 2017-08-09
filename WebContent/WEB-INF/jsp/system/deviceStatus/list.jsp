<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
	<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/deviceStatus/list.js"></script>
</head>
<body>
	<div class="page-content">
		<div class="progress" style="height: 5px">
        	<div id="bar" style="width:100%" aria-valuemax="100" role="progressbar" class="progress-bar progress-bar-striped active"></div>
    	</div>
    	<br />
		<div class="m-b-md">
			<form class="form-inline" id="searchForm"
				name="searchForm">
				<div class="form-group">
					<div class="padding">
						<span class="h4">设备id:</span> <input class="input-medium"
							id="device_id" name="device_id">
					</div>
				</div>
				<a href="javascript:void(0)" class="btn btn-info" id="search">查询</a>
			</form>
		</div>
		<div class="doc-buttons" style="padding: 10px 0">
			<c:forEach items="${res}" var="key">
				<button type="button" id="${fn:split(key.btn,',')[0]}" name="${fn:split(key.btn,',')[1]}" class="${fn:split(key.btn,',')[2]}">${fn:split(key.btn,',')[3]}</button>
			</c:forEach>
		</div>
		<div id="paging" class="pagclass"></div>
		
		<div id="dashboard" class="">
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/deviceStatus/dashBoard.js"></script>
	</div>
	
</body>
</html>