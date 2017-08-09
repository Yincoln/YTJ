package com.lanyuan.service;

import com.lanyuan.entity.RoleFormMap;
import com.lanyuan.service.base.BaseService;

public interface RoleService extends BaseService{
	public void editEntity(RoleFormMap roleFormMap,String resId,String txtSelect) throws Exception;
	public void addEntity(RoleFormMap roleFormMap,String resId,String txtSelect) throws Exception;
	/**
	 * 根据用户Id返回角色信息
	 * 考虑只有两种角色，管理员和普通用户（admin,simple）
	 * @return
	 * @throws Exception
	 */
	public String findRoleKeyByUserId() throws Exception;
}
