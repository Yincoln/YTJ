<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="editform" name="editform" class="form-horizontal"
	method="post"
	action="${pageContext.request.contextPath}/update.shtml?FormMap=TestFormMap">
	<input type="hidden" class="form-control checkacc" value="${test_id}"
		name="test_id" id="test_id">
	<section class="panel panel-default">
		<div class="panel-body col-sm-8">
			<div class="form-group">
				<label class="col-sm-3 control-label">名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkRole"
						placeholder="请输入名" name="name" id="name"
						value="${name}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkRole"
						placeholder="请输入名" name="age" id="age"
						value="${age}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入描述"
						name="des" id="des"
						value="${des}">
				</div>
			</div>
		</div>
		<div class="col-sm-12">
			<%@include file="/common/buttom.jspf"%>
		</div>
	</section>
</form>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/system/test/edit.js"></script>
