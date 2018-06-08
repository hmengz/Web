<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("t1");
	String name=request.getParameter("t2");
	if(connect()){
		boolean r = executeUpdate("update stu set name='"+name+"' where id="+id+";");
	}
%>
<%!
	Connection conn;
	boolean connect() {
		String connectString = "jdbc:mysql://172.18.187.233:53306/teaching"
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
	boolean executeUpdate(String sqlSentence) {
	     Statement stat;
	     boolean a;
	     boolean rs;
	     try {
			stat = conn.createStatement();      
			a = stat.execute(sqlSentence); 
			rs=true;
	     } catch (Exception e) {
	    	 System.out.println(e.getMessage());
	    	 rs=false;
	     }
	     return rs;
	}
	ResultSet executeQuery(String sqlSentence) {
	     Statement stat;
	     ResultSet rs = null;
	     try {
				stat = conn.createStatement();       
				rs = stat.executeQuery(sqlSentence); 
			     } catch (Exception e) {
				System.out.println(e.getMessage());
	     }
	     return rs;
	}
%>



