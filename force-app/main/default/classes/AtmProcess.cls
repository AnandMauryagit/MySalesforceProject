public class AtmProcess {
public static  string accountHolder;
public  static string cardNo='34';
public static string cvv='675';
public static string atmPin='4545';
   static string result;
    static string ans='ram';
    public static string  allDetail(){
        system.debug(ans);
       result=cardNo+atmPin+cvv+accountHolder;
        system.debug (result);
        return result;
    }
  
    
    
}