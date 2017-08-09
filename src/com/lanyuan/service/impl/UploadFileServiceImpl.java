package com.lanyuan.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.UploadFileFormMap;
import com.lanyuan.service.PlayerExtendService;
import com.lanyuan.service.RoleService;
import com.lanyuan.service.UploadFileService;
import com.lanyuan.service.base.BaseService;
import com.lanyuan.service.base.BaseServiceImpl;
import com.lanyuan.util.Common;
@Service("uploadFileService")
public class UploadFileServiceImpl extends BaseServiceImpl implements UploadFileService{
	@Inject
	BaseService baseService;
	@Inject
	RoleService roleService;
	@Inject
	PlayerExtendService playerExtendService;
	
	@Override
	public List<UploadFileFormMap> findByPage(UploadFileFormMap uploadFileFormMap) throws Exception {	
		//获取当前登录用户的accountName
		String accountName = Common.findUserSessionAccountName();
		uploadFileFormMap.put("accountName", accountName);		
		//获取该用户角色roleKey
		String roleKey = roleService.findRoleKeyByUserId();
		uploadFileFormMap.put("roleKey", roleKey);
		return baseService.findByPage(uploadFileFormMap);
	}

	@Override
	public List<String> findUserDevicesStrByPlayerId() throws Exception {
		//获取当前登录用户的player_id
		String playerId = Common.findPlayerSessionId();
		return playerExtendService.findUserDevicesStrByPlayerId(Integer.parseInt(playerId));
	}

}
