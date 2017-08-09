<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="addform" name="addform" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/system/file/addEntity.shtml" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -->
	<input type="text" id="resId" name="resId" style="display:none;" value="${resId}"/>
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">文件</label>
				<div class="col-sm-9">
					<input type="file" class="form-control checkacc" placeholder="请选择文件"
						name="file" id="file">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">文件别名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输文件别名"
						name="friendlyname" id="friendlyname">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请描述"
						name="description" id="description">
				</div>
			</div>
		</div>
		<%@include file="/common/buttom.jspf"%>
	</section>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/file/add.js"></script>
