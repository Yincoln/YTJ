//启动LED滑动条
$(function() {
	new Dragdealer('ledSlider', {
		animationCallback : function(x, y) {
			$('#ledSlider .value').text(Math.round(x * 100));
		}
	});
});

// 根据device_id获取选中设备uuid
function getUuid() {
	var uuid = $('#uuidKey').text();
	return uuid;
}
// 显示单个状态，返回class="widget-*"的小部件
function render_status(s) {
	var name = s.statusname;
	var type = 'general';
	var control = '';
	var status = s.status;
	if(name.substring(0,3) == 'LED')
		name = 'LED';
	else if(name.substring(0,4) == 'Play')
		name = 'Play';
	else if(name.substring(0,7) == 'Battery')
		name = 'Battery';
		
	// 判断状态该如何显示以及如何控制
	switch (name) {
	case 'Location':
		type = 'weather';
		break;
	case 'Temperature':
		type = 'temperature';
		status /= 10;
		break;
	case 'Battery': //包含Battery_Status
		type = 'circle';
		break;
	case 'Humidity':
		type = 'humidity';
		status /= 10;
		break;
	case 'LED':
		type = 'circle';
		control = 'general';
		break;
	case 'Play': //包含play_music,Play_Broadcast
		type = 'play';
		control = 'general';
		break;
	case 'Play_Session':
		type = 'play';
		break;
	case 'Power':
		type = 'circle';
		break;
	case 'restart':
		type = 'restart';
		break;
	}
	var widget = $('<div></div>');// 小部件<div>加载中</div>
	widget.addClass('widget-' + type).data('name', s.statusname).data('status', status)
			.data('flag', s.flag);
	if (control) {
		widget.addClass('widget-control').addClass('widget-control-' + control);
	}
	return widget;
}//render_status


// 用于发送控制信息
function Control(uuid) {
	// 控制的对象为当前选中的设备或者为用户指定的设备（如果当前没有选中设备）
	this.uuids = uuid;//设备列表
	this.list = [];//操作列表
	
	this.getList = function(statusname,status,flag){
		var s = {
			statusname : statusname,
			status : status,
			flag : flag
		};	
		this.list.push(s);
		return this;
	};

	// 提交操作
	this.post = function() {
		var data = JSON.stringify({
	        list : this.list
	    });
		$.ajax({
			type : "post",
			url : rootPath + '/system/deviceStatus/control.shtml',
			data : {
				uuid : this.uuids, //设备列表
				data : data //操作列表数据，json字符串格式
			},
			async : true,
			dataType : "json",
			success : function(data) {
				//当前操作的状态对象
				var widget = $('.widget-control-general.selected');
				if(data == "success"){
					if(widget.has('.circleChart').length >= 0){
						widget.find('.circleChart').circleChart({
							size: 80,
							color: getColor(ledStatus),
					        value: $('#ledSlider .value').text()
					    });
					}else if(widget.has('img').length >= 0){
						if(widget.data('flag') == 1)
							widget.find("img").attr("src","/YTJ/images/playing.png").attr("alt","暂停");
						else if(widget.data('flag') == 2)
							widget.find("img").attr("src","/YTJ/images/pause.png").attr("alt","播放");
					}
					//控制成功后，修改该控件状态
					widget.data('flag',flag);
					layer.msg('成功操作了1台设备',{time:2000});
					widget.removeClass('selected');
				}else{
					var index = layer.msg('操作失败',{time:2000});
					layer.close(index);
					widget.removeClass('selected');
				}
			}
		});
	};
} //Control

