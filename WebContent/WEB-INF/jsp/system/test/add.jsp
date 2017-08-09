<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="addform" name="addform" class="form-horizontal" method="post"
		action="${pageContext.request.contextPath}/insert.shtml?FormMap=TestFormMap">
		<input name="resId" id="resId" type="hidden">
		<section class="panel panel-default">
		<div class="panel-body col-sm-8">
			<div class="form-group">
				<label class="col-sm-3 control-label">名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入名" name="name" id="name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">年龄</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入年龄" name="age" id="age">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入描述"
						name="des" id="des">
				</div>
			</div>
		</div>
		<div class="col-sm-12">
		<%@include file="/common/buttom.jspf"%>
		</div>
	</section>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/test/add.js"></script>