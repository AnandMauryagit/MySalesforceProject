public class DemoLogical {
    Static integer num =1;
    public static integer   test(integer  i , integer t){ 
        integer tests= i+t;
        if (num ==1 ){
            num = num+1;
           integer finalResult = test(2,4);
            system.debug('test- -'+finalResult);
        }
        return tests;
    }
}