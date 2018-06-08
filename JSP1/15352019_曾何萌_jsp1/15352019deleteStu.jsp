<%@ page language="java" import="java.util.*,java.sql.*"
contentType="text/html; charset=utf-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String msg = "";
    String connectString = "jdbc:mysql://localhost:53306/teaching10"
                            + "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String user="user"; String pwd="123";
    String id=request.getParameter("id"); 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(connectString,user, pwd);
    Statement stmt = con.createStatement();
    try{ 
        int cnt =stmt.executeUpdate("delete from stu where id="+id+";");
         if(cnt>0)msg = "删除成功!";
          stmt.close(); con.close();
        }catch (Exception e){
          msg = e.getMessage();
    }
%>
<!DOCTYPE HTML><html><head><title>修改学生记录</title>
    <style> a:link,a:visited {color:blue;}
    .container{
    margin:0 auto;
    width:200px;
    text-align:center;
    }
    </style>
    </head><body>
    <div class="container">
    <h1>删除学生记录</h1>
    <%=msg%> <br>  <br>
    <a href='15352019browseStu.jsp'>返回</a>
    </div>
    </body>
    </html>
