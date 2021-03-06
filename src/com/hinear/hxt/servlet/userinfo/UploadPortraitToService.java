package com.hinear.hxt.servlet.userinfo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hinear.hxt.entity.UserInfo;

/**
 * 个人信息头像上传到服务器
 * Servlet implementation class UploadPortraitToService
 */
@WebServlet("/uploadPortraitToService")
public class UploadPortraitToService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String allowFileSuffix = "jpg,png,gif,jpeg";
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
		int sid = userInfo.getSID();
		String schoolDir = "school"+sid;
		String dir = "upload" + File.separator + schoolDir + File.separator + "userinfo";
		String basePath = this.getServletContext().getRealPath(dir);
		
		File tmpDir = new File(basePath);// 初始化上传文件的临时存放目录
		System.out.println("servicePath=" + basePath);
		JsonArray jsonArry = new JsonArray();
		//创建图片上传目录目录
		if (!tmpDir.exists()) {
			tmpDir.mkdirs();
		}
		
		// 检查输入请求是否为multipart表单数据。
		if (ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory dff = new DiskFileItemFactory();// 创建该对象
			dff.setRepository(tmpDir);// 指定上传文件的临时目录
			dff.setSizeThreshold(1024000);// 指定在内存中缓存数据大小,单位为byte
			ServletFileUpload sfu = new ServletFileUpload(dff);// 创建该对象
			sfu.setFileSizeMax(5000000);//指定单个上传文件的最大尺寸
//			sfu.setSizeMax(10000000);// 指定一次上传多个文件的总尺寸
			sfu.setHeaderEncoding("utf-8");
			String type = null;

			List<FileItem> fileItems = new ArrayList<FileItem>();
			try {
				fileItems = sfu.parseRequest(request);
			} catch (FileUploadException e1) {
				System.out.println("文件上传发生错误" + e1.getMessage());
			}
			String fullPath = null;
			String fileName = null;
			for (FileItem fileItem : fileItems) {

				// 判断该表单项是否是普通类型
				if (fileItem.isFormField()) {
					String name = fileItem.getFieldName();// 控件名
					String value = fileItem.getString();
					System.out.println("name="+name+" value="+value);

				} else {
					String filePath = fileItem.getName();
					if (filePath == null || filePath.trim().length() == 0)
						continue;
					fileName = filePath.substring(filePath.lastIndexOf(File.separator) + 1);
					String extName = filePath.substring(filePath.lastIndexOf(".") + 1);
					fullPath = basePath + File.separator + fileName;
					if (allowFileSuffix.indexOf(extName) != -1) {
						try {
							fileItem.write(new File(fullPath));
						} catch (Exception e) {
							e.printStackTrace();
						}

					} else {
						try {
							throw new FileUploadException("文件格式不正确");
						} catch (FileUploadException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			StringBuffer url = request.getRequestURL();
			String newurl = url.substring(0, url.lastIndexOf("/"));
			String imgeUrl = newurl + dir + File.separator + fileName; // http://localhost:8080/hxt/upload/schoolInfo/nanwanyry.jpg
			String relPath = dir + File.separator;
			JsonObject jsonObj = new JsonObject();
			jsonObj.addProperty("fileName", fileName);
			jsonObj.addProperty("fullPath", fullPath);
			jsonObj.addProperty("imgeUrl", imgeUrl);
			jsonObj.addProperty("relPath", relPath);
			jsonArry.add(jsonObj);
		}
		System.out.println(jsonArry.toString());
		response.getWriter().print(jsonArry);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
