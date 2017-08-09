<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="addform" name="addform" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/system/lssSession/createSession.shtml">
	<div id="uuidKey" style="display:none;">${uuidKey}</div>
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输流名称"
						name="streamname" id="streamname">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/lssSession/add.js"></script>
