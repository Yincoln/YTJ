package com.lanyuan.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.DeviceExtendFormMap;
import com.lanyuan.service.DeviceExtendService;
import com.lanyuan.service.PlayerExtendService;
import com.lanyuan.service.RoleService;
import com.lanyuan.service.base.BaseService;
import com.lanyuan.service.base.BaseServiceImpl;
import com.lanyuan.util.Common;

@Service("deviceExtendService")
public class DeviceExtendServiceImpl extends BaseServiceImpl implements
		DeviceExtendService {

	@Inject
	PlayerExtendService playerExtendService;
	@Inject
	BaseService baseService;
	@Inject
	RoleService roleService;

	@Override
	public List<DeviceExtendFormMap> findByPage1(
		DeviceExtendFormMap deviceExtendFormMap) throws Exception {
		// 获取该用户可操作的设备uuid
		// 当前登录用户的id
		int playerId = Integer.parseInt(Common.findPlayerSessionId());
		List<String> uuids = playerExtendService.findUserDevicesStrByPlayerId(playerId);
		deviceExtendFormMap.put("uuids", uuids);
		// 获取该用户角色roleKey
		String roleKey = roleService.findRoleKeyByUserId();
		deviceExtendFormMap.put("roleKey", roleKey);
		return baseService.findByPage(deviceExtendFormMap);
	}

}