// 设备网格视图
function refresh_grid(data) {
	var grid = $('#grid');
	grid.html('');

	var device = $('<div class="col-sm-12 col-md-12 col-lg-12"><div class="device-panel"><div class="pbody"></div></div></div>');

	var extend = JSON.parse(data);
	if (extend.list) {
		var list = extend.list;
		
		//临时添加地址信息，查看城市天气
		var weatherCity = {"statusname":"Location","status":"顺德"};
		list.push(weatherCity);
		
		// 添加状态块（温度，湿度等）
		function append_block(name, content) {
			var block = $('<div class="block block-default"><div class="block-wrapper"><div class="block-name">'
					+ name
					+ '</div><div class="block-content-wrapper"><div class="block-content"></div></div></div></div>');
			block.find('.block-content').append(content);
			device.find('.pbody').append(block);
		}

		// 循环处理设备状态
		list.forEach(function(l) {
			var name = l.statusname;
			switch (l.statusname) {
			case 'Location':
				name = '天气';
				break;
			case 'Temperature':
				name = '温度';
				break;
			case 'Battery_Status':
				name = '电量';
				break;
			case 'Battery':
				type = 'battery';
				break;
			case 'Humidity':
				name = '湿度';
				break;
			case 'Initialization':
				name = '初始化';
				break;
			case 'LED1_Status':
				name = 'LED1';
				break;
			case 'LED2_Status':
				name = 'LED2';
				break;
			case 'LED3_Status':
				name = 'LED3';
				break;
			case 'PM2.5':
				name = 'PM2.5';
				break;
			case 'Play_Broadcast':
				name = '广播播放';
				break;
			case 'Play_Music':
				name = '音乐播放';
				break;
			case 'Play_Session':
				name = '会议播放';
				break;
			case 'Power':
				name = 'Power';
				break;
			case 'restart':
				name = '重启';
				break;
			}
			append_block(name, render_status(l));
		});
	}
	grid.append(device);
	render_widget();
}//refresh_grid

/*
 * 根据百分比数值确定颜色
 */
function getColor(value){
	if(value <= 100 && value > 60)
		return "#CCFF66";//绿色
	else if(value <= 60 && value > 30)
		return "#FF9900";//橙色
	else if(value <= 30)
		return "#FF0033";//红色
};

