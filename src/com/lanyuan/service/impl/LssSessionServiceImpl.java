package com.lanyuan.service.impl;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.LssSessionInfo;
import com.lanyuan.service.LssSessionService;
import com.lanyuan.service.RoleService;
import com.lanyuan.service.base.BaseService;
import com.lanyuan.service.base.BaseServiceImpl;
import com.lanyuan.util.Common;

@Service("lssSessionService")
public class LssSessionServiceImpl extends BaseServiceImpl implements LssSessionService{
	@Inject
	BaseService baseService;
	@Inject
	RoleService roleService;
	
	@Override
	public List<LssSessionInfo> findByPage(LssSessionInfo lssSessionInfo)
			throws Exception {
		//获取当前登录用户的accountName
		String accountName = Common.findUserSessionAccountName();
		lssSessionInfo.put("accountName", accountName);
		//获取该用户角色roleKey
		String roleKey = roleService.findRoleKeyByUserId();
		lssSessionInfo.put("roleKey", roleKey);
		return baseService.findByPage(lssSessionInfo);
	}

}
