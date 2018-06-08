//package java.lang;

public class StringFunc{
    final static String s="�ⵣ������ʿ����û�бⵣ�����ⵣû�а�ʿ��ⵣҪ���ڰ����,���ƫ���ñⵣ���ڰ����";
    public static void main(String args[]){
     
        /* 1 */
        String s1=s.substring(4,7);
        System.out.println(s1);
        
        /* 2 */
        int index=s.indexOf("�ⵣ");
        int cnt=0;
        while(index!=-1)
        {
            cnt++;
            System.out.print(index+"   ");
            index=s.indexOf("�ⵣ",index+1);
        }
        System.out.println("�ⵣ������"+cnt+"��");

        /* 3 */
        long time1= System.currentTimeMillis();
        int repeat=10000;
        String s3="";
        while(repeat-- >0)
            s3=s3+s;
        long time2= System.currentTimeMillis();
        long time=time2-time1;
        System.out.println("�ַ������ʱ��"+time+"ms   �ܳ���"+s3.length());

        /* 4 */
        StringBuilder s4=new StringBuilder("");
        repeat=10000;
        time1= System.currentTimeMillis();
        while(repeat-- >0)
            s4.append(s);
        time2= System.currentTimeMillis();
        time=time2-time1;
        System.out.println("StringBuilderʱ��"+time+"ms  �ܳ���"+s4.length());
    }
}