function render_widget() {
	// 仅显示数值
	$('.widget-general').each(function() {
		var widget = $(this);
		widget.text(widget.data('status'));// 获取该部件的status值赋值给控件文本
	});

	$('.widget-play').each(function() {
		var widget = $(this);
		var flag = widget.data('flag');
		if(0 == flag) //停止
			widget.html('<a href="javascript:void(0)" class="hvr-float-shadow"><img src="/lanyuan-business-beta-4.1/images/playing.png"  alt="0" width="40px" height="40px"/></a>');
		else if(1 == flag) //正在播放
			widget.html('<a href="javascript:void(0)" class="hvr-float-shadow"><img src="/lanyuan-business-beta-4.1/images/pause.png"  alt="正在播放" width="40px" height="40px"/></a>');
		else if(2 == flag) //暂停
			widget.html('<a href="javascript:void(0)" class="hvr-float-shadow"><img src="/lanyuan-business-beta-4.1/images/playing.png"  alt="暂停" width="40px" height="40px"/></a>');
	});
	
	$('.widget-restart').each(function() {
		var widget = $(this);
		if(0 == widget.data('status'))
			widget.html('<a href="javascript:void(0)" class="hvr-float-shadow"><img src="/lanyuan-business-beta-4.1/images/restart.png"  alt="0" width="40px" height="40px"/></a>');
		else
			widget.html('<a href="javascript:void(0)" class="hvr-float-shadow"><img src="/lanyuan-business-beta-4.1/images/stop.png"  alt="1" width="40px" height="40px"/></a>');
	});
	
	/*
	 * 百分比控件
	 */
	var id=0;
	$('.widget-circle').each(function() {
		var widget = $(this);
		var value = widget.data('status');
		var name = widget.data('name');
		var color = getColor(value);
		//给要控制的状态加鼠标覆盖的效果
		if(name.substring(0,3) == 'LED' || name.substring(0,4) == 'Play')
			widget.html('<a href="javascript:void(0)" class="hvr-float-shadow"><div class="circleChart" id="'+id+'"></div></a>');
		else
			widget.html('<div class="circleChart" id="'+id+'"></div>');
		//数值为零时，依然显示环形
		$('.circleChart#'+id).circleChart({
		    size: 80,
		    value: value,
		    text: 0,
		    color: color,
		    backgroundColor: "#e6e6e6",
		    onDraw: function(el, circle) {
		        circle.text(Math.round(circle.value) + "%");
		    }
		});
		id++;
	});
	
	// 温度控件
	$('.widget-temperature').each(function() {
		var widget = $(this);
		widget.html(widget.data('status') + ' &deg;C');
		widget.tempGauge({
			labelSize : 10,
			width : 40,
			borderWidth : 2,
			borderColor : '#ccc',
			maxTemp : 40,
			minTemp : 0,
			showLabel : true
		});
	});

	// 湿度控件
	$('.widget-humidity').each(function() {
		var widget = $(this);
		var opts = {
			lines : 12, // The number of lines to draw
			angle : 0.08, // The length of each line
			lineWidth : 0.10, // The line thickness
			pointer : {
			length : 0.62, // The radius of the inner
			// circle
			strokeWidth : 0, // The rotation offset
			color : '#000000' // Fill color
			},
			limitMax : 'false', // If true, the pointer will not
			// go past the end of the gauge
			colorStart : '#6FADCF', // Colors
			colorStop : '#66CCCC', // just experiment with them
			strokeColor : '#eee', // to see which ones work
			// best for you
			generateGradient : true,
		};
		var canvas = $('<canvas style="width:100px; height:100px !important;"></canvas>');
		widget.html('<p>' + widget.data('status') + '</p>');
		widget.prepend(canvas);
		var gauge = new Gauge(canvas[0]).setOptions(opts); // create
		// sexy
		// gauge!
		gauge.maxValue = 100; // set max gauge value
		gauge.animationSpeed = 1; // set animation speed (32
		// is default value)
		gauge.set(widget.data('status')); // set actual value
	});		

	// 最基本的控制功能：点击设置新的数值，用于设置LED亮度或者控制音乐和广播的播放
	$('.widget-control-general').click(function() {
		var widget = $(this);
		widget.addClass('selected');
		// 通过设备的uuid控制
		var control = new Control(getUuid());
		var statusName = widget.data('name');
		var flag = widget.data('flag');
		if(statusName.substring(0,3) === 'LED'){
			var ledStatus = $('#ledSlider .value').text();
			//如果LED原本关着的，则设置flag=1
			if(flag == 0)
				flag = 1;
			control.getList(statusName, ledStatus, flag).post(); // 传递ledStatus值
			
			//控制成功后重新绘制led状态
			/*widget.find('.circleChart').circleChart({
				color: getColor(ledStatus),
		        value: $('#ledSlider .value').text()
		    });*/
		}else if(statusName.substring(0,4) === 'Play'){
			//如果正在播放，则设置flag=2，点击后将暂停播放
			if(flag == 1){
				flag = 2;
			}else if(flag == 2){
				//如果暂停，则设置flag=1，点击后将启动播放
				flag = 1;
			} 
			control.getList(statusName, 0, flag).post(); // 控制播放，暂停
		}
	});
	
}//render_widget()

(function getWeather(){
	var cityName="顺德";
	$.ajax({
	    url:"http://api.map.baidu.com/telematics/v3/weather",
	        type:"get",
	        data:{
	              location:cityName,
	              output:'json',
	              ak:'6tYzTvGZSOpYB5Oc2YGGOKt8'
	        },        
	    dataType:"jsonp",
	    success:function(data){
	        var weatherData=data.results[0].weather_data; 
	        var list=[];
	        list.push(weatherData[0].date);
	        list.push(weatherData[0].dayPictureUrl);
	        list.push(weatherData[0].nightPictureUrl);
	        list.push(weatherData[0].temperature);
	        list.push(weatherData[0].weather);
	        list.push(weatherData[0].wind);
	             
	            /**
	             * weatherData[0].date 当天日期
	             * weatherData[0].dayPictureUrl 日间天气图片
	             * weatherData[0].nightPictureUrl
	             * weatherData[0].temperature
	             * weatherData[0].weather
	             * weatherData[0].wind
	             */
	        $('.widget-weather').each(function() {
	        	var widget = $(this);
	        	var city = widget.data('status');
	        	var str = '<ul><li>'+city+'</li><li><img alt="白天" src="'+list[1]+'"/><img alt="夜间" src="'+list[2]+'"/></li><li>'+list[3]+'&nbsp;&nbsp;'+list[4]+'</li><li>'+list[0]+'</li></ul>';
	        	widget.html(str);
	        });
	    }
	});	    
})();