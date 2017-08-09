package com.lanyuan.entity;


import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;



/**
 * 菜单实体表
 */
@TableSeg(tableName = "ly_config", id="id")
public class ConfigFormMap extends FormMap<String,Object>{
	/**
	 *@descript
	 *@author lanyuan
	 *@date 2015年10月29日
	 *@version 1.0
	 */
	private static final long serialVersionUID = 1L;
}
