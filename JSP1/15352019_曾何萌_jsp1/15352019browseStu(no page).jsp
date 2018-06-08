<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<% 	request.setCharacterEncoding("utf-8"); %>
<%! 
//查询所有学生，返回名单
	ArrayList<String> selectAll()
	{
			String msg ="";
			String connectString = "jdbc:mysql://localhost:53306/teaching10"
							+ "?autoReconnect=true&useUnicode=true"
							+ "&characterEncoding=UTF-8"; 
			//StringBuilder tableBulider=new StringBuilder("");
		  ArrayList<String> _table=new ArrayList<String>();
			try{
				//建立连接
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection(connectString, 
											"user", "123");
				//获取名单_table(三列：id，nm，name)
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select * from stu");
				while(rs.next()) {
								_table.add(rs.getString("id"));
								_table.add(rs.getString("num"));
								_table.add(rs.getString("name"));
				}
				//关闭连接
				rs.close();
				stmt.close();
				con.close();
			}
			catch (Exception e){
				msg = e.getMessage();
			}
			return _table;
	}
%>
<!DOCTYPE HTML>
<html>
<head>
	
<style type="text/css">
	h1{	text-align: center;	}
	table{border-collapse: collapse; }
	tr:first-child td{font-weight: bold;	}
	td{
		text-align: center;
		height: 30px;
	}
	#main{
		width: 500px;
		margin:0 auto;
	}
	#add{	margin-top: 50px;	}
</style>
<title>浏览学生名单</title>
</head>
<body>
  <div class="container">
	  <h1>浏览学生名单</h1>  
		<div id="main">
			<div>
				<table border="1" >
				<tr>
					<td width="100">id</td>
					<td width="200">学号</td>
					<td width="100">姓名</td>
					<td width="100">-</td>
				</tr>
				<%
				ArrayList<String> _table=selectAll();
				int	len=_table.size()/3;
				for(int i=0;i<len;i++){  %>
				<tr>
					<%for(int j=0;j<3;j++){	%>
					<td>
						<%=_table.get(3*i+j)%>
					</td>
					<%}%>
					<td>
						<a href="15352019updateStu.jsp?id=<%=_table.get(3*i)%>">修改</a>
						<a href="15352019deleteStu.jsp?id=<%=_table.get(3*i)%>">删除</a>
					</td>
				</tr>
				<%}%>
			</table>
			</div>
			<div id="add">
				<a href="15352019addStu.jsp" id="add">新增</a>
			</div>		
		</div>
<br><br>
  </div>
</body>
</html>
