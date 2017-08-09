<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en" class="htmlBody">
<head>
	<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/file/selectDevice.js"></script>
</head>
<body>
	<div id="id" style="display:none;">${id}</div>
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">设备uuid</label>
				<div class="col-sm-9">
					<select id="uuidKey" class="input-large" name="uuidKey"  multiple="multiple" style="height: 200px; width: 300px">
						<c:forEach items="${list}" var="key">
						<option value="${key}">${key}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</section>
	<div id="button" style="text-align:center;">
		<button type="button" id="download" class="btn btn-success btn-s-xs">确定</button>
		<button type="button" class="btn btn-default btn-s-xs" onclick="closeWin();">取消</button>
	</div>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/system/file/selectDevice.js"></script> --%>
</body>
</html>