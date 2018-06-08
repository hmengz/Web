<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%! int i = 0; //全局变量 %>
<%
	if(i > Integer.MAX_VALUE)
		i = 0;
	i++;  // 计数
	String id = String.valueOf(i);
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户注册</title>
  </head>  
  <body>
    <form action="register2.jsp" method="post" >
    	<input name="id" type="hidden" value="<%=id%>">
		<p>同学名：<input name="name" type="text" ></p>
		<p>密码：<input name="password" type="password" value=""></p>
		<p>校区：
			<input name="campus" type="radio" value="south">南校区
			<input name="campus" type="radio" value="east">东校区
			<input name="campus" type="radio" value="north">北校区
			<input name="campus" type="radio" value="zhuhai">珠海校区
			<input name="campus" type="radio" value="shenzhen">深圳校区
		</p>
		<p>年级：<select name="grade">
			<option value="freshman">大学一年级</option>
			<option value="sophomore">大学二年级</option>
			<option value="junior">大学三年级</option>
			<option value="senior">大学四年级</option>
		</select></p>
		<p>社团：
			<input name="club" type="checkbox" value="dance">舞蹈队
			<input name="club" type="checkbox" value="photo">摄影
			<input name="club" type="checkbox" value="basketball">篮球
		</p>
		<p>
			<label id="instruct">说明：</label>
			<textarea name="instruct"></textarea>
		</p>
		<p>
			<input name="submit" type="submit" value="保存">
			<input name="exit" type="submit" value="退出">
		</p> 
    </form>
    <!-- 实现表单无刷新提交数据 -->
   
  </body>
</html>