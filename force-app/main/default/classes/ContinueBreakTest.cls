public class ContinueBreakTest {
    public static void testingBreak(){
        for(integer i=0;i<11;i++){           
            if(i==5){              
                break ;
            }
            system.debug(i);          
        }      
    }
    public static void testingContinue(){
        for(integer i=0;i<11;i++){
            if(i>5){
                continue ;
            }
            system.debug(i);
        }      
    }
    public static void testingBreakForEach(){
        for(integer dataIn : New list<integer>{1,2,3,4,5}){
            if(dataIn==3){
                continue ;
            }
            system.debug(dataIn);           
        }
    }
}