<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
	<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/lssSession/upstream.js"></script>
</head>
  
  <body>
  	<div id="uuidKey" style="display:none">${uuidKey}</div>
  	<div id="sessionId" style="display:none">${sessionId}</div>
  	<div id="push" style="display:none">${push}</div>
    <div id="upstream-swf"></div>
  </body>
</html>
