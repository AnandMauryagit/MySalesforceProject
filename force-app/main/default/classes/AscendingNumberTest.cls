public class AscendingNumberTest {
    /*public static integer reOrder(integer a,integer b, integer c){      
        integer smallNumbe = a<b && a<c?a:b<a && b<c?b:c;
        integer greatestVal =a>b && a>c?a:b>a && b>c?b:c;
        list<integer>numdInOrder=new list<integer>;
        numdInOrder.add(greatestVal);
        system.debug();        
        
        return smallNumbe;*/
         public static void dscOrder(){ 
        Integer[] arr = new Integer[]{2, 7, 6};
            
            for (Integer i = 0; i < arr.size(); i++) {
                for (Integer j = i + 1; j < arr.size(); j++) {
                    if (arr[i] < arr[j]) {
                        Integer temp = arr[i];
                        arr[i] = arr[j];
                        arr[j] = temp;
                    }
                }
            }
        
        System.debug(arr);     
    }
    }