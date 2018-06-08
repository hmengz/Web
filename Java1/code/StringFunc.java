//package java.lang;

public class StringFunc{
    final static String s="扁担长，板凳宽，板凳没有扁担长，扁担没有板凳宽。扁担要绑在板凳上,板凳偏不让扁担绑在板凳上";
    public static void main(String args[]){
     
        /* 1 */
        String s1=s.substring(4,7);
        System.out.println(s1);
        
        /* 2 */
        int index=s.indexOf("扁担");
        int cnt=0;
        while(index!=-1)
        {
            cnt++;
            System.out.print(index+"   ");
            index=s.indexOf("扁担",index+1);
        }
        System.out.println("扁担共出现"+cnt+"次");

        /* 3 */
        long time1= System.currentTimeMillis();
        int repeat=10000;
        String s3="";
        while(repeat-- >0)
            s3=s3+s;
        long time2= System.currentTimeMillis();
        long time=time2-time1;
        System.out.println("字符串相加时间"+time+"ms   总长度"+s3.length());

        /* 4 */
        StringBuilder s4=new StringBuilder("");
        repeat=10000;
        time1= System.currentTimeMillis();
        while(repeat-- >0)
            s4.append(s);
        time2= System.currentTimeMillis();
        time=time2-time1;
        System.out.println("StringBuilder时间"+time+"ms  总长度"+s4.length());
    }
}





