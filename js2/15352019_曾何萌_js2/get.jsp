<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("sid");
	if(connect()){
	ResultSet rs=executeQuery("select * from stu where id="+id+";");
	String s=showStudents(rs);
	if(!s.equals("")){
		String[] arr=s.split(",");
		out.print("id:"+arr[0]+"<br>\n"+"num:"+arr[1]+"<br>\n"+"name:"+arr[2]+"<br>\n");
	}
	else{
		out.print("查无此人\n");
	}
}
	
%>
<%!
	Connection conn;
	// 建立连接
	boolean connect() {
		String connectString = "jdbc:mysql://172.18.187.230:53306/teaching1"
				+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8&&useSSL=false";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(connectString, "user", "123");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	

	ResultSet executeQuery(String sqlSentence) {
	     Statement stat;
	     ResultSet rs = null;
	        
	     try {
			stat = conn.createStatement();       //获取执行sql语句的对象
			rs = stat.executeQuery(sqlSentence); //执行sql查询，返回结果集
	     } catch (Exception e) {
		System.out.println(e.getMessage());
	     }
	     return rs;
	}

	//显示查询结果
	String showStudents(ResultSet rs){
		String ss="";
	    try {
	       if(rs.next()){
	          ss=rs.getString("id")+","+rs.getString("num")+","+rs.getString("name");		   
	       }else 
	       {
	    	   return ss+"nostu";
	       }
	    }
	    catch (Exception e) {
		System.out.println(e.getMessage());
	    }
	    return ss;
	}
%>
