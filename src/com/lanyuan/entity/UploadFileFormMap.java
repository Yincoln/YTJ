package com.lanyuan.entity;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;
/**
 * uploadfileinfo实体表
 */
@TableSeg(tableName = "uploadfileinfo", id = "id")
public class UploadFileFormMap extends FormMap<String, Object> {

	/**
	 * @descript
	 * @author Yincoln
	 * @date 2017年7月4日
	 * @version 1.0
	 */
	private static final long serialVersionUID = 1L;
	
	public UploadFileFormMap() {
		// TODO Auto-generated constructor stub
	}
}