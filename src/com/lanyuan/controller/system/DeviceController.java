package com.lanyuan.controller.system;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.DeviceFormMap;
import com.lanyuan.entity.PlayerFormMap;
import com.lanyuan.exception.SystemException;
import com.lanyuan.plugin.PageView;
import com.lanyuan.service.DeviceService;
import com.lanyuan.util.Common;

/**
 * 
 * @author Yincoln 2017-06-20
 * @Email: 
 * @version 
 */
@Controller
@RequestMapping("/system/device/")
public class DeviceController extends BaseController {
	@Inject
	private DeviceService deviceService; 
	
	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="设备管理-新增设备")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String addEntity(){
		try {
			DeviceFormMap deviceFormMap = getFormMap(DeviceFormMap.class);
			String uuidkey = deviceFormMap.getStr("prefix") + deviceFormMap.getStr("suffix");
			deviceFormMap.put("uuidKey",uuidkey);
			String date = Common.fromDateH();
			deviceFormMap.put("actice_dt", date);
			deviceFormMap.put("create_dt", date);		
			deviceService.addEntity(deviceFormMap);
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@SystemLog(module="系统管理",methods="设备管理-修改设备")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String editEntity() throws Exception {
		DeviceFormMap deviceFormMap = getFormMap(DeviceFormMap.class);
		deviceFormMap.put("mapper_id", "DeviceMapper.updateByDeviceId");	
		deviceService.editEntity(deviceFormMap);
		return "success";
	}
	
	@RequestMapping("findByPage1")
	@ResponseBody
	public PageView findByPage1() throws Exception{
		DeviceFormMap formMap = getFormMap(DeviceFormMap.class);
		PageView pageView = getPageView(formMap);
		formMap.put("paging", pageView);
		pageView.setRecords(deviceService.findByPage1(formMap));
		return pageView;
	}
	
	@RequestMapping("seletDevice")
	public String seletDevice(Model model) throws Exception {
		DeviceFormMap deviceFormMap = getFormMap(DeviceFormMap.class);
		int userId = deviceFormMap.getInt("userId");
		
		PlayerFormMap playerFormMap = new PlayerFormMap();
		playerFormMap.put("userId", userId);
		//根据userId查找对应的playerId
		playerFormMap.put("mapper_id", "PlayerMapper.findPlayerByUserId");
		playerFormMap = deviceService.findById(playerFormMap);
		int playerId = Integer.parseInt(playerFormMap.getStr("player_id"));
		
		//获取该用户可操作的设备列表
		List<String> uuids = deviceService.findUserDevicesStrByPlayerId(playerId);		
		String dgid = "";
		//如果该用户可以操作至少一个设备
		if(uuids != null && uuids.size()!=0){
			for(int i = 0; i < uuids.size(); i++){
				dgid += uuids.get(i) + ",";
			}
			dgid = Common.trimComma(dgid);
			model.addAttribute("txtSelectDevices",dgid);
			model.addAttribute("useSelect",uuids);
			if(StringUtils.isNotBlank(dgid)){
				String[] g = dgid.split(",");
				String v = "";
				for (String s : g) {
					v+="'"+s+"',";
				}
				deviceFormMap.put("where", " uuidKey not in ("+Common.trimComma(v)+")");
			}
			if(deviceFormMap.get("mapper_id") != null)
				deviceFormMap.remove("mapper_id");
			List<DeviceFormMap> devices = deviceService.findByWhere(deviceFormMap);
			model.addAttribute("unSelect",devices);
			model.addAttribute("lableName",deviceFormMap.get("lableName"));
		}else{//该用户没有可操作的设备
			model.addAttribute("txtSelectDevices",dgid); //dgid为""
			model.addAttribute("useSelect",uuids); //uuids为null
			DeviceFormMap device = new DeviceFormMap();
			device.put("mapper_id", "DeviceMapper.findDevicePage");
			List<DeviceFormMap> devices = deviceService.findByPage(device);
			model.addAttribute("unSelect",devices);
			model.addAttribute("lableName",deviceFormMap.get("lableName"));
		}
		
		return "/common/select_plugin_device";
	}
	
	@RequestMapping("QRcode")
	public String QRcode(Model model) throws Exception {
		DeviceFormMap deviceFormMap = getFormMap(DeviceFormMap.class);
		//uuidKey传到QRcode.jsp
		model.addAttribute("uuidKey",deviceFormMap.get("uuidKey"));
		model.addAttribute("password",deviceFormMap.get("password"));
		return Common.BACKGROUND_PATH+"/system/device/QRcode";
	}
}