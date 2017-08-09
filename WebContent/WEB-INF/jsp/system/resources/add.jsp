<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/system/resources/add.js"></script>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
		<div class="panel-body">
		<form id="add_data_form" name="add_data_form" class="form-horizontal" method="post">
			<input type="hidden" name="level" id="level">
			<div class="form-group">
				<label class="col-sm-3 control-label">菜单名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入菜单名称" name="name" id="name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">菜单唯一KEY</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入菜单标识" name="resKey" id="resKey">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">菜单url</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入菜单url" name="resUrl" id="resUrl">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">上级菜单</label>
				<div class="col-sm-9">
					<select id="parentId" name="parentId" class="form-control m-b"
						tabindex="-1">
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">图标</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入icon" name="icon" id="icon">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否隐藏</label>
				<div class="col-sm-9">
					<label class="pull-left inline" style="margin-top: 5px;"> <input
						id="gritter-light" type="checkbox" name="ishide" id="ishide"
						class="ace ace-switch ace-switch-5" value="1"> <span
						class="lbl middle"></span>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">菜单描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入菜单描述" name="description" id="description">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">菜单类型</label>
				<div class="col-sm-9">
					<div class="btn-group m-r" id="typeId">
						<select id="type" name="type" class="form-control m-b"
							tabindex="-1" onchange="but(this)">
							<option value="0">------ 目录 ------</option>
							<option value="1">------ 菜单 ------</option>
							<option value="2">------ 按扭 ------</option>
						</select>
					</div>
					<div class="btn-group m-r" id="type_but" style="color: red;display: none;">
						<input type="checkbox" onclick="type_but(this)"> 菜单下是否添加按扭？
					</div>
				</div>
			</div>
			<div class="form-group" id="divbut" style="display: none;">
				<label class="col-sm-3 control-label">选择</label>
				<div class="col-sm-9">
					<div id="but" class="doc-buttons"></div>
				</div>
			</div>
			
			</form>
			</div>
			<form id="addform" name="addform" class="form-horizontal" method="post"
				action="${pageContext.request.contextPath}/system/resources/addEntity.shtml">
			<div class="form-group" id="divbutshe" style="display: none;">
					<label class="col-sm-3 control-label">设置按扭</label>
					<div class="col-sm-9" id="addFun_div_but">
					<fieldset>
					 <legend id="addFun_legend">按扭  1</legend>
						<div class="col-sm-12">
						<font color="red" class="col-sm-12"><label
							class="col-sm-2 control-label">url=</label><input type="text"
							class="col-xs-10" id="btnUrl" name="btn[0][btnUrl]">
						</font>
						<font color="red" class="col-sm-12"> <label
							class="col-sm-2 control-label">id=</label><input type="text"
							class="col-xs-4" id="btnId" name="btn[0][btnId]"> <label
							class="col-sm-2 control-label">name=</label><input type="text"
							class="col-xs-4" id="btnName" name="btn[0][btnName]">
						</font> <font color="red" class="col-sm-12" style="margin-top: 5px;">
							<label class="col-sm-2 control-label">class=</label><input
							type="text" class="col-xs-4" id="btnClass" name="btn[0][btnClass]">
							<label class="col-sm-2 control-label">value=</label><input
							type="text" class="col-xs-4" id="btnValue" name="btn[0][btnValue]">
						</font>
					</div>
					</fieldset>
				</div>
			</div>
		
		<%@include file="/common/buttom.jspf"%>
		</form>
