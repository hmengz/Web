<%@ page language="java" import="java.util.*,java.sql.*"
contentType="text/html; charset=utf-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String msg = "";
    String connectString = "jdbc:mysql://localhost:53306/teaching10"
                            + "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String user="user"; String pwd="123";
    String num = request.getParameter("num");
    String name = request.getParameter("name");
    if(request.getMethod().equalsIgnoreCase("post")){
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(connectString,user, pwd);
        Statement stmt = con.createStatement();
        try{ String fmt="insert into stu(num,name) values('%s', '%s')";
        String sql = String.format(fmt,num,name);
        int cnt = stmt.executeUpdate(sql);
        if(cnt>0)msg = "保存成功!";
            stmt.close(); con.close();
        }catch (Exception e){
            msg = e.getMessage();
        }
    }
%>

<!DOCTYPE HTML><html><head><title>新增学生记录</title>
    <style> a:link,a:visited {color:blue;}
    .container{
    margin:0 auto;
    width:200px;
    text-align:center;
    }
    </style>
    </head><body>
    <div class="container">
    <h1>新增学生记录</h1>
    <form action="15352019addStu.jsp" method="post" name="f">
    学号:<input id="num" name="num" type="text" > <br> <br>
    姓名:<input id="name" type="text" name="name" >  <br>  <br>
    <input type="submit" name="sub" value="保存">
    </form>
    <%=msg%> <br>  <br>
    <a href='15352019browseStu.jsp'>返回</a>
    </div>
    </body>
    </html>
