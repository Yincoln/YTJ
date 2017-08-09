<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/system/config/list.js"></script>
</head>
<body>
	<div class="page-content">
		<div class="m-b-md">
			<form class="form-inline" name="form" id="searchForm"
				name="searchForm">
				<div class="form-group">
					<label class="control-label"> <span
						class="h4 font-thin v-middle">名:</span>
					</label> <input class="input-medium ui-autocomplete-input" id="name"
						name="name">
				</div>
				<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
			</form>
		</div>
		<div class="doc-buttons" style="padding: 10px 0;">
			
				<button type="button" id="addConfig" name="addConfig" class="btn btn-primary marR10">新增</button>
			
				<button type="button" id="editConfig" name="editConfig" class="btn btn-info marR10">编辑</button>
			
				<button type="button" id="delConfig" name="delConfig" class="btn btn-danger marR10">删除</button>
			
		</div>
		<div id="paging" class="pagclass"></div>
		</div>
</body>
</html>