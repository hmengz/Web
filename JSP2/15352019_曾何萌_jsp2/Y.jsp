<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GB2312" 
contentType="text/html;charset=GB2312"%>
<%
	 session = request.getSession(true);
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>Session Y</title>
</head>
<body>
  <h1>Session Y</h1>
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
  	<a href="X.jsp">X.jsp</a><br>
  	<a href="Z.jsp">Z.jsp</a>
  </p>

</body>
</html>