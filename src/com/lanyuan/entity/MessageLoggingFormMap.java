package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;
/**
 * t_message_logging实体表
 */
@TableSeg(tableName = "t_message_logging", id = "id")
public class MessageLoggingFormMap extends FormMap<String, Object> {

	/**
	 * @descript
	 * @author Yincoln
	 * @date 2017年8月11日
	 * @version 1.0
	 */
	private static final long serialVersionUID = 1L;
	
	public MessageLoggingFormMap() {
	}
}
