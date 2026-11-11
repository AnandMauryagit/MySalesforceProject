public class MyExceptionTestingCustom {
    public virtual class BaseException extends Exception {}
    public class OtherException extends BaseException {}

    public static void testExtendedException(Integer Names){
        try {
            Integer i=6;
            // Your code here
            if (Names ==1) throw new OtherException('This is bad');
            system.debug('aa gaya hai');
        } catch (BaseException e) {  
            // This catches the OtherException
            System.debug(e.getMessage());
        }  
    }
}