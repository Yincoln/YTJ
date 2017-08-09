package com.lanyuan.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
/**
 * 
 * @author Yincoln 2017-06-30
 * @Email: 
 * @version 
 */
@Controller
@RequestMapping("/system/playerExtend/")
public class PlayerExtendController extends BaseController {
	
	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="设备管理-新增设备")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String addEntity(){
		/*try {
			DeviceFormMap deviceFormMap = getFormMap(DeviceFormMap.class);
			deviceService.addEntity(deviceFormMap);
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}*/
		return "success";
		
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@SystemLog(module="系统管理",methods="用户管理-修改用户")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String editEntity(String txtSelect) throws Exception {
//		UserFormMap userFormMap = getFormMap(UserFormMap.class);
//		userFormMap.put("txtdeviceSelect", txtSelect);
//		userService.editEntity(userFormMap);
//		userService.deleteByAttribute("userId", userFormMap.getStr("id"),UserdeviceFormMap.class);
//		if(!Common.isEmpty(txtSelect)){
//			String[] txt = txtSelect.split(",");
//			UserdeviceFormMap userdeviceFormMap = null;
//			for (String deviceId : txt) {
//				userdeviceFormMap = new UserdeviceFormMap();
//				userdeviceFormMap.put("userId", userFormMap.get("id"));
//				userdeviceFormMap.put("deviceId", deviceId);
//				userService.addEntity(userdeviceFormMap);
//			}
//		}
		return "success";
	}
	
}