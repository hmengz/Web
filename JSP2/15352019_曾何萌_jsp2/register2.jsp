<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE HTML>
<html>
<head>
	<title>用户注册输入显示</title>
</head>  
<body>
	<p>id：<%=request.getParameter("id")%></p>
	<p>同学名：<%=request.getParameter("name")%></p>
	<p>密码：<%=request.getParameter("password")%></p>
	<p>校区：<%=request.getParameter("campus")%></p>
	<p>社团：<%=Arrays.toString(request.getParameterValues("club"))%></p>
	<p>年级：<%=request.getParameter("grade")%></p>
	<p>说明：<%=request.getParameter("instruct")%></p>
	<p>submit1：<%=request.getParameter("submit")%></p>
	<p>submit2：<%=request.getParameter("exit")%></p>
</body>
</html>
