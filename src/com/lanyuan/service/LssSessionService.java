package com.lanyuan.service;
import java.util.List;

import com.lanyuan.entity.LssSessionInfo;
import com.lanyuan.service.base.BaseService;

public interface LssSessionService extends BaseService{
	public List<LssSessionInfo> findByPage(LssSessionInfo lssSessionInfo) throws Exception;
	
}
