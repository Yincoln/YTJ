<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="addform" name="addform" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/system/dictionary/addEntity.shtml">
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">code</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入code"
						name="dictionaryFormMap.code" id="dictionarycode">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">值</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="值"
						name="dictionaryFormMap.value" id="dictionaryvalue">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入描述"
						name="dictionaryFormMap.description" id="description">
				</div>
			</div>
			<div class="form-group">
			<label class="col-sm-3 control-label">下级子类</label>
			<div class="col-sm-9">
				<table id="valuemaps"
					class="table table-bordered table-striped warnTable table-hover table-top-down"
					>
					<thead>
						<tr>
							<th>编码Code</th>
							<th>值</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tr>
						<td><input class="input text " type="hidden" 
							name="childId" value="">
							<input class="input text " required='required' type="text" name="childCode"
							value="" size="20" maxlength="64"></td>
						<td><input class="input text" type="text" required='required'
							name="childValue" value="" size="20"
							maxlength="64"></td>
						<td><input class="btn btn-lg btn-danger" type="button"
							value="删除" onclick="$(this).parents('tr').remove();"></td>
					</tr>
				</table>
				<input class="btn btn-lg btn-success" type="button" id="add_step"
				name="add_step" value="添加" onclick="showpopForm()">
			</div>
			</div>
		</div>
		<%@include file="/common/buttom.jspf"%>
	</section>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/dictionary/add.js"></script>