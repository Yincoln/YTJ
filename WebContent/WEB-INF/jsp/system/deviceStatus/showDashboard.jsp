<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
<%@include file="/common/common.jspf"%>
<link href="${pageContext.request.contextPath}/css/demo-page.css" rel="stylesheet" media="all">
<link href="${pageContext.request.contextPath}/css/hover.css" rel="stylesheet" media="all">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/commom/circleChart.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commom/template-native.js"></script>
</head>
<body>
	<div id="uuidKey" style="display:none;">${uuidKey}</div>
	<div id="ledSlider" class="dragdealer">
            <div class="handle red-bar" style="perspective: 1000px; backface-visibility: hidden; transform: translateX(475px);">
              <span class="value">74</span>%
            </div>
    </div>
	<div id="grid"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/deviceStatus/dashBoard.js"></script>
</body>
</html>
