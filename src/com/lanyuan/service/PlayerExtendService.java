package com.lanyuan.service;

import java.util.List;
import com.lanyuan.service.base.BaseService;

public interface PlayerExtendService extends BaseService{
	/**
	 * 根据用户Id返回其可操作设备的uuid
	 * @return
	 * @throws Exception
	 */
	public List<String> findUserDevicesStrByPlayerId(int pkayerId) throws Exception;
}
