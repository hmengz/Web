<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GB2312" 
contentType="text/html;charset=GB2312"%>
<%
	 session = request.getSession(true);
	 session.setAttribute("移动Web应用设计", new Date());
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>Session X</title>
</head>
<body>
  <h1>Session X</h1>  
  <p>
<%	
	String id=session.getId();  
	out.println("SESSION ID: "+id+"<br>");
	Enumeration enums=session.getAttributeNames();
	while(enums.hasMoreElements()){
		String name=(String)enums.nextElement();
		out.println(name+" ---- "+session.getAttribute(name)+"<br />");
	}
%></p>
  <p>
  	<a href="Y.jsp">Y.jsp</a><br>
  	<a href="Z.jsp">Z.jsp</a>
  </p>
</body>
</html>
