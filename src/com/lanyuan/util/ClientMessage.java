package com.lanyuan.util;

import java.util.Map;
import java.util.concurrent.Callable;

/**
 * 处理用户操作设备的线程类
 * @author Yincoln
 *
 */
public class ClientMessage implements Callable<Map<String,Object>> {
	private String data;
	private ClientText clientText;
	
	public ClientMessage(String data, ClientText clientText){
		this.data = data;
		this.clientText = clientText;
	}
	
	@Override
	public Map<String,Object> call() throws Exception {
		Map<String,Object> map = null;
		try {
			clientText.send(data);
			map = clientText.read();
			
			/*if(map != null){
				result = "success"; //接收未超时
			}else{
				result = "fail"; //超时
			}	*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}


	
