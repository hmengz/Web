<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%! int i = 0; %>
<%request.setCharacterEncoding("utf-8");
	String id="";
	String name = "";
	String password = "";
	String campus = "";
	String grade = "";
	String club = "";
	String instruct = "";
	if(request.getMethod().equalsIgnoreCase("request")){
		i++;
		if(i > Integer.MAX_VALUE)
			i = 0;
		id = String.valueOf(i);// id唯一
	}else if(request.getMethod().equalsIgnoreCase("post")){  //保留原网页内容
		id = request.getParameter("id");
		name = request.getParameter("name");
		password = request.getParameter("password");
		campus = request.getParameter("campus");
		grade = request.getParameter("grade");
		club = Arrays.toString(request.getParameterValues("club"));
		instruct = request.getParameter("instruct");
		if(request.getParameter("submit") != null){  
			name += "*";
			instruct += "*";
		} else if(request.getParameter("exit") != null){  
			response.sendRedirect("http://172.18.187.11/main.htm");
		}
	}
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>用户注册</title>
    <style> 
		label{ vertical-align:top; }
		textarea { height: 200px; width: 300px; }
    </style>
  </head>  
  <body>
    <form action="register3.jsp" method="post">
		<input name="id" type="hidden" value="<%=id%>">
		<p>同学名：<input name="name" type="text" value="<%=name%>"></p>
		<p>密码：<input name="password" type="password" value="<%=password%>"></p>
		<p>校区：
			<input name="campus" type="radio" value="south" <%=campus.equals("south") ? "checked" : ""%> >南校区
			<input name="campus" type="radio" value="east" <%=campus.equals("east") ? "checked" : ""%> >东校区
			<input name="campus" type="radio" value="north" <%=campus.equals("north") ? "checked" : ""%> >北校区
			<input name="campus" type="radio" value="zhuhai" <%=campus.equals("zhuhai") ? "checked" : ""%> >珠海校区
			<input name="campus" type="radio" value="shenzhen" <%=campus.equals("shenzhen") ? "checked" : ""%> >深圳校区
		</p>
		<p>年级：<select name="grade">
			<option value="freshman" <%=grade.equals("freshman") ? "selected" : ""%> >大学一年级</option>
			<option value="sophomore" <%=grade.equals("sophomore") ? "selected" : ""%> >大学二年级</option>
			<option value="junior" <%=grade.equals("junior") ? "selected" : ""%> >大学三年级</option>
			<option value="senior" <%=grade.equals("senior") ? "selected" : ""%> >大学四年级</option>
		</select></p>
		<p>社团：
			<input name="club" type="checkbox" value="dance" <%=club.indexOf("dance") >= 0 ? "checked" : ""%> >舞蹈队
			<input name="club" type="checkbox" value="photo" <%=club.indexOf("photo") >= 0 ? "checked" : ""%> >摄影
			<input name="club" type="checkbox" value="basketball" <%=club.indexOf("basketball") >= 0 ? "checked" : ""%> >篮球
		</p>
		<p>
			<label id="instruct">说明：</label>
			<textarea name="instruct"><%=instruct%></textarea>
		</p>
		<p>
			<input name="submit" type="submit" value="保存">
			<input name="exit" type="submit" value="退出">
		</p>
    </form>
  </body>
</html>