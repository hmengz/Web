<%@ page language="java" import="java.util.*,java.sql.*"
contentType="text/html; charset=utf-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String msg = "";
    String connectString = "jdbc:mysql://localhost:53306/teaching10"
                            + "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String user="user"; String pwd="123";
    //修改前的信息
    String id=request.getParameter("id");
	String name=request.getParameter("name");
	String num=request.getParameter("num");
	String save=request.getParameter("save");
	String clear=request.getParameter("clear");
    
    if(request.getMethod().equalsIgnoreCase("post")){
        if(save!=null){
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(connectString,user, pwd);
            Statement stmt = con.createStatement();
            try{ 
            int cnt =stmt.executeUpdate("update stu set num='"+num+"',name='"+name+"' where id="+id+";");
            if(cnt>0)msg = "修改成功!";
                stmt.close(); con.close();
            }catch (Exception e){
                msg = e.getMessage();
            }
        }else if(clear!=null){
            name="";
            num="";
        }	
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
    <h1>修改学生记录</h1>
    <form action="15352019updateStu.jsp?id=<%=id%>" method="post" name="f">    学号:<input id="num" name="num" type="text" > <br> <br>
    姓名:<input id="name" type="text" name="name" >  <br>  <br>
    <input type="submit" name="save" value="保存">
    <input type="submit" name="clear" value="清空">
    </form>
    <%=msg%> <br>  <br>
    <a href='15352019browseStu.jsp'>返回</a>
    </div>
    </body>
    </html>
