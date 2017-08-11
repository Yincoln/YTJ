package com.lanyuan.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.DeviceExtendFormMap;
import com.lanyuan.plugin.PageView;
import com.lanyuan.service.DeviceExtendService;
import com.lanyuan.util.ClientText;
import com.lanyuan.util.ClientMessage;
import com.lanyuan.util.Common;
import com.lanyuan.util.JsonUtils;

/**
 * 
 * @author lanyuan 2016-05-19
 * @Email: mmm333zzz520@163.com
 * @version 4.1v
 */
@Controller
@RequestMapping("/system/deviceStatus/")
public class DeviceExtendController extends BaseController {
	@Inject
	private DeviceExtendService deviceExtendService;

	@RequestMapping("showDashboard")
	public String showDashboard(Model model, String id) throws Exception {
		DeviceExtendFormMap deviceExtendFormMap = getFormMap(DeviceExtendFormMap.class);
		model.addAllAttributes(deviceExtendFormMap);
		model.addAttribute("uuidKey", deviceExtendFormMap.get("uuidKey"));
		DeviceExtendFormMap map = deviceExtendService
				.findById(deviceExtendFormMap);
		model.addAllAttributes(map);
		return Common.BACKGROUND_PATH + "/system/deviceStatus/showDashboard";
	}

	@RequestMapping("findByPage1")
	@ResponseBody
	public PageView findByPage1() throws Exception {
		DeviceExtendFormMap formMap = getFormMap(DeviceExtendFormMap.class);
		PageView pageView = getPageView(formMap);
		formMap.put("paging", pageView);
		pageView.setRecords(deviceExtendService.findByPage1(formMap));
		return pageView;
	}

	/**
	 * 处理用户发送的控制设备信息
	 * 
	 * @return 是否成功
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("control")
	public String control() throws Exception {
		DeviceExtendFormMap formMap = getFormMap(DeviceExtendFormMap.class);
		int userId = Integer.parseInt(Common.findPlayerSessionId());
		String accountName = Common.findUserSessionAccountName();
		//用户登录获取ip,port
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pro", 10001);
		map.put("passwd", accountName);
		map.put("key",accountName);//暂时处理成密码和用户关键名相同
		String data = JsonUtils.mapToJson(map);
		
		//创建套接字对象
		ClientText myClient = new ClientText("112.74.216.117", 9200);
		
		//必须先发送10002
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("pro", 10002);
		map1.put("pid", userId);
		String data1 = JsonUtils.mapToJson(map1);
		
		//要操作的设备状态信息列表
		if(formMap.get("data") != null && formMap.get("uuid")!=null){
			String uuid = (String)formMap.get("uuid");
			Map<String, Object> d = JsonUtils.parseJSONMap(formMap.getStr("data"));
			uuid = (String)uuid;
			@SuppressWarnings("unchecked")
			List<Map<String, Object>> o = (List<Map<String, Object>>)d.get("list");
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			for (int k = 0; k < o.size(); k++) {
				map = o.get(k);
				list.add(map);
			}
			
			// 10004
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("pro", 10004);
			map2.put("pid", userId); // 当前登录用户的player_id
			map2.put("uuidkey", uuid); // 操作的设备uuid，针对一个设备
			map2.put("did", 6);
			map2.put("list", list);
			String data2 = JsonUtils.mapToJson(map2);
			
			// 创建线程池
			ExecutorService mExecutor = Executors.newSingleThreadExecutor();
			//执行第一个用户登录消息
			Future<Map<String,Object>> result = mExecutor.submit(new ClientMessage(data, myClient));
			//获取url
			String url=result.get().get("url").toString();
			String[] ipPort = url.split(":");
			//创建新的socket,port为9100或9101
			ClientText myClient1 = new ClientText(ipPort[0],Integer.parseInt(ipPort[1]));
			//执行10002消息
			result = mExecutor.submit(new ClientMessage(data1, myClient1));
			//执行10004消息
			result = mExecutor.submit(new ClientMessage(data2, myClient1));
			//10004控制消息执行成功会有返回值
			if(result.get() != null)
				return "success";
			else
				return "fail";
		}else{
			return "fail";
		}		
	}
}