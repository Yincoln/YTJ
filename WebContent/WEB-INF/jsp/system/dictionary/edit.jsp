<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="editform" name="editform" class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/system/dictionary/editEntity.shtml">
	<input type="hidden" class="form-control" value="${dictionary.id}"
		name="dictionaryFormMap.id" id="id">
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">code</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="请输入code" value="${dictionary.code}"
						name="dictionaryFormMap.code" id="dictionarycode"
						readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">值</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输值"
						name="dictionaryFormMap.value" id="dictionaryvalue" value="${dictionary.value}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入描述"
						name="dictionaryFormMap.description" id="description" value="${dictionary.description}">
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
					<c:forEach items="${dicChild}" var="key">
					<tr>
						<td><input class="input text " required='required' type="text" name="childCode"
							value="${key.code}" size="20" maxlength="64"></td>
						<td><input class="input text" type="text" required='required'
							name="childValue" value="${key.value}" size="20"
							maxlength="64"></td>
						<td><input class="btn btn-lg btn-danger" type="button"
							value="删除" onclick="$(this).parents('tr').remove();"></td>
					</tr>
					</c:forEach>
				</table>
				<input class="btn btn-lg btn-success" type="button" id="add_step"
				name="add_step" value="添加" onclick="showpopForm()">
			</div>
			</div>
		</div>
		<%@include file="/common/buttom.jspf"%>
	</section>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/dictionary/edit.js"></script>