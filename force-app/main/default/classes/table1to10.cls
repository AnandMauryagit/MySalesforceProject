public class table1to10 {
 public static void printMultiplicationTables() {
     list<list<integer>>asd =new list<list<integer>>();
     list<integer> Numbe = new list<integer>();
        for (Integer i = 1; i <= 10; i++) {
            
            for (Integer j = 1; j <= 10; j++) {                  
                if(j==i) {
                      Numbe.Add(i*j);
                    Break ;
                }
                //System.debug(Numbe);
            }
            

        }
                     System.debug( Numbe);

    }
}