<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="addform" name="addform" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/system/user/addEntity.shtml">
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">账号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输账号"
						name="userFormMap.accountName" id="add_accountName">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输账号"
						name="userFormMap.name" id="name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">密码</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输密码"
						name="userFormMap.password" id="password">
				</div>
			</div>
			<div id="selGroup" data-url="/system/role/seletRole.shtml?lableName=角色组"></div>
			<div class="form-group">
					<label class="col-sm-3 control-label">是否启用</label>
					<div class="col-sm-9">
					<label class="inline"><input id="id-button-borders" checked="checked" onclick="checkstate(this)" type="checkbox" class="ace ace-switch ace-switch-6"><span class="lbl middle"></span></label>
					<input type="hidden"
							name="userFormMap.locked" id="locked" value="1">
				</div>
				</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入账号描述"
						name="userFormMap.description" id="description">
				</div>
			</div>
		</div>
		<%@include file="/common/buttom.jspf"%>
	</section>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/user/add.js"></script>
<script type="text/javascript">
function checkstate(obj){
	if(obj.checked){
		$("#locked").val("1")
	}else{
		$("#locked").val("0")
	}
}
	onloadurl("selGroup");
</script>