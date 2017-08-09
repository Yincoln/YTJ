package com.lanyuan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.ResRoleFormMap;
import com.lanyuan.entity.RoleFormMap;
import com.lanyuan.entity.UserRoleFormMap;
import com.lanyuan.exception.SystemException;
import com.lanyuan.service.RoleService;
import com.lanyuan.service.base.BaseServiceImpl;
import com.lanyuan.util.Common;

@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl implements RoleService {
	
	
	public void editEntity(RoleFormMap roleFormMap,String resId,String txtSelect) throws Exception {
		try {
			this.editEntity(roleFormMap);
			 pession(roleFormMap.get("id").toString(), resId, txtSelect);
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}
	}
	
	
	public void pession(String roleId,String resId,String txtUserSelect) throws Exception{
		String[] txt = txtUserSelect.split(",");
		UserRoleFormMap userRoleFormMap = null;
		this.deleteByAttribute("roleId", roleId, UserRoleFormMap.class);
		if (!Common.isEmpty(txtUserSelect)) {
			List<UserRoleFormMap> ulis = new ArrayList<UserRoleFormMap>();
			for (String userId : txt) {
				userRoleFormMap = new UserRoleFormMap();
				userRoleFormMap.put("userId", userId);
				userRoleFormMap.put("roleId", roleId);
				ulis.add(userRoleFormMap);
			}
			this.batchSave(ulis);
		}
		this.deleteByAttribute("roleId", roleId, ResRoleFormMap.class);
		if(Common.isNotEmpty(resId)){
			String[] s = Common.trimComma(resId).split(",");
			List<ResRoleFormMap> resUserFormMaps = new ArrayList<ResRoleFormMap>();
			ResRoleFormMap resRoleFormMap = null;
			for (String rid : s) {
				resRoleFormMap = new ResRoleFormMap();
				resRoleFormMap.put("resId", rid);
				resRoleFormMap.put("roleId", roleId);
				resUserFormMaps.add(resRoleFormMap);
			}
			this.batchSave(resUserFormMaps);
		}	
	}


	@Override
	public void addEntity(RoleFormMap roleFormMap, String resId, String txtSelect) throws Exception {
		try {
			this.addEntity(roleFormMap);
			 pession(roleFormMap.get("id").toString(), resId, txtSelect);
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}
	}


	@Override
	public String findRoleKeyByUserId() throws Exception {
		RoleFormMap roleFormMap = new RoleFormMap();
		String userId = Common.findUserSessionId();
		roleFormMap.put("userId", userId);
		roleFormMap.put("mapper_id", "RoleMapper.seletUserRole");
		//获取用户角色
		RoleFormMap rmap = this.findById(roleFormMap);
		String roleKey = (String)rmap.get("roleKey");
		//考虑只有 管理员和普通用户   两种角色
		return roleKey;
	}
}
