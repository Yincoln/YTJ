<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="htmlBody">
<head>
<%@include file="/common/common.jspf"%>	
<style type="text/css">
input[type="text"]{
	padding: 2px;
}
label.inline{
	padding-right: 10px;
}
.input-group-addon{
	padding: 4px 12px;
}
.form-horizontal .control-label{
	padding-top: 0;
}
.left_right{
	padding-left: 8px;
	padding-right: 5px;
}
</style>
</head>
<body>
	<div class="page-content">
			<section class="panel panel-default ">
			<form id="form_attr" name="form_attr">
			<div class="form-horizontal panel-body col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label">生成url地址</label>
					<div class="col-sm-10" id="div_code_url" style="font-size: 14px;">
					<input type="text" class="col-xs-5 in_url" value="/system/config/唯一code/public.shtml"> <font color=red>如界面需要js文件，可以在地址加<font color=blue> js_path=XXX </font>(XXX js文件地址)</font>
					</div>
				</div>
				<div class="form-group">
				<label class="col-sm-2 control-label">界面code</label>
				<div class="col-sm-10">
					<table>
						<tr>
							<td><input type="text" class="input-medium"
								name="code" id="code" onpropertychange="smsUrl(this)" oninput="smsUrl(this)"></td>
							<td><label class="control-label left_right">名称:</label></td>
							<td><input type="text" class="input-medium"
							    name="name" id="name"></td>
						</tr>
					</table>
				</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">显示复选框</label>
				<div class="col-sm-10">
					<table>
						<tr>
							<td><input type="text" class="input-medium"
								name="checkbox" id="checkbox" value="true"></td>
							<td><label class="control-label left_right">复选框key值:</label></td>
							<td><input type="text" class="input-medium"
								name="checkValue" id="checkValue" value="id"></td>
							<td><label class="control-label left_right">宽度:</label></td>
							<td><input type="text" class="input-medium"
								name="width" id="width" value="100%"></td>
							<td><label class="control-label left_right">高度:</label></td>
							<td><input type="text" class="input-medium"
								name="height" id="height" value="100%"></td>
						</tr>
					</table>
				</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">是否分页</label>
					<div class="col-sm-10">
					<table>
						<tr>
							<td><input type="text" class="input-medium"
								name="usePage" id="usePage" value="true"></td>
							<td><label class="control-label left_right">每页显示:</label></td>
							<td><input type="text" class="input-medium"
								name="pageSize" id="pageSize" value="10"></td>
							<td><label class="control-label left_right">是否显示行号:</label></td>
							<td><input type="text" class="input-medium"
								name="serNumber" id="serNumber" value="false"></td>
						</tr>
					</table>
				</div>
				</div>
				</form>
				<div class="form-group">
					<label class="col-sm-2 control-label">查询SQL</label>
					<div class="col-sm-6">
						<textarea id="sql_feild" name="sql_feild" style="margin: 0px; width: 700px; height: 120px;"></textarea>
						<a class="btn btn-danger" onclick="findfield()">获取SQL字段</a>
						<a class="btn btn-info" onclick="addbutton()">配置按扭</a>
						<a class="btn btn-success" onclick="toGrid()">预览界面</a>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">生成按扭</label>
					<div class="col-sm-10" id="div_feild_btn" style="padding-top: 7px;">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">选择查询条件</label>
					<div class="col-sm-10" id="div_feild_key" style="padding-top: 7px;">
					</div>
				</div>
				<div class="form-group">
					
					<div class="col-sm-12">
						<form id="form_query_feild_key" name="form_query_feild_key" style="border-top: 1px solid #dddddd;border-bottom: 1px solid #dddddd">
							<table id="query_feild_key" width="100%">
								<tr>
									<td align="center" style="color: blue;">字段</td>
									<td colspan="4" align="center" style="color: blue;">属性值</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">表格字段</label>
					<div class="col-sm-10" id="table_feild_key" style="padding-top: 7px;">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">表格显示字段</label>
					<div class="col-sm-10" id="table_feild_key" style="padding-top: 7px;">
					</div>
				</div>
				<div class="form-group">
					<form id="form_feild_key" name="form_feild_key">
						<div class="col-sm-12">
							<table id="feild_key">
							</table>
						</div>
					</form>
				</div>
			</div>
			</section>
		<div id="div_page" style="display:none">
			<div class="page-content">
				<form id="pageform" name="pageform" class="form-inline">
				</form>
				<div class="doc-buttons" id="div_ce_btu" style="padding: 10px 0">
				</div>
				<div id="paging" class="form-group" style="padding: 10px 0">
				</div>
			</div>
		</div>
		<div id="div_time" style="display:none">
			<table style="height: 100px;margin-left: 20px;">
				<tr>
				<td><div class="input-group" style="width: 100%;">
					<input class="form-control date-picker" id="id-date-picker-1" type="text"/>
					<span class="input-group-addon">
						<i class="fa fa-calendar bigger-110"></i>
					</span>
					
				</div></td>
				<td>&nbsp;&nbsp;&nbsp;<label class="inline">
					<input type="radio" id="query_time" name="query_time" class="ace" value="time1">
					<span class="lbl"></span>
					</label></td>
				</tr>
				<tr>
				<td>
				<font color="red">暂不支持以下</font>
				<div class="input-daterange input-group">
					<input type="text" class="input-sm form-control" name="start"/>
					<span class="input-group-addon"> 
						<i class="fa fa-exchange"></i>
					</span>
					<input type="text" class="input-sm form-control" name="end"/>
				</div></td>
				<td>&nbsp;&nbsp;&nbsp;<label class="inline">
					<input type="radio" id="query_time" name="query_time" class="ace" value="time2">
					<span class="lbl"></span>
					</label></td>
				</tr>
			</table>
			<div style="color:red;margin-top: 10px;">
			 	注意：添加时间框，必须在js文件添加一段js--->  $('.input-daterange').datepicker({autoclose:true,format:'yyyy-mm-dd'});
			</div>	
				
			</div>
			<div id="div_sel" style="display:none">
			<form id="selform" name="selform" class="form-inline">
				<div style="text-align:center;margin-top:8px;">
					value=<input type="text" class="input-small" id="value" name="selet[0][value]" placeholder="option value=">&nbsp;&nbsp;&nbsp;
					text=<input type="text" class="input-small" id="text" name="selet[0][text]" value="请选择">&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;<a class="btn btn-info" onclick="addsel(this)">添加</a>
					&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" onclick="delsel(this)">删除</a>
				</div>
			</form>
		</div>
		</div>
		<script type="text/javascript">
		/*参考  https://github.com/marioizquierdo/jquery.serializeJSON  */
		var btn_pageii;
		function addbutton(){
			if($("#name").val()==""||$("#code").val()==""){
				layer.msg('界面CODE和名称必须！');
			}else{
				if("${id}"==""){
					var url= '/system/config/isExist.shtml'
					CommonUtil.ajax(rootPath + url, 
			  		{FormMap:"ConfigFormMap",	
					code:$("#code").val()}, 'json', true)
					.success(function(res) {
						if(res){
							layer.msg('界面code已经存在：'+$("#code").val());
						}else{
							btn_pageii = layer.open({
								title : "配置按扭",
								type : 2,
								area : [ "1000px", "580px" ],
								content : rootPath + '/system/resources/list.shtml?resId=4',btn: ['确认', '取消']
							  	,yes: function(index, layero){ //或者使用btn1
							  		 layer.close(index);
								 },cancel: function(index){ //或者使用btn2
									 layer.close(index);
								 }
							});
						}
					}).error(function(){
						
					})
				}else{
					btn_pageii = layer.open({
						title : "配置按扭",
						type : 2,
						area : [ "1000px", "580px" ],
						content : rootPath + '/system/resources/list.shtml?resId=4',btn: ['确认', '取消']
					  	,yes: function(index, layero){ //或者使用btn1
					  		 layer.close(index);
						 },cancel: function(index){ //或者使用btn2
							 layer.close(index);
						 }
					});
				}
			}
		}
		function configBtn(key){
			var inurl = $(".in_url").val();
			if(inurl.indexOf("resKey=")>-1){
				var s = inurl.substring(0,inurl.indexOf("resKey=")+7);
				var e = inurl.substring(inurl.indexOf("resKey=")+7,inurl.length);
				inurl=s+key;
				if(e.indexOf("&")>-1){
					var ed = e.substring(e.indexOf("&"));
					inurl=inurl+ed;
				}
			}else{
				if(inurl.indexOf("?")>-1){
					inurl+="&resKey="+key;
				}else{
					inurl+="?resKey="+key;
				}
			}
			$(".in_url").val(inurl);
			CommonUtil.ajax(rootPath + "/system/resources/findByRes.shtml", 
			  		{resKey:key}, 'json', true)
					.success(function(res) {
						if(res.length==undefined||res.length==0){
							$("#div_feild_btn").html("<font color=red>生成按扭失败</font>");
						}else{
							var bn = '';
							debugger;
							for(var bb in res){
								bn+='<button type="button" id="'+res[bb].btn.split(",")[0]+'" name="'+res[bb].btn.split(",")[1]+'" class="'+res[bb].btn.split(",")[2]+'">'+res[bb].btn.split(",")[3]+'</button>   ';
							}
							$("#div_feild_btn").html(bn);	
						}
					}).error(function(){
						$("#div_feild_btn").html("<font color=red>生成按扭失败</font>");
					});
		};
		$(function(){
			if("${id}"!=""){
				$("#name").val("${name}");
				$("#code").val("${code}");
				$(".in_url").val("${url}");
				var key = "${url}";
				key=key.substring(key.indexOf("resKey=")+7);
				if(key.indexOf("&")>-1)
				key=key.substring(0,key.indexOf("&"));
				CommonUtil.ajax(rootPath + "/system/resources/findByRes.shtml", 
		  		{resKey:key}, 'json', true)
				.success(function(res) {
					if(res.length==undefined||res.length==0){
					}else{
						var bn = '';
						for(var bb in res){
							bn+='<button type="button" id="'+res[bb].btn.split(",")[0]+'" name="'+res[bb].btn.split(",")[1]+'" class="'+res[bb].btn.split(",")[2]+'">'+res[bb].btn.split(",")[3]+'</button>   ';
						}
						$("#div_feild_btn").html(bn);	
					}
				}).error(function(){
					$("#div_feild_btn").html("<font color=red>获取按扭失败</font>");
				});
				var table_colum = ${table_colum==null ? '0':table_colum};
				var table_param = ${table_param==null ? '0':table_param};
				var query_param = ${query_param==null ? '0':query_param};
				for(var tp in table_param){
					$("#"+tp).val(table_param[tp]);
				};
				findfield();
				var ck='';
				for(var qp in query_param)
				{
					$("#div_feild_key input[value='"+qp+"']").prop('checked', 'true');
					ck += qu_pa(qp,CommonUtil._getValueByName(query_param[qp],"label"),
							CommonUtil._getValueByName(query_param[qp],"btnId"),
							CommonUtil._getValueByName(query_param[qp],"btnName"),
							CommonUtil._getValueByName(query_param[qp],"btnClass"),
							CommonUtil._getValueByName(query_param[qp],"sel_ck"),
							query_param[qp]);
					
				};
				$("#query_feild_key").append(ck);
				var cl = table_colum.l_column;
				for(var ta in cl){
					$("#table_feild_key input[value='"+cl[ta].colkey+"']").prop('checked', 'true');
					var tk ='';
					if(cl[ta].colkey.indexOf("col_custom_")>-1){
						tk =col_custom(ta,cl[ta].colkey,cl[ta].name,cl[ta].width);
					}else{
						tk = tb_pa(cl[ta].colkey,cl[ta]);
					}
					
					$("#feild_key tr").eq($("#feild_key tr").length-1).before(tk);
					if (CommonUtil.notNull(cl[ta].hide))
					$("#feild_key input[name='l_column["+ta+"][hide]']").prop('checked', 'true');
					if (CommonUtil.notNull(cl[ta].isSort))
					$("#feild_key input[name='l_column["+ta+"][isSort]']").prop('checked', 'true');
					if (CommonUtil.notNull(cl[ta].align))
					$("#feild_key select[name='l_column["+ta+"][align]']").val(cl[ta].align);
					if (CommonUtil.notNull(cl[ta].renderData))
					{
						var rd = cl[ta].renderData;
						$("#feild_key input[name='l_column["+ta+"][renderData]']").val(rd);
						rd=rd.substring(rd.indexOf("){")+2,rd.lastIndexOf("}"));
						$("#feild_key #render_"+ta+" #text_renderData").val(rd);
						if(cl[ta].colkey.indexOf("col_custom_")==-1){
							$("#render_"+ta).toggle();
						}
					};
						
				};
				
			};
		});
		
		var sclen = 0;
	
		function findfield() {
			if($("#sql_feild").val()==""){
				return false;
			}
			var res = CommonUtil.ajax(rootPath + '/system/config/find_feild.shtml',
									{ "mapper_id": "ConfigMapper.dynamic_sql",
											"last_time": new Date().getTime(),
											"query_sql":$("#sql_feild").val()}, 'json');
				var key='';
				for(var k in res){
					key +='<label class="inline">'+
					'<input type="checkbox" name="query_ck" class="ace" value="'+res[k]+'">'+
					'<span class="lbl"> '+res[k]+'</span>'+
					'</label>';
				}
				$("#div_feild_key").html(key);
				$("#table_feild_key").html(key);
				
				$("#div_feild_key input[name='query_ck']:checkbox").on('click', function(){ 
					 if ($(this)[0].checked) {
						 var value = $(this).val();
						var ck = qu_pa(value,value,value,value,"input-small");
						$("#query_feild_key").append(ck);
					 }else{
						 $("#query_tr_"+$(this).val()).remove();
					 }
					
				});  
				
				$("#table_feild_key input[name='query_ck']:checkbox").on('click', function(){  
					if ($(this)[0].checked) {  
						var	tk='';
						tk=tb_pa($(this).val(),'');
						$("#feild_key tr").eq($("#feild_key tr").length-1).before(tk);
					}else{
						$("#key_tr_"+$(this).val()).remove();
					}
				});
				if($("#addtr").length==0)
				$("#feild_key").append('<tr style="height: 35px;" id="addtr"><td align="right"><a class="btn btn-info" onclick="addtr(this)">自定义列</a></td></tr>');
			return false;
		}
		function qu_pa(value,label,btnId,btnName,btnClass,sel_ck,sel){
			var text = '';
			var sel_ = '';
			var time = '';
			var se = '';
			if(sel_ck==undefined||sel_ck==''||sel_ck.indexOf("text_")>-1)
				text = 'checked="checked"';
			else if(sel_ck.indexOf("sel_")>-1){
				sel_ = 'checked="checked"';
				var cm = sel.in_select;
				for(var c in cm){
					se +='<input type="text" id="in_'+value+'" name="'+value+'[in_select]['+c+'][value]" value="'+cm[c].value+'">';
		  			se +='<input type="text" id="in_'+value+'" name="'+value+'[in_select]['+c+'][text]" value="'+cm[c].text+'">';
		  		};
			}
			else if(sel_ck.indexOf("time_")>-1)
				time = 'checked="checked"';
			 var ck ='<tr style="height: 35px;font-weight:600;" id="query_tr_'+value+'"><td align="right">'+value+'</td><td style="padding-left:10px;">'+
			 	'label=<input type="text" class="input-small" id="label" name="'+value+'[label]" value="'+label+'"></td><td style="padding-left:10px;">'+
				'id=<input type="text" class="input-small" id="btnId" name="'+value+'[btnId]" value="'+btnId+'"></td><td style="padding-left:10px;">'+
				'name=<input type="text" class="input-small" id="btnName" name="'+value+'[btnName]" value="'+btnName+'"></td><td style="padding-left:10px;">'+
				'class=<input type="text" id="btnClass" name="'+value+'[btnClass]" value="'+btnClass+'"></td>'+
				'<td id="td_inp_'+value+'" style="display:none">'+se+'</td>'+
				'<td><input type="radio" name="'+value+'[sel_ck]" class="ace" '+text+' value="text_'+value+'">'+
				'<span class="lbl"> 文本</span>'+
				'</label></td>'+
				'<td><input type="radio" name="'+value+'[sel_ck]" class="ace" '+sel_+' value="sel_'+value+'" onclick="radCli(\'sel_'+value+'\')">'+
				'<span class="lbl"> 下拉框</span>'+
				'</label></td>'+
				'<td><label class="inline">'+
				'&nbsp;&nbsp;&nbsp;<input type="radio" name="'+value+'[sel_ck]" '+time+' class="ace" value="time_'+value+'" onclick="radCli(\'time_'+value+'\')">'+
				'<span class="lbl"> 时间框</span>'+
				'</label></td>'+
				'</tr>';
				return ck;
		}
		function tb_pa(value,o){
			var tk = '';
			var k= sclen;
			tk ='<tr style="height: 35px;" id="key_tr_'+value+'"><td align="center">'+value+'：<input type="hidden" name="l_column['+k+'][colkey]" id="colkey" value="'+value+'"></td>'+
			'<td><label class="inline"><input type="checkbox" class="ace" name="l_column['+k+'][hide]" id="hide" value="true"><span class="lbl">&nbsp;&nbsp;&nbsp;隐藏字段</span></label></td>'+
			'<td><label class="inline"><input type="checkbox" class="ace" name="l_column['+k+'][isSort]" id="isSort" value="true"><span class="lbl">&nbsp;&nbsp;&nbsp;排序</span></label></td>'+
			'<td>&nbsp;&nbsp;&nbsp;名称：</td><td><input type="text" name="l_column['+k+'][name]" id="name" class="input-small input-s" value="'+(o.name==undefined ? '':o.name)+'"></td>'+
			'<td>&nbsp;&nbsp;&nbsp;对齐方式：</td><td>'+
			'<select id="align" name="l_column['+k+'][align]">'+
			'<option value="center">center</option>'+
			'<option value="left">left</option>'+
			'<option value="right">right</option>'+
			'</select></td>'+
			'<td>&nbsp;&nbsp;&nbsp;宽度：</td><td><input type="text" name="l_column['+k+'][width]" id="width" class="input-small input-s" value="'+(o.width==undefined ? 'auto':o.width)+'"></td>'+
			'<td>&nbsp;&nbsp;&nbsp;<a class="btn btn-info" onclick="addrender(\'render_'+k+'\')">自定义列的内容</a></td><td id="render_'+k+'" style="display:none"><div>function(rowindex, data, rowdata, colkey){</div><input type="text" name="l_column['+k+'][renderData]" id="renderData" value="" style="display:none">'+
			'<textarea style="height: 78px;width: 200px;margin-left: 15px;margin-right: 15px;" id="text_renderData" name="text_renderData" onpropertychange="smsCount(this)" oninput="smsCount(this)"></textarea>'+
			'<div>}</div></td></tr>';
			sclen++;
			return tk;
		}
		
		var cm;
		function radCli(r){
			var bk = r.split("_");
			if (bk[0]=="sel") {  
				var ssel;
				if($("#td_inp_"+bk[1]+" input").length>0){
					ssel='';
					ssel += '<form id="sselform" name="sselform" class="form-inline">';
					var sum =0;
					$("#td_inp_"+bk[1]+" input").each(function(index){
						var na = this.name;
						if(na.indexOf("value")>-1){
							ssel += '<div style="text-align:center;margin-top:8px;">';
							ssel += 'value=<input type="text" class="input-small" id="value" name="selet['+sum+'][value]" placeholder="" value="'+this.value+'">&nbsp;&nbsp;&nbsp;';
						}else if(na.indexOf("text")>-1){
							ssel += 'text=<input type="text" class="input-small" id="text" name="selet['+sum+'][text]" value="'+this.value+'">&nbsp;&nbsp;&nbsp;';
							ssel += '&nbsp;&nbsp;&nbsp;<a class="btn btn-info" onclick="addsel(this)">添加</a>';
							ssel += '&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" onclick="delsel(this)">删除</a>';
							ssel += '</div>';
							sum++;
						}
					});
					ssel += '</form>';
				}else{
					ssel=$("#div_sel");
				}
				pageii = layer.open({
					title : "设置下拉框", 
					type : 1,
					area : [ "500px", "300px" ],
					content : ssel ,btn: ['确认', '取消']
				  	,yes: function(index, layero){ //或者使用btn1
				  		var l_colum;
				  		if($('#sselform').length>0){
				  			 l_colum = $('#sselform').serializeJSON();
				  		}else{
				  			 l_colum = $('#selform').serializeJSON();
				  		}
				  		var se = '';
				  		var cm = l_colum.selet;
				  		for(var c in cm){
				  			se +='<input type="text" id="in_'+bk[1]+'" name="'+bk[1]+'[in_select]['+c+'][value]" value="'+cm[c].value+'">';
				  			se +='<input type="text" id="in_'+bk[1]+'" name="'+bk[1]+'[in_select]['+c+'][text]" value="'+cm[c].text+'">';
				  		}
				  		$("#td_inp_"+bk[1]).html(se); 
				  		 layer.close(index);
					 },cancel: function(index){ //或者使用btn2
						 layer.close(index)
					 }
				});
			}else{
				pageii = layer.open({
					title : "选择时间", 
					type : 1,
					area : [ "500px", "300px" ],
					content : $("#div_time") ,btn: ['确认', '取消']
				  	,yes: function(index, layero){ //或者使用btn1
				  		var t= $("input[name='query_time']:checked");
				  		if(t.val()=="time1"){
				  			$("#td_inp_"+bk[1]).prev().find("input")[0].value="input-small date-picker";
				  		}else if(t.val()=="time2"){
				  			//待处理
				  		}
				  		 layer.close(index)
					 },cancel: function(index){ //或者使用btn2
						 layer.close(index)
					 }
				});
			}
		}
		function addrender(td){
			$("#"+td).toggle();
		}
		function deltr(t){
			$(t).parent().parent().remove();
		}
		function addtr(t){
			var le =sclen;
			var key=col_custom(le,'col_custom_'+le,'','auto');
			$(t).parent().parent().prev().after(key);
		}
		function col_custom(le,key,name,width){
			var k = '<tr id="key_tr_'+key+'"><td colspan="10"><table><tr><td align="center">'+key+'&nbsp;&nbsp;&nbsp;&nbsp;</td><td align="right">名称：</td><td><input type="text" name="l_column['+le+'][name]" id="name" class="input-small input-s" value="'+name+'"><input type="hidden" name="l_column['+le+'][colkey]" id="colkey" value="'+key+'"></td>'+
			'<td>&nbsp;&nbsp;&nbsp;对齐方式：</td><td>'+
			'<select id="align" name="l_column['+le+'][align]">'+
			'<option value="center">center</option>'+
			'<option value="left">left</option>'+
			'<option value="right">right</option>'+
			'</select></td>'+
			'<td>&nbsp;&nbsp;&nbsp;宽度：</td><td><input type="text" name="l_column['+le+'][width]" id="width" class="input-small input-s" value="'+width+'"></td>'+
			'<td>&nbsp;&nbsp;&nbsp;内容：</td><td id="render_'+le+'"><div>function(rowindex, data, rowdata, colkey){</div><input type="text" name="l_column['+le+'][renderData]" id="renderData" value="" checked="checked" style="display:none">'+
			'<textarea style="height: 78px;width: 200px;margin-left: 15px;margin-right: 15px;" id="text_renderData" name="text_renderData" onpropertychange="smsCount(this)" oninput="smsCount(this)"></textarea>'+
			'<div>}</div></td></table></td><td align="right"><a class="btn btn-info" onclick="deltr(this)">删除</a></td></tr>';
			sclen++;
			return k;
		}
		function smsUrl(t){
			var inurl = $(".in_url").val();
			var s = inurl.substring(0,inurl.indexOf("/config/")+8);
			var e = inurl.substring(inurl.indexOf("/public.shtml"));
			if (CommonUtil.notNull(t.value)){
				$(".in_url").val(s+t.value+e);
			}else{
				$(".in_url").val(s+'唯一code'+e);
			}
		}
		function smsCount(t){
			if (CommonUtil.notNull(t.value)){
				var f = 'function(rowindex, data, rowdata, colkey){';
				$(t).parent().find("input")[0].value=f+t.value+'}';
			}else{
				$(t).parent().find("input")[0].value='';
			}
		}
		function addsel(t){
			var inp = $(t);
			var div =inp.parent().clone();
			var le = $(t).parent().parent().find("div").length;
			div.find("input")[0].name="selet["+le+"][value]";
			div.find("input")[1].name="selet["+le+"][text]";
			$(t).parent().parent().append(div);
		}
		function delsel(d){
			var div = $(d).parent().parent().find("div").length;
			if(div==1){
				return false;
			}
			$(d).parent().remove();
		}
		function toGrid(){
			if($("#sql_feild").val()==""){
				layer.msg('查询sql不能为空！');
				return false;
			}
			var l_colum = $('#form_feild_key').serializeJSON();
			var form_attr = $('#form_attr').serializeJSON();
			var g = {
					jsonUrl : rootPath + '/system/config/findByPage.shtml',
					data:{"mapper_id": "ConfigMapper.dynamic_sql",
						"last_time": new Date().getTime(),
						"query_sql":$("#sql_feild").val()},
			};
			g= $.extend(g, l_colum);
			g= $.extend(g, form_attr);
			var grid=lyGrid(g,function(c,d){
				var fq = $("#form_query_feild_key").serializeJSON();
				var inp = '';
				for(var f in fq){
					var cla = CommonUtil._getValueByName(fq[f],"sel_ck");
					if(cla){
						if(cla.indexOf("time_")>-1){
							inp +='<div class="input-group">';
							inp +='<span class="h4">'+CommonUtil._getValueByName(fq[f],"label")+':</span><input class="'+CommonUtil._getValueByName(fq[f],"btnClass")+'"';
							inp +='type="text" id="'+CommonUtil._getValueByName(fq[f],"btnId")+'" name="'+CommonUtil._getValueByName(fq[f],"btnName")+'" style="padding: 1px;">';
							inp +='	<span class="input-group-addon" style="padding: 3px;">';
							inp +='	<i class="fa fa-calendar bigger-110"></i>';
							inp +='	</span></div>';
							inp +='</div>';
						}else if(cla.indexOf("text_")>-1){
							inp +='<div class="form-group">';
							inp +='<span class="h4">'+CommonUtil._getValueByName(fq[f],"label")+':</span><input class="'+CommonUtil._getValueByName(fq[f],"btnClass")+'" type="text"';
							inp +='id="'+CommonUtil._getValueByName(fq[f],"btnId")+'" name="'+CommonUtil._getValueByName(fq[f],"btnName")+'">';
							inp +='</div>';
						}else if(cla.indexOf("sel_")>-1){
							inp +='<div class="form-group">';
							inp +='<span class="h4">'+CommonUtil._getValueByName(fq[f],"label")+':</span>';
							inp += '&nbsp;&nbsp;<select class="'+CommonUtil._getValueByName(fq[f],"btnClass")+'"';
							inp +='id="'+CommonUtil._getValueByName(fq[f],"btnId")+'" name="'+CommonUtil._getValueByName(fq[f],"btnName")+'">';
							$("#td_inp_"+f+" input").each(function(index){
								var na = this.name;
								if(na.indexOf("value")>-1){
									inp +='<option value="'+this.value+'">';
								}else if(na.indexOf("text")>-1){
									inp +=''+this.value+'</option>';
								};
							});
						  	inp +='</select>';
							inp +='</div>';
						};
					};
				}
				inp +='&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="btn btn-info" id="page_search">查询</a>';
				$("#pageform").html(inp);
				$("#div_ce_btu").html($("#div_feild_btn").html());
				pageii = layer.open({
					title : "生成表格", 
					type : 1,
					area : [ "1000px", "500px" ],
					content : $("#div_page"),btn: ['保存', '取消']
				  	,yes: function(sum, layero){ //或者使用btn1
				  		layer.confirm('确认生成界面？', {
				  		  btn: ['确认','取消'] //按钮
				  		}, function(com){
					  		var q_param=JSON.stringify($("#form_query_feild_key").serializeJSON());
					  		var l_colum = JSON.stringify($('#form_feild_key').serializeJSON());
					  		var form_attr = JSON.stringify($('#form_attr').serializeJSON());
					  		var q_sql=$("#sql_feild").val();
					  		var url ='';
					  		if("${id}"==""){
					  			url='/system/config/insert.shtml';
					  		}else{
					  			url='/system/config/update.shtml?id=${id}';
					  		}
					  		CommonUtil.ajax(rootPath + url, 
					  		{name:$("#name").val(),
					  		code:$("#code").val(),	
					  		FormMap:"ConfigFormMap",	
					  		url:$(".in_url").val(),
					  		table_colum:l_colum,
					  		table_param:form_attr,
					  		query_sql:q_sql,
					  		query_param:q_param}, 'json', true)
							.success(function(res) {
								layer.msg('生成表格成功！直接预览url：'+$(".in_url").val());
								layer.close(com);
								layer.close(sum);
							}).error(function(){
								layer.msg('生成表格失败！');
							})
				  		}, function(index){
				  			 layer.close(index);
				  		});
					 },cancel: function(index){ //或者使用btn2
						 layer.close(index);
					 }
				});
				//datepicker plugin
				//link
				$('.date-picker').datepicker({
					autoclose: true,
					todayHighlight: true,
					format:'yyyy-mm-dd'
				})
				//show datepicker when clicking on the icon
				.next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				$("#page_search").click("click", function() {// 绑定查询按扭
					var searchParams = $("#pageform").serializeJSON();// 初始化传参数
					grid.setOptions({
						data : searchParams
					});
				});
			});
		}
		</script>
</body>
</html>