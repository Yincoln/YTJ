package com.lanyuan.util;
import java.io.*;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Map;

public class ClientText {

	public Socket client_s;
	public OutputStream os;
	public InputStream is;
	public BufferedReader reader;

	public ClientText(String ip,int port) {
		try {
			client_s = new Socket(ip, port);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException c) {
			c.printStackTrace();
		}
	}

	// 拼接两个字节数组
	public static byte[] addBytes(byte[] data1, byte[] data2) {
		byte[] data3 = new byte[data1.length + data2.length];
		System.arraycopy(data1, 0, data3, 0, data1.length);
		System.arraycopy(data2, 0, data3, data1.length, data2.length);
		return data3;
	}

	// 发送数据，会自动将data 转换成 JSON 并在前面添加长度信息
	public void send(String data) throws Exception {
		// 将data字符串转为字节数组
		byte[] resource = data.getBytes("utf-8");
		int len = resource.length;
		// 在传输的json数据前添加两个字符，第一个字节是低8位，第二个字节为高8位
		byte[] b1 = { (byte) (len & 0xff), (byte) ((len >> 8) & 0xff) };
		resource = addBytes(b1, resource);
		try {
			os = client_s.getOutputStream();
			os.write(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// Map<String,Object>
	public Map<String, Object> read(){
		Map<String, Object> map = null;
		// InputStreamReader是字节流到字符流
		// client_s.getInputStream()从Socket取得输入串流
		try {
			is = client_s.getInputStream();
			InputStreamReader streamReader = new InputStreamReader(is);
			// BufferedReader从字符输入流中读取文本，缓冲各个字符，从而实现字符、数组和行的高效读取
			// 链接数据串流，建立BufferedReader来读取，将BufferReader链接到InputStreamReder
			reader = new BufferedReader(streamReader);		
		} catch (IOException e) {
			e.printStackTrace();
		}

		try {
			//设置客户端超时间为2秒
			client_s.setSoTimeout(2*1000);
			// 接收服务器的消息
			String msg;
			try {
				msg = reader.readLine();
				// 前两个字符为长度信息，截取后面的数据信息
				msg = msg.substring(2);
				map = JsonUtils.parseJSONMap(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (SocketException e) {
			e.printStackTrace();
			//客户端接受超时，返回空
		}
		return map;
	}

	public void close() throws IOException{
		reader.close();
		is.close();
		os.close();
		client_s.close();
	}
	
	
	//测试
	public static void main(String[] args) throws Exception {
		ClientText myclient = new ClientText("112.74.216.117",9200);
		System.out.println("Socket: "+myclient.client_s);
		String data = "{\"pro\":10001,\"passwd\":\"a\",\"key\":\"a\"}";
		myclient.send(data);
		Map<String,Object> map = myclient.read();//socket已经关闭
		System.out.println("-------------------10001用户登录返回json信息------------------");
		for (String key : map.keySet()) {
	        System.out.println("key= " + key + " and value= " + map.get(key));
	    }
		
		int pid=Integer.parseInt(map.get("pid").toString());
		String url=(String)map.get("url");
		String[] ipPort = url.split(":");
		myclient = new ClientText(ipPort[0],Integer.parseInt(ipPort[1]));
		//myclient = new ClientText("112.74.216.117",9100);
		System.out.println("Socket: "+myclient.client_s);
		String data1 = "{\"pro\":10002,\"pid\":12}";
		myclient.send(data1);
		Map<String,Object> map1=myclient.read();
		System.out.println("-------------------10002用户连接网关返回json信息------------------");
		for (String key : map1.keySet()) {
	        System.out.println("key= " + key + " and value= " + map1.get(key));
	    }
		
		/*@SuppressWarnings("unchecked")
		ArrayList<HashMap<String,String>> list = (ArrayList<HashMap<String,String>>)map1.get("list");

		for(int i = 0;i < list.size(); i++){
			System.out.println(list.get(i).get("uuid"));
			
		}*/
		//重新创建套接字
		//myclient = new ClientText(ipPort[0],Integer.parseInt(ipPort[1]));
		/*System.out.println("\n Socket: "+myclient.client_s);
		String data2 = "{\"pro\":10010,\"uuidkey\":\"AIOM12345678\"}";
		myclient.send(data2);
		System.out.println("-------------------10010用户获取设备状态返回json信息------------------");
		Map<String,Object> map2=myclient.read();
		for (String key : map2.keySet()) {
	        System.out.println("key= " + key + " and value= " + map2.get(key));
	    }*/
		System.out.println("----------socket未关闭-----------");
		//myclient = new ClientText(ipPort[0],Integer.parseInt(ipPort[1]));
		System.out.println("Socket: "+myclient.client_s);
		String data3 = "{\"uuidkey\":\"AIOM12345678\",\"list\":[{\"statusname\":\"LED1_Status\",\"status\":1,\"flag\":1}],\"pid\":12,\"pro\":10004,\"did\":6}";
		myclient.send(data3);
		Map<String,Object> map3 = myclient.read();
		if(map3 != null){
			System.out.println("-------------------10004用户开灯返回json信息------------------");
			for (String key : map3.keySet()) {
		        System.out.println("key= " + key + " and value= " + map3.get(key));
		    }
		}else
			System.out.println("获取数据超时");
		//{"pro":10004,"did":6,"uuidkey":"AIOM12345678","list":[{"flag":1,"statusname":"Play_Broadcast","status":0}],"pid":4}
		String data4="{\"uuidkey\":\"AIOM12345678\",\"list\":[{\"statusname\":\"Play_Music\",\"status\":0,\"flag\":2}],\"pid\":12,\"pro\":10004,\"did\":6}";
		myclient.send(data4);
		Map<String,Object> map4 = myclient.read();
		if(map4 != null){
			System.out.println("-------------------10004用户播放返回json信息------------------");
			for (String key : map4.keySet()) {
		        System.out.println("key= " + key + " and value= " + map4.get(key));
		    }
		}else
			System.out.println("获取数据超时");
	}
}
