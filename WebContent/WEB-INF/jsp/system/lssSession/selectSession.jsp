<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en" class="htmlBody">
<head>
	<%@include file="/common/common.jspf"%>
	<script type="text/javascript">
		$('option .circle').css({"color":"#1dc359","font-weight":"bolder"});
		$('.circle').css("color","#1dc359");
		$('.circle').addClass("fa fa-circle");
		
		$('#pushStream').click(function(){
			var uuidKey = $('#uuidKey').text();
			//已选择的sessionId
			var sessionId = $("#sessionId option:selected").val();
	
			$.ajax({
				type : "POST",
				url : rootPath + '/system/lssSession/upstream.shtml',
				data : {uuidKey : uuidKey, sessionId : sessionId},
				async : false,
				dataType : 'json',
				success : function(json) {	
				}
			});
		});
		
	</script>
</head>
<body>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<div id="uuidKey" style="display:none;">${uuidKey}</div>
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">会话ID</label>
				<div class="col-sm-9">
					<select id="sessionId" class="input-large" name="sessionId"  multiple="multiple" style="height: 200px; width: 300px">
						<c:forEach items="${list}" var="key">
						<option value="${key.sessionId}">
						<c:if test="${key.status=='READY'}">READY</c:if>
						&nbsp;&nbsp;&nbsp;${key.sessionId }
						</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
	</section>
	<div id="button" style="text-align:center;">
		<button type="button" id="pushStream" class="btn btn-success btn-s-xs">确定</button>
		<button type="button" class="btn btn-default btn-s-xs" onclick="closeWin();">取消</button>
	</div>
</body>
</html>