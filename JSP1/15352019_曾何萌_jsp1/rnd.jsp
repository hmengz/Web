<%@ page import="java.util.*,java.io.*" contentType="text/html;charset=utf-8" %>  
   
<!DOCTYPE>  
<html>  
  <head>  
    <title>40个随机数</title>  
  </head>  
  <h1>
  	40个随机数
  </h1>
  <body>  
    <%   
        Random rnd= new Random(50);
        for(int i=0;i<40;i++)
        {
          int n= rnd.nextInt(1000);
          out.print(n+"         "); 
        }      
    %>  
  </body>  
</html>  

