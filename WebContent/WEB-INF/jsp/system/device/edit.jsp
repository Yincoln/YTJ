<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="editform" name="editform" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/system/device/editEntity.shtml">
	<input type="hidden" class="form-control checkacc" value="${device_id}"
		name="deviceFormMap.device_id" id="device_id">
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">设备名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入设备名" value="${devicename}"
						name="deviceFormMap.devicename" id="devicename">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">uuidKey</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输uuid"
						name="deviceFormMap.uuidKey" value="${uuidKey}" readonly="readonly">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">密码</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入密码"
						value="${password}" name="deviceFormMap.password"
						id="password">
				</div>
			</div>
			
		</div>
		<%@include file="/common/buttom.jspf"%>
	</section>
</form>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/system/device/edit.js"></script>