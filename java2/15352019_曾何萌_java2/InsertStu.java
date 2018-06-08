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
            while ((lineWords=getNextLineWords())!=null) // �Ƿ�������
            { 
                String name="";
                for(int i=1;i<lineWords.length;i++)
                    name+=lineWords[i];
                executeUpdate("INSERT INTO stu(num,name)VALUES(\'"+lineWords[0]+"\',\'"+name.toString()+"\');");   
            }      
        } 
        else System.out.println("Connect Error!");	
	}
	// ��������
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
            System.out.println("ÿ���������ɴ�(ֻ����һ���ո���)��exit������˳�.\r\n");
        }
        System.out.print("��"+sno+"��> ");			
        if (!in.hasNextLine()) { // �Ƿ�������
           return null;
        }
        String line = in.nextLine(); // ��ȡ��һ��
        line = line.trim();
        if (line.equals("exit") || line.length() == 0) {
            return null;
         }
         sno++;
         return line.split(" ");	
    } 
	
	//ִ��SQL��ѯ���, ���ؽ����
	static private boolean executeUpdate(String sqlSentence) {
	     Statement stat;
	     int cnt=-1;     
	     try {
            cnt++;
		    stat = conn.createStatement();       //��ȡִ��sql���Ķ���
		    cnt = stat.executeUpdate(sqlSentence); //ִ��sql��ѯ�����ؽ����
	     } catch (Exception e) {
		    System.out.println(e.getMessage()+"5555");
         }
         System.out.println("["+cnt+"����¼������]\n");
	     return (cnt>=0);
	}
	//��ʾ��ѯ���
	private static void showStudents(ResultSet rs){
	    try {
            int cnt=0;
	       while(rs.next()){
               cnt++;
	          System.out.println(rs.getString("id")+" "+rs.getString("num")+" "+rs.getString("name"));		   
           }
           System.out.println("["+cnt+"]����¼\n");
	    }
	    catch (Exception e) {
		System.out.println(e.getMessage());
	    }
	}
}