<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#forSelectDevices").dblclick(function() {
		selectedDevices();
	});
	$("#unSelectDevices").dblclick(function() {
		unselectedDevices();
	});
});
function selectedDevices() {
	var selOpt = $("#forSelectDevices option:selected");

	selOpt.remove();
	var selObj = $("#unSelectDevices");
	selObj.append(selOpt);

	var selOpt = $("#unSelectDevices")[0];
	ids = "";
	for (var i = 0; i < selOpt.length; i++) {
		ids += (selOpt[i].value  + ",");
	}

	if (ids != "") {
		ids = ids.substring(0, ids.length - 1);
	}
	$('#txtSelectDevices').val(ids);
}

function selectedAllDevices() {
	var selOpt = $("#forSelectDevices option");

	selOpt.remove();
	var selObj = $("#unSelectDevices");
	selObj.append(selOpt);

	var selOpt = $("#unSelectDevices")[0];
	ids = "";
	for (var i = 0; i < selOpt.length; i++) {
		ids += (selOpt[i].value  + ",");
	}

	if (ids != "") {
		ids = ids.substring(0, ids.length - 1);
	}
	$('#txtSelectDevices').val(ids);
}

function unselectedDevices() {
	var selOpt = $("#unSelectDevices option:selected");
	selOpt.remove();
	var selObj = $("#forSelectDevices");
	selObj.append(selOpt);

	var selOpt = $("#unSelectDevices")[0];
	ids = "";
	for (var i = 0; i < selOpt.length; i++) {
		ids += (selOpt[i].value + ",");
	}
	
	if (ids != "") {
		ids = ids.substring(0, ids.length - 1);
	}
	$('#txtSelectDevices').val(ids);
}

function unselectedAllDevices() {
	var selOpt = $("#unSelectDevices option");
	selOpt.remove();
	var selObj = $("#forSelectDevices");
	selObj.append(selOpt);

	$('#txtSelectDevices').val("");
}
</script>
<div class="form-group">
<input id="txtSelectDevices" type="hidden" value="${txtSelectDevices}"
			name="txtSelectDevices" />
	<label for="host" class="col-sm-3 control-label">${lableName}</label>
	<div class="col-sm-9">
		<table class="tweenBoxTable" name="t_tweenbox"
			id="t_tweenbox_device" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td>已选中</td>
					<td></td>
					<td>未选中</td>
				</tr>
				<tr>
					<td width="200"><select id="unSelectDevices" multiple="multiple"
						class="input-large" name="unSelectDevices"
						style="height: 150px; width: 150px">
						<c:forEach items="${useSelect}" var="key">
						<option value="${key}">${key}</option>
						</c:forEach>
					</select></td>
					<td align="center">
						<div style="margin-left: 5px; margin-right: 5px">
							<button onclick="selectedAllDevices()" class="btn btn-primary"
								type="button" style="width: 50px;" title="全选">&lt;&lt;</button>
						</div>
						<div style="margin-left: 5px; margin-right: 5px; margin-top: 5px;">
							<button onclick="selectedDevices()" class="btn btn-primary"
								type="button" style="width: 50px;" title="选择">&lt;</button>
						</div>
						<div style="margin-left: 5px; margin-right: 5px; margin-top: 5px;">
							<button onclick="unselectedDevices()" class="btn btn-primary"
								type="button" style="width: 50px;" title="取消">&gt;</button>
						</div>
						<div style="margin-left: 5px; margin-right: 5px; margin-top: 5px">
							<button onclick="unselectedAllDevices()" class="btn btn-primary"
								type="button" style="width: 50px;" title="全取消">&gt;&gt;</button>
						</div>
					</td>
					<td width="200"><select id="forSelectDevices"
						multiple="multiple" class="input-large"
						style="height: 150px; width: 150px">
						<c:forEach items="${unSelect}" var="key">
						<option value="${key.uuidKey}">${key.uuidKey}</option>
						</c:forEach>
					</select></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>