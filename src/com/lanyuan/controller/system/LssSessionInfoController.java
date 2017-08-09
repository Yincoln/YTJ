package com.lanyuan.controller.system;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.LssSessionInfo;
import com.lanyuan.plugin.PageView;
import com.lanyuan.service.LssSessionService;
import com.lanyuan.util.Common;
import com.baidubce.BceClientConfiguration;
import com.baidubce.BceServiceException;
import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.lss.LssClient;
import com.baidubce.services.lss.model.CreateSessionResponse;
import com.baidubce.services.lss.model.CreateStreamRequest;
import com.baidubce.services.lss.model.CreateStreamResponse;

/**
 * @author Yincoln 2017-08-02
 * @Email:
 * @version
 */
@Controller
@RequestMapping("/system/lssSession/")
public class LssSessionInfoController extends BaseController {
	private String ACCESS_KEY_ID = "57066deaba0e48e99e48548037322cba";
    private String SECRET_ACCESS_KEY = "d311003e23714da394e3ce67a3b6204b";
    private String ENDPOINT = "http://lss.bj.baidubce.com"; //域名
	
	@Inject
	private LssSessionService lssSessionService;
	
	/**
	 * 当前登录用户lssSession列表
	 */
	@RequestMapping("findByPage")
	@ResponseBody
	public PageView findByPage() throws Exception {
		LssSessionInfo formMap = getFormMap(LssSessionInfo.class);
		PageView pageView = getPageView(formMap);
		formMap.put("paging", pageView);
		pageView.setRecords(lssSessionService.findByPage(formMap));
		return pageView;
	}
	
	/**
	 * 由sessionId查找session信息
	 * @param sessionId
	 * @return hls rtmp
	 * @throws Exception
	 */

	public LssSessionInfo findBySessionId(String sessionId) throws Exception {
		//Map<String,String> map = new HashMap<String,String>();
		LssSessionInfo lssSessionInfo = new LssSessionInfo();
		lssSessionInfo.put("mapper_id", "LssSessionMapper.findBySessionId");
		lssSessionInfo.put("sessionId", sessionId);
		lssSessionInfo = lssSessionService.findById(lssSessionInfo);
		/*map.put("Hls", lssSessionInfo.getStr("hls"));
		map.put("Rtmp", lssSessionInfo.getStr("rtmp"));*/
		return lssSessionInfo;
	}
	
	@ResponseBody 
    @RequestMapping("createSession")
    public Map<String,String> createSession() throws Exception {
		try{
	    	Map<String,String> result = new HashMap<String,String>();
	        LssSessionInfo lssSessionInfo = getFormMap(LssSessionInfo.class);//user  streamname  description
	        
	        String streamName = lssSessionInfo.getStr("streamname");
	       
	        // 初始化一个LssClient
	        BceClientConfiguration config = new BceClientConfiguration();
			config.setCredentials(new DefaultBceCredentials(ACCESS_KEY_ID, SECRET_ACCESS_KEY));
			config.setEndpoint(ENDPOINT);
			LssClient lssClient = new LssClient(config);
			 
			CreateStreamRequest request1 = new CreateStreamRequest();
    		request1.withPlayDomain("play.jinsdom.com")    // yourPlayDomain是用户提前创建的播放域名
    		       .withApp("yitiji")                  // yourApp是用户自定义的app名称
    		       .withPublish(new CreateStreamRequest.PublishInfo().withPushStream(streamName)); // yourStream是用户自定义的Stream名称
    		CreateStreamResponse response = lssClient.createStream(request1); 
    		//response.getPublish().getPushStream();
    		lssSessionInfo.put("preset","lss.forward_only");
    		lssSessionInfo.put("notification",response.getNotification());
    		lssSessionInfo.put("recording",response.getRecording());
    		lssSessionInfo.put("region",response.getPublish().getRegion());
    		lssSessionInfo.put("push",response.getPublish().getPushUrl());
    		lssSessionInfo.put("sessionId",response.getSessionId());		
    		lssSessionInfo.put("status",response.getStatus());
    		lssSessionInfo.put("securityPolicy",response.getSecurityPolicy());  		
    		lssSessionInfo.put("createTime",response.getCreateTime()); 		
    		lssSessionInfo.put("rtmp",response.getPlay().getRtmpUrls().get("L0"));
    		lssSessionInfo.put("hls",response.getPlay().getHlsUrls().get("L0"));
    		//lsssessioninfo.setFlv(response.getPlay().getFlvUrls().get("L0"));
			if (lssSessionInfo.get("push") == null) {
				result.put("result", "failed");
	        	return result;   
		    }
		    if (lssSessionInfo.get("hls") == null) {
		    	result.put("result", "failed");
	        	return result;   
		    }
		    if (lssSessionInfo.get("rtmp") == null) {
		    	result.put("result", "failed");
	        	return result;  
		    }
       
	        //save database
	        lssSessionService.addEntity(lssSessionInfo);     
	        
	        result.put("result", "success");
	        result.put("SessionId", lssSessionInfo.getStr("sessionId"));
	        result.put("Push", lssSessionInfo.getStr("push"));
	        result.put("Hls", lssSessionInfo.getStr("hls"));
	        result.put("Rtmp", lssSessionInfo.getStr("rtmp"));	        
	        return result;        
    	}catch(BceServiceException e){
    		Map<String,String> result = new HashMap<String,String>();
    		result.put("result", "failed");
    		result.put("reason", e.getErrorMessage());
        	return result;
    	}catch(Exception e){
    		Map<String,String> result = new HashMap<String,String>();
    		result.put("result", "failed");
    		result.put("result", "other error");
        	return result;
    	}
    }
	
