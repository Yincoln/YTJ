package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;


/**
 * @author Yincoln
 * 实体表
 */
@TableSeg(tableName = "ly_user_player", id="user_id")
public class UserPlayerFormMap extends FormMap<String,Object>{
	
	private static final long serialVersionUID = 1L;
	
}
