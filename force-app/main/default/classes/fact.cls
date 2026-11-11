public class fact {
    public  static void number(){
        integer num=5;
        integer factorial=1;
        for(integer i=num;i>=1;i--){
            factorial=factorial*num;
            --num;
        }
        system.debug('factorial:-'+factorial);
    }

}