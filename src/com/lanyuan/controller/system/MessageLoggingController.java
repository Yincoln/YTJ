package com.lanyuan.controller.system;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.DeviceFormMap;
import com.lanyuan.entity.MessageLoggingFormMap;
import com.lanyuan.service.MessageLoggingService;
import com.lanyuan.util.JsonUtils;

/**
 * 
 * @author Yincoln 2017-08-11
 * @Email:
 * @version
 */
@Controller
@RequestMapping("/system/messageLogging/")
public class MessageLoggingController extends BaseController {
	@Inject
	private MessageLoggingService messageLoggingService;

	/**
	 * 存储设备某时间点的状态
	 * @param uuid js_str
	 * @return "success"——新增成功、"error"——查询设备失败、"设备不存在"、"存储失败"	
	 */
	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module = "系统管理", methods = "消息记录管理-新增记录")
	// 凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String addEntity() {
		// 将文件信息保存到数据库
		MessageLoggingFormMap messageLogging = getFormMap(MessageLoggingFormMap.class);
		String uuidkey = messageLogging.getStr("uuid");
		String jsStr = messageLogging.getStr("js_str");

		if(uuidkey.length() != 0 && jsStr.length() != 0) {
			messageLogging.put("uuidkey", uuidkey);
			DeviceFormMap deviceFormMap = new DeviceFormMap();
			deviceFormMap.put("uuidKey",uuidkey);
			deviceFormMap.put("mapper_id", "DeviceMapper.findByUUID");
			// 查找设备是否存在
			try {
				deviceFormMap = messageLoggingService.findById(deviceFormMap);
				if(deviceFormMap==null)
					return "设备不存在";
				//获取服务器当前时间
				Date currentTime = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				//时间戳
				String timeStamp = formatter.format(currentTime);
				messageLogging.put("time_stamp", timeStamp);
				try {
					messageLoggingService.addEntity(messageLogging);
				} catch (Exception e) {
					return "存储失败";
				}
			} catch (Exception e1) {
				return "error";
			}
			return "success";
		}else {
			return "传入参数错误";
		}
	}

	/**
	 * 根据不同条件查询设备状态记录
	 * @param  uuid upper(时间上限) low(时间下限)
	 * @return js_str的list列表
	 */
	@ResponseBody
	@RequestMapping("getLog")
	public List<Map<String,Object>> getLog() {
		MessageLoggingFormMap messageLogging = getFormMap(MessageLoggingFormMap.class);	
		messageLogging.put("mapper_id", "MessageLoggingMapper.findLog");
		List<MessageLoggingFormMap> list = messageLoggingService.findByAll(messageLogging);
		//返回的类型
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		
		for (MessageLoggingFormMap messageLoggingFormMap : list) {
			//存放js_str，处理类型
			Map<String,Object> m = new HashMap<String,Object>();
			//存放js_str和uuidkey
			Map<String,Object> map = new HashMap<String,Object>();
			m = JsonUtils.parseJSONMap((String)messageLoggingFormMap.get("js_str"));
			map.put("time_stamp", messageLoggingFormMap.get("time_stamp").toString());
			map.put("uuidkey", messageLoggingFormMap.get("uuidkey"));	
			map.put("js_str", m);
			result.add(map);
		}
		return result;
	}
}