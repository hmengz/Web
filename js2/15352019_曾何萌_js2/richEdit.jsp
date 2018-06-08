<%@ page language="java" import="java.util.*,java.io.*"
contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Rich Text Editing</title>
	<script type="text/javascript">	
		function italic() {
			document.execCommand("italic", false, null);
		}
		function color(){
			document.execCommand("forecolor", false, "red");
		}
		function picture(){
			document.execCommand("insertimage",false,"images/home.gif");
		}
		function _size(){
			document.execCommand("fontsize", false,7);
		}
		function link() {
			document.execCommand("createlink",false,null);
		}
		function undo(){
			var old=document.getElementById("richedit").innerText;
			document.getElementById("richedit").innerText=old;
		}
		function code(){
			var o = document.getElementById("richedit");
			alert(o.innerHTML);
		}
	</script>
</head>
<body>
	<div id="richedit" contenteditable="true" style="padding: 10px;width: 400px;height: 200px;border: solid 1px black; ">
	</div>
	<div style="margin-top: 20px;">
		<input type="button" value="斜体" onclick="italic()">
		<input type="button" value="颜色" onclick="color()">
		<input type="button" value="字号" onclick="_size()">
		<input type="button" value="图像" onclick="picture()">
		<input type="button" value="链接" onclick="link()">
		<input type="button" value="撤销" onclick="undo()">
		<input type="button" value="代码" onclick="code()">
	</div>
</body>
</html>