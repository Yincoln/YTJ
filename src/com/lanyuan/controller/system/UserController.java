package com.lanyuan.controller.system;

import java.util.ArrayList;
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
import com.lanyuan.entity.PlayerExtendFormMap;
import com.lanyuan.entity.PlayerFormMap;
import com.lanyuan.entity.UserFormMap;
import com.lanyuan.entity.UserPlayerFormMap;
import com.lanyuan.entity.UserRoleFormMap;
import com.lanyuan.exception.SystemException;
import com.lanyuan.service.UserService;
import com.lanyuan.util.Common;
import com.lanyuan.util.PasswordHelper;

/**
 * 
 * @author lanyuan 2016-05-19
 * @Email: mmm333zzz520@163.com
 * @version 4.1v
 */
@Controller
@RequestMapping("/system/user/")
public class UserController extends BaseController {
	@Inject
	private UserService userService; 
	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module="系统管理",methods="用户管理-新增用户")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String addEntity(String txtSelect){
		try {
			UserFormMap userFormMap = getFormMap(UserFormMap.class).validate();
			userFormMap.put("txtSelect", txtSelect);
			PasswordHelper passwordHelper = new PasswordHelper();
			//所有新增用户密码设为123456789
			userFormMap.put("password","123456789");
			passwordHelper.encryptPassword(userFormMap);
			userService.addEntity(userFormMap);
			
			//将新增用户添加到t_player表中
			PlayerFormMap playerFormMap = new PlayerFormMap();
			playerFormMap.put("username", userFormMap.get("name"));
			playerFormMap.put("user_key", userFormMap.get("accountName"));
			playerFormMap.put("password", userFormMap.get("accountName"));
			String date = Common.fromDateH();
			playerFormMap.put("active_dt", date);
			playerFormMap.put("create_dt", date);
			userService.addEntity(playerFormMap);
			
			//添加ly_user_player，关联两张表
			UserPlayerFormMap userPlayerFormMap = new UserPlayerFormMap();
			userPlayerFormMap.put("user_id", userFormMap.get("id"));
			userPlayerFormMap.put("player_id", playerFormMap.get("player_id"));
			userService.addEntity(userPlayerFormMap);
			
			//将新增用户添加到t_player_extend表中
			PlayerExtendFormMap playerExtendFormMap = new PlayerExtendFormMap();
			playerExtendFormMap.put("player_id", playerFormMap.get("player_id"));
			userService.addEntity(playerExtendFormMap);
			
			//添加新增用户角色信息
			if (!Common.isEmpty(txtSelect)) {
				String[] txt = txtSelect.split(",");
				List<UserRoleFormMap> ulis = new ArrayList<UserRoleFormMap>();
				UserRoleFormMap userRoleFormMap = null;
				for (String roleId : txt) {
					userRoleFormMap = new UserRoleFormMap();
					userRoleFormMap.put("userId", userFormMap.get("id"));
					userRoleFormMap.put("roleId", roleId);
					ulis.add(userRoleFormMap);
				}
				userService.batchSave(ulis);
			}
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@SystemLog(module="系统管理",methods="用户管理-修改用户")//凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String editEntity(String txtSelect, String txtSelectDevices) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		userFormMap.put("txtRoleSelect", txtSelect);
		userService.editEntity(userFormMap);
		userService.deleteByAttribute("userId", userFormMap.getStr("id"),UserRoleFormMap.class);
		if(!Common.isEmpty(txtSelect)){
			String[] txt = txtSelect.split(",");
			UserRoleFormMap userRoleFormMap = null;
			for (String roleId : txt) {
				userRoleFormMap = new UserRoleFormMap();
				userRoleFormMap.put("userId", userFormMap.get("id"));
				userRoleFormMap.put("roleId", roleId);
				userService.addEntity(userRoleFormMap);
			}
		}
		
		//根据userId查找对应的playerId
		PlayerFormMap playerFormMap = new PlayerFormMap();
		playerFormMap.put("userId", userFormMap.get("id"));
		playerFormMap.put("mapper_id", "PlayerMapper.findPlayerByUserId");
		playerFormMap = userService.findById(playerFormMap);
		int playerId = Integer.parseInt(playerFormMap.getStr("player_id"));
		
		/**
		 * 更新用户可操作的设备信息
		 */
		if(!Common.isEmpty(txtSelectDevices)){
			String[] txt = txtSelectDevices.split(",");
			String device = new String();
			String jsStr = "{\"list\":[";
			DeviceFormMap deviceFormMap = new DeviceFormMap();
			//deviceFormMap.put("", "");
			for (String uuid : txt) {
				deviceFormMap.put("where"," uuidKey='"+uuid+"'");
				List<DeviceFormMap> dMap = userService.findByWhere(deviceFormMap);	
				
				if(dMap.size() != 0){
					device = "{\"devicename\":\""+dMap.get(0).getStr("devicename")+"\",\"status\":"+dMap.get(0).getInt("online")+",\"uuid\":\""+uuid+"\"}";
					jsStr += device + ",";
				}
			}
			jsStr = Common.trimComma(jsStr) + "]}";
			PlayerExtendFormMap playerExtendFormMap = new PlayerExtendFormMap();
			playerExtendFormMap.put("mapper_id", "PlayerExtendMapper.updateByPlayerId");
			playerExtendFormMap.put("player_id", playerId);
			playerExtendFormMap.put("js_str", jsStr);
			userService.editEntity(playerExtendFormMap);
		}else{
			String jsStr="";
			PlayerExtendFormMap playerExtendFormMap = new PlayerExtendFormMap();
			playerExtendFormMap.put("mapper_id", "PlayerExtendMapper.updateByPlayerId");
			playerExtendFormMap.put("player_id", playerId);
			playerExtendFormMap.put("js_str", jsStr);
			userService.editEntity(playerExtendFormMap);
		}
		
		return "success";
	}
	
	@RequestMapping("seletUser")
	public String seletRole(Model model) throws Exception {
		UserFormMap userFormMap = getFormMap(UserFormMap.class);
		userFormMap.put("mapper_id", "UserMapper.seletUser");
		List<UserFormMap> list = userService.findByNames(userFormMap);
		String ugid = "";
		for (UserFormMap ml : list) {
			ugid += ml.get("id")+",";
		}
		ugid = Common.trimComma(ugid);
		model.addAttribute("txtSelect", ugid);
		model.addAttribute("useSelect", list);
		if(StringUtils.isNotBlank(ugid)){
			String[] g = ugid.split(",");
			String v = "";
			for (String s : g) {
				v+="'"+s+"',";
			}
			userFormMap.put("where", " id not in ("+Common.trimComma(v)+")");
		}
		userFormMap.remove("mapper_id");
		List<UserFormMap> users = userService.findByWhere(userFormMap);
		model.addAttribute("unSelect", users);
		model.addAttribute("lableName", userFormMap.get("lableName"));
		return "/common/select_plugin";
	}
	
}