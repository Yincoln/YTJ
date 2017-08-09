package com.lanyuan.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.ConfigFormMap;
import com.lanyuan.exception.ParameterException;
import com.lanyuan.plugin.PageView;
import com.lanyuan.service.ConfigService;
import com.lanyuan.util.Common;
/**
 * 
 * @author lanyuan 2014-11-19
 * @Email mmm333zzz520@163.com
 * @version 4.1v
 */
@Controller
@RequestMapping("/system/config")
public class ConfigController extends BaseController {
	@Inject
	private ConfigService configService;
	
	@RequestMapping("/page")
	@ResponseBody
	public PageView byPage() throws Exception {
		ConfigFormMap formMap = findHasHMap(ConfigFormMap.class);
		if(Common.isEmpty(formMap.getStr("code"))){
			throw new ParameterException("参数异常！url地址上没有找到code参数！");
		}else{
			//需要开启缓存
			ConfigFormMap configFormMap = new ConfigFormMap();
			configFormMap=configService.findbyFrist("code", formMap.getStr("code"),ConfigFormMap.class);
			
			PageView pageView = getPageView(formMap);
			if(null==configFormMap||configFormMap.size()==0){
				return pageView;
			}else{
				formMap.put("mapper_id","ConfigMapper.dynamic_sql");
				formMap.put("last_time", new Date().getTime());
				formMap.put("query_sql",configFormMap.getStr("query_sql"));
				formMap.put("paging", pageView);
				pageView.setRecords(configService.findByPage(formMap));
				return pageView;
			}
		}
		
	}
	
	@RequestMapping("/devconfig")
	public String devconfig(Model model) throws Exception {
		return Common.BACKGROUND_PATH+"/system/config/devconfig";
	}
	
	@RequestMapping("/{code}/public")
	public String publicc(Model model,@PathVariable String code,HttpServletRequest request) throws Exception {
		if(Common.isEmpty(code))
			return "url地址: /system/config/{code}/public 中，code 必须填！";	
		ConfigFormMap configFormMap = findHasHMap(ConfigFormMap.class);
		configFormMap=configService.findbyFrist("code", code,ConfigFormMap.class);
		model.addAllAttributes(configFormMap);
		model.addAttribute("res", findByRes(request));
		return Common.BACKGROUND_PATH+"/system/config/public";
	}
	
	@ResponseBody
	@RequestMapping("/find_feild")
	public List<String> dynamic_sql(){
		ConfigFormMap configFormMap = findHasHMap(ConfigFormMap.class);
		configFormMap.put("mapper_id", "ConfigMapper.find_feild");
		configFormMap.put("last_time", new Date().getTime());
		configFormMap.put("$orderby"," limit 1");
		List<ConfigFormMap> ls = configService.findByNames(configFormMap);
		List<String> key = new ArrayList<String>();
		if(null!=ls&&ls.size()>0){
			configFormMap=ls.get(0);
			for (Map.Entry<String, Object> entry : configFormMap.entrySet()) {  
				key.add(entry.getKey());
			}  
		}
		return key;
	}

}