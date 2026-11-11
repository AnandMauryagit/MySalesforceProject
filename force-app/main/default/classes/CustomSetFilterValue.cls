/************
Class Name      : CustomSetFilterValue
Description     : Here we see how to filter duplicate value without set.
Created Date    : 06-Feb-2024
VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              06-Feb-2024            Anand              Initial Implementation        
*************/
public class CustomSetFilterValue {
    static list<integer>containValue=new list<integer>{1,2,3,4,5,6,1,1,4,8,5};
        public static list<integer> filterInteger(){
            list<integer>finalResult=new list<integer>();
            for (integer filterOneByOne:containValue){
                if(!finalResult.contains(filterOneByOne)){
                    finalResult.add(filterOneByOne);
                }
            } 
            system.debug(finalResult);
            return finalResult;
        }
}