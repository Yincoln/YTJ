<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="editform" name="editform" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/system/file/editEntity.shtml">
	<input type="hidden" class="form-control checkacc" value="${id}"
		name="uploadFileFormMap.id" id="id">
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">文件别名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入账号" value="${friendlyname}"
						name="uploadFileFormMap.friendlyname" id="friendlyname">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入账号描述"
						value="${description}" name="uploadFileFormMap.description"
						id="description">
				</div>
			</div>
			
		</div>
		<%@include file="/common/buttom.jspf"%>
	</section>
</form>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/system/file/edit.js"></script>