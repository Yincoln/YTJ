package com.lanyuan.controller.system;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lanyuan.annotation.SystemLog;
import com.lanyuan.controller.index.BaseController;
import com.lanyuan.entity.ResFormMap;
import com.lanyuan.entity.UploadFileFormMap;
import com.lanyuan.exception.SystemException;
import com.lanyuan.plugin.PageView;
import com.lanyuan.service.UploadFileService;
import com.lanyuan.util.Common;

/**
 * 
 * @author Yincoln 2017-07-4
 * @Email:
 * @version
 */
@Controller
@RequestMapping("/system/file/")
public class UploadFileController extends BaseController {
	@Inject
	private UploadFileService uploadFileService;

	@RequestMapping("findByPage")
	@ResponseBody
	public PageView findByPage() throws Exception {
		UploadFileFormMap formMap = getFormMap(UploadFileFormMap.class);
		int resId = Integer.parseInt(formMap.getStr("resId"));

		formMap.put("contentType", getContentTypeByResId(resId));
		PageView pageView = getPageView(formMap);
		formMap.put("paging", pageView);
		pageView.setRecords(uploadFileService.findByPage(formMap));
		return pageView;
	}

	@ResponseBody
	@RequestMapping("addEntity")
	@SystemLog(module = "系统管理", methods = "文件管理-新增文件")
	// 凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String addEntity(@RequestParam(value = "file") MultipartFile file,
			HttpServletRequest request) {
		// 当前登录用户的accountName
		String accountName = Common.findUserSessionAccountName();
		// 上传文件的url
		String uploadDir = request.getSession().getServletContext()
				.getRealPath("/resources");
		if (uploadDir == null) {
			uploadDir = new File("src/main/webapp/resources").getAbsolutePath();
		}
		uploadDir += "/" + accountName + "/";
		// Create the directory if it doesn't exist
		File dirPath1 = new File(uploadDir);
		if (!dirPath1.exists()) {
			dirPath1.mkdirs();
		}

		// 根据页面id获取上传文件类型
		int resId = Integer.parseInt(request.getParameter("resId"));
		String contentType = null;
		try {
			contentType = getContentTypeByResId(resId);
			uploadDir += contentType + "/";
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		// Create the directory if it doesn't exist
		File dirPath = new File(uploadDir);

		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}

		try {
			// 需要增加文件已存在等处理方法
			file.transferTo(new File(uploadDir + file.getOriginalFilename()));
		} catch (IllegalStateException e1) {
			System.out.println("illegal");
			e1.printStackTrace();
		} catch (IOException e1) {
			System.out.println("ioexception");
			e1.printStackTrace();
		}

		// 将文件信息保存到数据库
		UploadFileFormMap uploadFileFormMap = new UploadFileFormMap();
		String friendlyname = request.getParameter("friendlyname");
		String description = request.getParameter("description");

		uploadFileFormMap.put("user", accountName);
		uploadFileFormMap.put("friendlyname", friendlyname);
		uploadFileFormMap.put("description", description);
		uploadFileFormMap.put("filename", file.getOriginalFilename());
		uploadFileFormMap.put("contentType", contentType);
		uploadFileFormMap.put("location", dirPath.getAbsolutePath() + "\\"
				+ file.getOriginalFilename());
		String link = request.getContextPath() + "/resources" + "/"
				+ accountName + "/" + contentType + "/";
		uploadFileFormMap.put("link", link + file.getOriginalFilename());

		try {
			uploadFileService.addEntity(uploadFileFormMap);
		} catch (Exception e) {
			String results = "{\"results\":\"error\",\"message\":\"" + e
					+ "\"}";
			throw new SystemException(results);
		}
		return "success";
	}

	@ResponseBody
	@RequestMapping("editEntity")
	@SystemLog(module = "系统管理", methods = "文件管理-修改文件")
	// 凡需要处理业务逻辑的.都需要记录操作日志
	@Transactional
	public String editEntity() throws Exception {
		UploadFileFormMap uploadFileFormMap = getFormMap(UploadFileFormMap.class);
		uploadFileFormMap.put("mapper_id", "UploadFileFormMap.updateById");
		uploadFileService.editEntity(uploadFileFormMap);
		return "success";
	}

	@ResponseBody
	@RequestMapping("download")
	public String download(HttpServletResponse response) {
		try {
			UploadFileFormMap uploadFileFormMap = getFormMap(UploadFileFormMap.class);
			
			uploadFileFormMap = uploadFileService.findById(uploadFileFormMap);
			String fileName = uploadFileFormMap.getStr("filename");
			String location = uploadFileFormMap.getStr("location");
			// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
			response.setContentType("multipart/form-data");
			// 2.设置文件头：最后一个参数是设置下载文件名(假如我们叫a.pdf)
			response.setHeader("Content-Disposition", "attachment;fileName="
					+ new String(fileName.getBytes("UTF-8"), "iso-8859-1"));
			response.setHeader("filename",
					new String(fileName.getBytes("UTF-8"), "iso-8859-1"));
			ServletOutputStream out;
			// 通过文件路径获得File对象(假如此路径中有一个download.pdf文件)
			File file = new File(location);
			try {
				FileInputStream inputStream = new FileInputStream(file);

				// 3.通过response获取ServletOutputStream对象(out)
				out = response.getOutputStream();

				int b = 0;
				byte[] buffer = new byte[512];
				while (b != -1) {
					b = inputStream.read(buffer);
					// 4.写到输出流(out)中
					out.write(buffer, 0, b);
				}
				inputStream.close();
				out.close();
				out.flush();
				return "success";
			} catch (IOException e) {
				e.printStackTrace();
				response.setHeader("downstate", "failed");
				return "fail";
			}
		} catch (Exception e) {
			response.setHeader("downstate", "failed");
			return "fail";
		}
	}
	
	@RequestMapping("selectDevice")
	public String selectDevice(Model model) throws Exception{
		UploadFileFormMap upload = getFormMap(UploadFileFormMap.class);
    	model.addAttribute("list",uploadFileService.findUserDevicesStrByPlayerId());
    	model.addAttribute("id", upload.get("id"));
    	return Common.BACKGROUND_PATH + findUrl()[0] + "/selectDevice";
	}

	/**
	 * 根据页面id获取页面名称
	 * 
	 * @param resId
	 * @return contentType
	 * @throws Exception
	 */
	public String getContentTypeByResId(int resId) throws Exception {
		ResFormMap resFormMap = new ResFormMap();
		resFormMap.put("id", resId);
		resFormMap = uploadFileService.findById(resFormMap);
		String resKey = resFormMap.getStr("resKey");
		// 由页面名称确定查找文件的类型
		String contentType = null;
		if (resKey.equals("audio"))
			contentType = "music";
		else
			contentType = "broadcast";
		return contentType;
	}
}