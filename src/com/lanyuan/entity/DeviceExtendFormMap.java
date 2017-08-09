package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;
//import com.lanyuan.exception.ParameterException;
//import com.lanyuan.util.Common;
/**
 * t_device_extend实体表
 */
@TableSeg(tableName = "t_device_extend", id = "id")
public class DeviceExtendFormMap extends FormMap<String, Object> {

	/**
	 * @descript
	 * @author Yincoln
	 * @date 2017年6月29日
	 * @version 1.0
	 */
	private static final long serialVersionUID = 1L;
	
	public DeviceExtendFormMap() {
		// TODO Auto-generated constructor stub
	}
	
//	public DeviceFormMap validate(){
//		if(Common.isEmpty(getStr("name"))){
//			throw new ParameterException(" 用户名不为空！");
//		}
//		if(Common.isEmpty(getStr("password"))){
//			throw new ParameterException(" 密码不为空！");
//		}
//		return this;
//	}
}
