package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;



/**
 * 实体表
 */
@TableSeg(tableName = "ly_userlogin", id="id")
public class UserLoginFormMap extends FormMap<String,Object>{

	/**
	 *@descript
	 *@author lanyuan
	 *@date 2015年3月29日
	 *@version 1.0
	 */
	private static final long serialVersionUID = 1L;
}
