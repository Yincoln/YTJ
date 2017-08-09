package com.lanyuan.service.base;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lanyuan.annotation.TableSeg;
import com.lanyuan.entity.base.FormMap;
import com.lanyuan.exception.SystemException;
import com.lanyuan.mapper.base.BaseMapper;
import com.lanyuan.util.Common;
import com.lanyuan.util.EhcacheUtils;

/**
 * 服务实现的基类,封装基本的增，删，改。查的方法 所有服务实现类都要继承这个,然后写自己的具体实现方法,
 * 如果只有简单的增，删，改。查业务，继承这个实现类基类时,子类什么都不写，在控制直接调用父类方法即可， 写法：具体可以参照RoleServiceImpl
 * 
 * @author lanyuan
 * @date 2016-05-01
 * @Email: mmm333zzz520@163.com
 * @version 4.1v
 * @param
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
@Service("baseService")
public class BaseServiceImpl implements BaseService {

	@Inject
	public BaseMapper baseMapper;

	@Override
	public <T> List<T> findByPage(T formMap) {
		validate(formMap, "baseMapper.findByPage");
		return baseMapper.findByList(formMap);
	}

	@Override
	public <T> List<T> findByAll(T formMap) {
		validate(formMap, "baseMapper.findByList");
		return baseMapper.findByList(formMap);
	}

	@Override
	public <T> void deleteByIds(T formMap) throws Exception {
		validate(formMap, "baseMapper.deleteByIds");
		baseMapper.delete(formMap);
	}

	@Override
	public <T> T findById(T formMap) throws Exception {
		validate(formMap, "baseMapper.findById");
		List<T> lists = baseMapper.findByList(formMap);
		if (null != lists && lists.size() > 0) {
			return (T) lists.get(0);
		} else {
			return null;
		}
	}

	@Override
	public <T> List<T> findByIds(T formMap) throws Exception {
		validate(formMap, "baseMapper.findById");
		List<T> lists = baseMapper.findByList(formMap);
		if (null != lists && lists.size() > 0) {
			return lists;
		} else {
			return null;
		}
	}

	@Override
	public <T> void editEntity(T formMap) throws Exception {
		validate(formMap, "baseMapper.editEntity");
		baseMapper.editEntity(formMap);
	}

	@Override
	public <T> void addEntity(T formMap) throws Exception {
		validate(formMap, "baseMapper.addEntity");
		baseMapper.addEntity(formMap);
		Object id = Common.FormMap(formMap).get("ly_table_id");
		if (id == null) {
			TableSeg table = (TableSeg) formMap.getClass().getAnnotation(TableSeg.class);
			String table_id = table.id();
			if (table_id.split(",").length == 1) {
				if (Common.FormMap(formMap).get(table_id) == null) {
					Common.FormMap(formMap).put(table_id, Common.FormMap(formMap).get("id"));
					Common.FormMap(formMap).remove("id");
				}
			}
		} else {
			if (Common.FormMap(formMap).get(id) == null) {
				Common.FormMap(formMap).put(id.toString(), Common.FormMap(formMap).get("id"));
				Common.FormMap(formMap).remove("id");
			}
		}
	}

	@Override
	public <T> List<T> findByWhere(T formMap) {
		validate(formMap, "baseMapper.findByWhere");
		return baseMapper.findByList(formMap);
	}

	@Override
	public <T> void batchSave(List<T> formMap) throws Exception {
		baseMapper.batchSave(formMap);
	}

	@Override
	public <T> void deleteByNames(T formMap) throws Exception {
		validate(formMap, "baseMapper.deleteByNames");
		baseMapper.delete(formMap);
	}

	@Override
	public <T> List<T> findByNames(T formMap) {
		validate(formMap, "baseMapper.findByNames");
		return baseMapper.findByList(formMap);
	}

	@Override
	public <T> T findbyFrist(T formMap) {
		validate(formMap, "baseMapper.findByNames");
		List<T> lists = baseMapper.findByList(formMap);
		if (null != lists && lists.size() > 0) {
			return (T) lists.get(0);
		} else {
			return null;
		}
	}

	@Override
	public <T> T findbyFrist(String key, String value, Class<T> clazz) {
		FormMap formMap = null;
		try {
			formMap = (FormMap) clazz.newInstance();
			formMap.put("key", key);
			formMap.put("value", value);
			formMap.put("clazz", clazz);
			validate(formMap, "baseMapper.findbyFrist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<FormMap> lists = baseMapper.findByList(formMap);
		if (null != lists && lists.size() > 0) {
			return (T) lists.get(0);
		} else {
			return null;
		}
	}

	@Override
	public <T> List<T> findByAttribute(String key, String value, Class<T> clazz) {
		FormMap formMap = null;
		try {
			formMap = (FormMap) clazz.newInstance();
			formMap.put("key", key);
			formMap.put("value", value);
			formMap.put("clazz", clazz);
			validate(formMap, "baseMapper.findByAttribute");
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<FormMap> ls = baseMapper.findByList(formMap);
		if (null != ls && ls.size() > 0) {
			return (List<T>) ls.get(0);
		} else {
			return null;
		}
	}

	@Override
	public void deleteByAttribute(String key, String value, Class<?> clazz) throws Exception {
		FormMap formMap = null;
		try {
			formMap = (FormMap) clazz.newInstance();
			formMap.put("key", key);
			formMap.put("value", value);
			formMap.put("clazz", clazz);
			validate(formMap, "baseMapper.deleteByAttribute");
			baseMapper.delete(formMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Map<String, Object>> initTableField(Map<String, Object> formMap) {
		formMap.put("mapper_id", "initTableField");
		return baseMapper.findByList(formMap);
	}

	public <T> void validate(T formMap, String mapper_id) {
		if (null == Common.FormMap(formMap).get("mapper_id")) {
			Object o = Common.FormMap(formMap).get("FormMap");
			Object ly_table = null;
			if (null == o) {
				ly_table = EhcacheUtils.get("formMap_" + formMap.getClass().getSimpleName());
				if (null == ly_table)
					throw new SystemException("没有找到FormMap=XXXX的参数,XXXX是对应某表的FormMap实体类名称,注意：类名称大小写必须一致! 或者 没有传入表的FormMap实体类对象");
			} else {
				ly_table = EhcacheUtils.get("formMap_" + o.toString());
			}
			Common.FormMap(formMap).put("ly_table", ly_table.toString().split(",")[0]);
			Common.FormMap(formMap).put("ly_table_id", ly_table.toString().split(",")[1]);
			Common.FormMap(formMap).put("ly_base", "ly_base");
			Common.FormMap(formMap).put("mapper_id", mapper_id);
		}
	}

}
