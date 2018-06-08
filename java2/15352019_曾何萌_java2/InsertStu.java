import java.util.*;
import java.sql.*;
public class InsertStu {
	static private Connection conn;
	static int cnt = 0;
    static Scanner in = new Scanner(System.in);
    static int sno = 1;
	public static void main(String args[]) {
		if (connect()) {
            String lineWords[];
            while ((lineWords=getNextLineWords())!=null) // 是否还有输入
            { 
                String name="";
                for(int i=1;i<lineWords.length;i++)
                    name+=lineWords[i];
                executeUpdate("INSERT INTO stu(num,name)VALUES(\'"+lineWords[0]+"\',\'"+name.toString()+"\');");   
            }      
        } 
        else System.out.println("Connect Error!");	
	}
	// 建立连接
	private static boolean connect() {
		String connectString = "jdbc:mysql://172.18.187.230:53306/teaching"
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
    public static String[] getNextLineWords(){
        if (sno==1){
            System.out.println("每行输入若干词(只能用一个空格间隔)，exit或空行退出.\r\n");
        }
        System.out.print("第"+sno+"行> ");			
        if (!in.hasNextLine()) { // 是否还有输入
           return null;
        }
        String line = in.nextLine(); // 读取下一行
        line = line.trim();
        if (line.equals("exit") || line.length() == 0) {
            return null;
         }
         sno++;
         return line.split(" ");	
    } 
	
	//执行SQL查询语句, 返回结果集
	static private boolean executeUpdate(String sqlSentence) {
	     Statement stat;
	     int cnt=-1;     
	     try {
            cnt++;
		    stat = conn.createStatement();       //获取执行sql语句的对象
		    cnt = stat.executeUpdate(sqlSentence); //执行sql查询，返回结果集
	     } catch (Exception e) {
		    System.out.println(e.getMessage()+"5555");
         }
         System.out.println("["+cnt+"条记录被插入]\n");
	     return (cnt>=0);
	}
	//显示查询结果
	private static void showStudents(ResultSet rs){
	    try {
            int cnt=0;
	       while(rs.next()){
               cnt++;
	          System.out.println(rs.getString("id")+" "+rs.getString("num")+" "+rs.getString("name"));		   
           }
           System.out.println("["+cnt+"]条记录\n");
	    }
	    catch (Exception e) {
		System.out.println(e.getMessage());
	    }
	}
}