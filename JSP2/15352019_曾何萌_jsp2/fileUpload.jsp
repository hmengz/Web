<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*,org.apache.commons.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>upload file succeed</title>
</head>

<body>
<%request.setCharacterEncoding("utf-8");%>
<% 
boolean isMultipart = ServletFileUpload.isMultipartContent(request);//检查表单中是否包含文件
String file_id="";
String file_Name="";
String file_id_Name="";
if (isMultipart) {
	
	FileItemFactory factory = new DiskFileItemFactory();
	//factory.setSizeThreshold(yourMaxMemorySize); //设置使用的内存最大值
	//factory.setRepository(yourTempDirectory); //设置文件临时目录
	ServletFileUpload upload = new ServletFileUpload(factory);
	//upload.setSizeMax(yourMaxRequestSize); //允许的最大文件尺寸
	List items = upload.parseRequest(request);
	for (int i = 0; i < items.size(); i++) {
		FileItem fi = (FileItem) items.get(i);
		if (fi.isFormField()) {//如果是表单字段
			//out.print(fi.getFieldName()+":"+fi.getString("utf-8"));
			if(fi.getFieldName().equals("id"))	
				file_id+=fi.getString("utf-8");
		}
		else {//如果是文件
			DiskFileItem dfi = (DiskFileItem) fi;
			if (!dfi.getName().trim().equals("")) {   //getName()返回文件名称或空串
				file_Name+=FilenameUtils.getName(dfi.getName());
				file_id_Name=file_id+"_"+file_Name;
				String fileName=application.getRealPath("/file")+ System.getProperty("file.separator")+file_id_Name;	
				out.print("文件被上传到服务上的实际位置： ");
				out.print(new File(fileName).getAbsolutePath());
				dfi.write(new File(fileName));
				} //if
		} //if
	} //for
} //if 

%>
<p><a href="file/<%=file_id_Name%>" ><%=file_id%> <%=file_Name%></a></p>
</body>
</html>