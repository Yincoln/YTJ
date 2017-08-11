package com.lanyuan.controller.system;
import java.util.ArrayList;
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
		messageLogging.put("uuidkey", uuidkey);
		DeviceFormMap deviceFormMap = new DeviceFormMap();
		deviceFormMap.put("uuidKey",uuidkey);
		deviceFormMap.put("mapper_id", "DeviceMapper.findByUUID");
		// 查找设备是否存在
		try {
			deviceFormMap = messageLoggingService.findById(deviceFormMap);
		} catch (Exception e1) {
			return "error";
		}
		
		//将jsStr中时间戳取出，存入单独的数据库字段
		Map<String, Object> map = JsonUtils.parseJSONMap(jsStr);
		@SuppressWarnings("unchecked")
		ArrayList<Map<String,Object>> o = (ArrayList<Map<String, Object>>) map.get("list");
		//时间戳
		String timeStamp = "";
		for (Map<String, Object> map2 : o) {
			String statusname = (String)map2.get("statusname");
			if(statusname.equals("msgTime"))
				timeStamp = (String)map2.get("status");
		}
		messageLogging.put("time_stamp", timeStamp);
		try {
			messageLoggingService.addEntity(messageLogging);
		} catch (Exception e) {
			return "存储失败";
		}
		return "success";
	}

	/**
	 * 根据不同条件查询设备状态记录
	 * @param  uuid upper(时间上限) low(时间下限)
	 * @return js_str的list列表
	 */
	@ResponseBody
	@RequestMapping("getLog")
	public List<MessageLoggingFormMap> getLog() {
		MessageLoggingFormMap messageLogging = getFormMap(MessageLoggingFormMap.class);	
		messageLogging.put("mapper_id", "MessageLoggingMapper.findLog");
		List<MessageLoggingFormMap> list = messageLoggingService.findByAll(messageLogging);	
		return list;
	}
}