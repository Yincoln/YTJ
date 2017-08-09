package com.lanyuan.controller.system;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.DictionaryFormMap;
import com.lanyuan.exception.SystemException;
import com.lanyuan.service.DicService;
import com.lanyuan.util.Common;

/**
 * 
 * @author lanyuan 2014-11-19
 * @Email mmm333zzz520@163.com
 * @version 4.1v
 */
@Controller
@RequestMapping("/system/dictionary")
public class DictionaryController extends BaseController {

	@Inject
	private DicService dicService;
	
	@ResponseBody
	@RequestMapping("/addEntity")
	@SystemLog(module="系统管理",methods="字典管理-新增字典")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		try {
			DictionaryFormMap dictionaryFormMap = getFormMap(DictionaryFormMap.class);
			dicService.addEntity(dictionaryFormMap);
			List<DictionaryFormMap> dics = new ArrayList<DictionaryFormMap>();
			String[] childCode = getParaValues("childCode");
			String[] childValue = getParaValues("childValue");
			for (int i = 0; i < childCode.length; i++) {
				DictionaryFormMap formMap = new DictionaryFormMap();
				formMap.put("code", childCode[i]);
				formMap.put("value", childValue[i]);
				formMap.put("parent_code", dictionaryFormMap.get("code"));
				dics.add(formMap);
			}
			dicService.batchSave(dics);
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}
		return "success";
	}

	@RequestMapping("/editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			DictionaryFormMap dictionaryFormMap=dicService.findbyFrist("id", id,DictionaryFormMap.class);
			model.addAttribute("dictionary",dictionaryFormMap );
			DictionaryFormMap formMap = new DictionaryFormMap();
			formMap.put("parent_code", dictionaryFormMap.get("code"));
			model.addAttribute("dicChild", dicService.findByNames(formMap));
		}
		return Common.BACKGROUND_PATH + "/system/dictionary/edit";
	}

	@ResponseBody
	@RequestMapping("/editEntity")
	@SystemLog(module="系统管理",methods="字典管理-修改字典")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		try {
			DictionaryFormMap dictionaryFormMap = getFormMap(DictionaryFormMap.class);
			dicService.editEntity(dictionaryFormMap);
			String[] childCode = getParaValues("childCode");
			String[] childValue = getParaValues("childValue");
			List<DictionaryFormMap> dics = new ArrayList<DictionaryFormMap>();
			dicService.deleteByAttribute("parent_code", dictionaryFormMap.get("code")+"",DictionaryFormMap.class);
			for (int i = 0; i < childCode.length; i++) {
				DictionaryFormMap formMap = new DictionaryFormMap();
				formMap.put("code", childCode[i]);
				formMap.put("value", childValue[i]);
				formMap.put("parent_code", dictionaryFormMap.get("code"));
				dics.add(formMap);
			}
			if(dics.size()>0)
				dicService.batchSave(dics);
		} catch (Exception e) {
			//try catch 必须抛出自定义异常,否则事务失效!   #### lanyuan ####
			String results = "{\"results\":\"error\",\"message\":\""+e+"\"}";
			throw new SystemException(results);
		}
		return "success";
	}
}