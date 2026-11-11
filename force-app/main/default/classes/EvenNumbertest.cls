public class EvenNumbertest {
 static integer store ;
    public static integer evenfunctio(){
        for (integer i=2;i<=100;i=i+2){
            store=i;
            system.debug('store'+store);
        }
        system.debug(store);
        return store;
    }
}