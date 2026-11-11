public class MixedDmlException extends Exception {
    public static void dmlOnSetupAndNonSetup(){
        Account a = new Account();
        a.Name ='Testing MixedDmlException';
        Insert a;
    } 
}