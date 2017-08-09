package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;
import com.lanyuan.exception.ParameterException;
import com.lanyuan.util.Common;
/**
 * user实体表
 */
@TableSeg(tableName = "ly_user", id = "id")
public class UserFormMap extends FormMap<String, Object> {

	/**
	 * @descript
	 * @author lanyuan
	 * @date 2015年3月29日
	 * @version 1.0
	 */
	private static final long serialVersionUID = 1L;
	
	public UserFormMap() {
		// TODO Auto-generated constructor stub
	}
	
	public UserFormMap validate(){
		if(Common.isEmpty(getStr("name"))){
			throw new ParameterException(" 用户名不为空！");
		}
		if(Common.isEmpty(getStr("password"))){
			throw new ParameterException(" 密码不为空！");
		}
		return this;
	}
}