    @RequestMapping("selectSession")
	public String selectSession(Model model) throws Exception{
    	LssSessionInfo lssSessionInfo = getFormMap(LssSessionInfo.class);
    	lssSessionInfo.put("mapper_id", "LssSessionInfoMapper.findUserLssSession");
    	List<LssSessionInfo> list = lssSessionService.findByPage(lssSessionInfo);
    	model.addAttribute("list",list);
    	model.addAttribute("uuidKey", lssSessionInfo.get("uuidKey"));
    	return Common.BACKGROUND_PATH + findUrl()[0] + "/selectSession";
	}
    
    @RequestMapping("upstream")
	public String upstream(Model model) throws Exception{
    	LssSessionInfo lssSessionInfo = getFormMap(LssSessionInfo.class);
    	String uuidKey = lssSessionInfo.getStr("uuidKey");
    	String sessionId = lssSessionInfo.getStr("sessionId");
    	
    	lssSessionInfo = this.findBySessionId(sessionId);
    	String pushUrl = lssSessionInfo.getStr("push");//pushUrl
    	model.addAttribute("uuidKey", uuidKey);
    	model.addAttribute("sessionId",sessionId);
    	model.addAttribute("push",pushUrl);
    	return Common.BACKGROUND_PATH + findUrl()[0] + "/upstream";
	}
    
	public static void createPushSession(LssClient client, String description, String preset, String notification,String securityPolicy, String recording,LssSessionInfo lsssessioninfo) {
    	try{
    		CreateSessionResponse resp = client.createSession(description, preset, notification, securityPolicy, recording, null);
		    System.out.println("sessionId: " + resp.getSessionId());	    
		    System.out.println("preset: " + resp.getPreset());	    
		    System.out.println("description: " + resp.getDescription());	    
		    System.out.println("createTime: " + resp.getCreateTime());	   
		    System.out.println("notification: " + resp.getNotification());	    
		    System.out.println("status: " + resp.getStatus());	    
		    System.out.println("securityPolicy: " + resp.getSecurityPolicy());		   
		    System.out.println("recording: " + resp.getRecording());		   
		    if (resp.getPublish() != null) {
		        System.out.println("push url: " + resp.getPublish().getPushUrl());	        
		        System.out.println("region: " + resp.getPublish().getRegion());
		    }
		    if (resp.getPlay() != null && resp.getPlay().getHlsUrl() != null) {
		        System.out.println("hls url: " + resp.getPlay().getHlsUrl());
		    }
		    if (resp.getPlay() != null && resp.getPlay().getRtmpUrl() != null) {
		        System.out.println("rtmp url: " + resp.getPlay().getRtmpUrl());
		    }
    	}catch(Exception e){
        	return ;
    	}
	}
	public static void main(String[] args) {
		/*String ACCESS_KEY_ID = "57066deaba0e48e99e48548037322cba";
	    String SECRET_ACCESS_KEY = "d311003e23714da394e3ce67a3b6204b";
	    String ENDPOINT = "http://lss.bj.baidubce.com"; //域名
	    String description = "123";
	    LssSessionInfo lsssessioninfo = new LssSessionInfo();
		BceClientConfiguration config = new BceClientConfiguration();
		config.setCredentials(new DefaultBceCredentials(ACCESS_KEY_ID, SECRET_ACCESS_KEY));
		 
		config.setEndpoint(ENDPOINT);
		LssClient client = new LssClient(config);
		 
		createPushSession(client,description,"live.rtmp_hls_forward_only",null,null,null,lsssessioninfo);*/
		
	}
}