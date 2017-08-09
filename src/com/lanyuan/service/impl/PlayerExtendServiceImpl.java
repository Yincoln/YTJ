package com.lanyuan.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.lanyuan.entity.PlayerExtendFormMap;
import com.lanyuan.service.PlayerExtendService;
import com.lanyuan.service.base.BaseServiceImpl;
import com.lanyuan.util.JsonUtils;

@Service("playerExtendService")
public class PlayerExtendServiceImpl extends BaseServiceImpl implements
		PlayerExtendService {

	@Override
	public List<String> findUserDevicesStrByPlayerId(int playerId)
			throws Exception {
		PlayerExtendFormMap playerExtendFormMap = new PlayerExtendFormMap();
		playerExtendFormMap.put("playerId", playerId);
		playerExtendFormMap.put("mapper_id",
				"PlayerExtendMapper.selectUserDevice");
		// 获取用户可操作的设备
		PlayerExtendFormMap pmap = this.findById(playerExtendFormMap);
		String jsStr = (String) pmap.get("js_str");
		// 获取用户可操作设备的uuid,存储为List
		List<String> uuids = new ArrayList<String>();
		if(jsStr!=null && jsStr.length()!=0){
			// json字符串转换为Map
			Map<String, Object> str = JsonUtils.parseJSONMap(jsStr);
			@SuppressWarnings("unchecked")
			List<Map<String, Object>> o = (List<Map<String, Object>>) str.get("list");
			Map<String, Object> map;
			
			for (int k = 0; k < o.size(); k++) {
				map = o.get(k);
				String uuid = (String) map.get("uuid");
				uuids.add(uuid);
			}
		}else{
			uuids=null;
		}
		return uuids;
	}

}