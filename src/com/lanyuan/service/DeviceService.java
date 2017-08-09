package com.lanyuan.service;

import java.util.List;

import com.lanyuan.entity.DeviceFormMap;
import com.lanyuan.service.base.BaseService;

public interface DeviceService extends BaseService{
	/**
	 * 根据用户ID获取可操作的设备信息
	 * @param deviceFormMap
	 * @return 设备信息列表
	 * @throws Exception
	 */
	public List<DeviceFormMap>  findByPage1(DeviceFormMap deviceFormMap) throws Exception;
	/**
	 * 根据用户ID获取可操作的设备uuid
	 * @return uuid列表
	 * @throws Exception
	 */
	public List<String> findUserDevicesStrByPlayerId(int playerId) throws Exception;
}