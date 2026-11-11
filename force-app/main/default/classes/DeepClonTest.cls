public class DeepClonTest {
    public static void testingd(){
        list<Account> nwelist = [select name ,phone from Account];
        Account []q2= nwelist.clone();
        Account []q3=nwelist.deepClone();
        system.debug(q2);
        system.debug(q3);
    }
}