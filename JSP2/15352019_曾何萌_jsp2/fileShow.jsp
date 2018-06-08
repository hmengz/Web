<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>upload file show</title>
</head>
<body>
	<p>文件上传</p>
	<form name="fileupload" action="fileUpload.jsp" method="POST"
	enctype="multipart/form-data">
		<p>名称： <input type="text" name="id" size=24 value="888"></p>
		<p>文件1： <input type="file" name="file1" size=50></p>
		<p><input type=submit name="submit" value="OK"></p>
	</form>
</body>
</html>

