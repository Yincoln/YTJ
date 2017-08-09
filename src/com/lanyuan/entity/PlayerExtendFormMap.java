package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;

/**
 * user实体表
 */
@TableSeg(tableName = "t_player_extend", id = "id")
public class PlayerExtendFormMap extends FormMap<String, Object> {

	/**
	 * @descript
	 * @author Yincoln
	 * @date 2017年6月30日
	 * @version 1.0
	 */
	private static final long serialVersionUID = 1L;
	
	public PlayerExtendFormMap() {
		// TODO Auto-generated constructor stub
	}
}
