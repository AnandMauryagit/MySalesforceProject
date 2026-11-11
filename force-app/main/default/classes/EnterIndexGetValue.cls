/************
Class Name      : EnterIndexGetValue
Description     : Here we see how to print value as we enter index number. 
Created Date    : 31-Jan-2024
VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              31-Jan-2024             Anand              Initial Implementation        
*************/
public class EnterIndexGetValue {
    public static void enterNum(integer indexNum){
            list<integer>numb=new list <integer>{10,2,5,3,1,4,5,2,1};
                integer numHolder;
                for(integer vari:numb){
                  numHolder = vari;  
                }               
                for(integer i=numHolder;i<=indexNum;i++){
                    system.debug('result'+i);
                }
                            system.debug('numHolder'+numHolder);

       // integer solutions =i;       
          //                  return i;

    }
}