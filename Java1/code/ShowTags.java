import java.io.*;
import java.util.*;

class ShowTags{
  public static void main(String[] args)throws IOException{
     String content = readFile(".\\grassland.htm");
		 HashMap<String,Integer>map=new HashMap<String,Integer>();
		 int len=content.length();
		 String label;
		 Integer cnt;
		 for(int i=0;i<len;i++)
		 {
			 if(content.charAt(i)=='<'&&content.charAt(i+1)!='!'&& content.charAt(i+1)!='>')
			 {
				 int begin=++i;
				 while(content.charAt(i)!=' ' && content.charAt(i)!='>')
						i++;
				if(begin!=i)
				{
					label=content.substring(begin,i);
				  label=label.toUpperCase();
				  cnt=(map.get(label)==null? 0:map.get(label));
				  map.put(label,cnt+1);
				} 
			 }
		 }

		 Iterator<String> it=map.keySet().iterator();
		 int i=1;
		 while(it.hasNext())
		 {
				label=(String) it.next();
				cnt=map.get(label);
				if(i%3==0)
					System.out.println('<'+label+'>'+cnt);
				else
					System.out.print('<'+label+'>'+cnt+"			");
				i++;
		 }
  }

	static String readFile(String fileName) throws IOException
	{
    	StringBuilder sb = new StringBuilder("");
			int c1;
			FileInputStream f1= new FileInputStream(fileName);		
			InputStreamReader in = new InputStreamReader(f1, "UTF-8");

			while ((c1 = in.read()) != -1) 
			{
	  		sb.append((char) c1);
			}        
        return sb.toString();
  }
}


