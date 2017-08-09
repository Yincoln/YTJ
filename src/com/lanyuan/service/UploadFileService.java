package com.lanyuan.service;
import java.util.List;

import com.lanyuan.entity.UploadFileFormMap;
import com.lanyuan.service.base.BaseService;

public interface UploadFileService extends BaseService{
	public List<UploadFileFormMap> findByPage(UploadFileFormMap uploadFileFormMap) throws Exception;
	public List<String> findUserDevicesStrByPlayerId()throws Exception;
}
