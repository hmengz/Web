import java.util.*;

public class Fib{
    public static void main(String args[]){
        ArrayList<Long> fibs = new ArrayList<Long>();
        long fib0=0,fib1=1,fib2=1;

        /* 1 */
        Long f0=fib0,f1=fib1,f2=fib2;
        fibs.add(f0);
        fibs.add(f1);
        while (f1<=f2) {
            fibs.add(f2);
            f0=f1;
            f1=f2;
            f2=f0+f1;
        }
        System.out.println("maxFib(long):"+fibs.get(fibs.size()-1)+"    count:"+fibs.size());

        /* 2 */
        ArrayList<Double> radio=new ArrayList<Double>();
        Double r;
        Iterator<Long> it = fibs.iterator();
        f0=it.next();
        while(it.hasNext())
        {
            f1=it.next();
            r=(double) f0/f1;
            radio.add(r);
            f0=f1;
        }
        int i=1;
        for(Double _r:radio)
        {
            if(i%3==0) System.out.println(_r);
            else System.out.print(_r+"    ");
            i++;
        }

    }
}



