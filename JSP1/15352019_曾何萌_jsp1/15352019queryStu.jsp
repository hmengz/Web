<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String msg="";
    String connectString = "jdbc:mysql://localhost:53306/teaching10" + "?autoReconnect=true&useUnicode=true" 
                            + "&characterEncoding=UTF-8"; 
	String  user="user";
	String  pwd="123";
    String query=request.getParameter("query");
    String like=request.getParameter("like");
    if(like==null) like="";
	StringBuilder table = new StringBuilder();
	try {
		Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(connectString, user, pwd);
        Statement stmt=con.createStatement();
        String sql;
        if(query==null)
            sql="select * from stu;";
        else 
            sql="select * from stu where num like \"%"+like+"%\" or name like \"%"+like+"%\" ORDER BY num;";
        ResultSet rs=stmt.executeQuery(sql);
        //构建表格
        table.append("<table><tr><th>id</th><th>学号</th><th>姓名</th>"+ "<th>-</th></tr>");
        while(rs.next()) {
                table.append(String.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s %s</td></tr>",
                                            rs.getString("id"),rs.getString("num"),rs.getString("name"), 
				        	                "<a href='15352019updateStu.jsp?pid="+rs.getString("id")+"'>修改</a>", 
				        	                "<a href='15352019deleteStu.jsp?pid="+rs.getString("id")+"'>删除</a>"));
		}
        table.append("</table>");
        rs.close();
        stmt.close();
        con.close();
        }catch (Exception e){
        	msg = e.getMessage();
        }
%>
<!DOCTYPE HTML>
<html>
<head>
<title>浏览学生名单</title>
<style> 
	table{border-collapse: collapse; border: none; width: 500px;} 
	td,th{border: solid grey 1px; margin: 0 0 0 0; padding: 5px 5px 5px 5px} 
	a:link,a:visited { color:blue }
	.container{ margin:0 auto; width:500px; text-align:center; } 
</style>
</head>
<body>
<div class="container">
	<h1>查询学生名单</h1>
    <form action="15352019queryStu.jsp?query=<%=like%>">
        <!-- 保留原来的查询值 value=like -->
        输入查询：<input type="text" name="like" value="<%=like%>">
        <input type="submit" name="query" value="查询">
    </form>
    <br> <br> <br>
	<%=table%>
	<div style="float:left">
		<a href="15352019addStu.jsp">新增</a>
    </div>
	<br><br>
	<%=msg%>
	<br><br>
</div>
</body>
</html>