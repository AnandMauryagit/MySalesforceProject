public class CreatePsswordStringclass {
    /* public static void  vari(list <string>Num){//string v1
List<String> n3 = Num.get(3).split('');
List<String> n2 = Num.get(2).split('');
List<String> n1 = Num.get(1).split('');
List<String> n0 = Num.get(0).split('');
string asd= n3.get(3)+n2.get(3)+n1.get(3)+n0.get(3)+n3.get(2)+n2.get(2)+n1.get(2)+n0.get(2)
+n3.get(1)+n2.get(1)+n1.get(1)+n0.get(1)+n3.get(0)+n2.get(0)+n1.get(0)+n0.get(0);
system.debug(asd);

}*/
    public static void  vari(string v1,string v2,string v3,string v4){        
        integer v=3;
        string ss;
                    list<string> zxc = new list<string>();

        for (integer i=0;i<=v;i++){
            integer g=v-i;
            String []n3 = v1.split('');
            String[] n2 = v2.split('');
            String[] n1 = v3.split('');
            String[] n0 = v4.split('');
            
            string  zx=(n0[g]+n1[g]+n2[g]+n3[g]);
            zxc.add(zx);            
             ss = String.join(zxc,'');
            
        }
                    system.debug('joins'+ss); 

        
        
    }
}