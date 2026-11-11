public class insertDML {
    public static void program(){
 list <account> old =new list <account>();
       for(integer a=1;a<=15;a++){
            account ab = new account();
            ab.name='shubham'+a;
           old.add(ab);
            system.debug (ab);
        }
        insert old;
    }    
}