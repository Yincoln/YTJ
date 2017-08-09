package com.lanyuan.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.DeviceFormMap;
import com.lanyuan.service.DeviceService;
import com.lanyuan.service.PlayerExtendService;
import com.lanyuan.service.RoleService;
import com.lanyuan.service.base.BaseService;
import com.lanyuan.service.base.BaseServiceImpl;
import com.lanyuan.util.Common;

@Service("deviceService")
public class DeviceServiceImpl extends BaseServiceImpl implements DeviceService {

	@Inject
	PlayerExtendService playerExtendService;
	@Inject
	BaseService baseService;
	@Inject
	RoleService roleService;
	
	@Override
	public List<DeviceFormMap> findByPage1(DeviceFormMap deviceFormMap) throws Exception {	
		//获取该用户可操作的设备uuid
		//获取当前登录用户的id
		String playerId = Common.findPlayerSessionId();
		List<String> uuids = playerExtendService.findUserDevicesStrByPlayerId(Integer.parseInt(playerId));		
		deviceFormMap.put("uuids", uuids);
		//获取该用户角色roleKey
		String roleKey = roleService.findRoleKeyByUserId();
		deviceFormMap.put("roleKey", roleKey);
		return baseService.findByPage(deviceFormMap);
	}
	@Override
	public List<String> findUserDevicesStrByPlayerId(int playerId) throws Exception{
		return playerExtendService.findUserDevicesStrByPlayerId(playerId);
	}
}