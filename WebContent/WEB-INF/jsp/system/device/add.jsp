<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="addform" name="addform" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/system/device/addEntity.shtml">
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">设备名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输名称"
						name="deviceFormMap.devicename" id="devicename">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">uuidKey</label>
				<div class="col-sm-9">
					<div class="input-group" style="width:100%">
						<span class="input-group-btn" style="width:40%">
							<input type="text" class="form-control" readonly="readonly" 
							name="prefix" id="prefix" style="width:90%" value="AIOM"/>
						</span>
						<input type="text" class="form-control" name="suffix" id="suffix" style="width:100%"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">密码</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc" placeholder="请输密码" value="12345678"
						name="deviceFormMap.password" id="password">
				</div>
			</div>
		</div>
		<%@include file="/common/buttom.jspf"%>
	</section>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/device/add.js"></script>
