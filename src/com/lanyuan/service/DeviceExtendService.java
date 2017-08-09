package com.lanyuan.service;
import java.util.List;

import com.lanyuan.entity.DeviceExtendFormMap;
import com.lanyuan.service.base.BaseService;

public interface DeviceExtendService extends BaseService{
	/**
	 * 根据用户ID获取可操作设备的状态信息
	 * @param deviceExtendFormMap
	 * @return
	 * @throws Exception
	 */
	public List<DeviceExtendFormMap>  findByPage1(DeviceExtendFormMap deviceExtendFormMap) throws Exception;
}
