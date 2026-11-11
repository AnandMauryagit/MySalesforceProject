/************
Class Name      : CustomSetFilterValue
Description     : Here we see the occourance of number in a list with static function. 
Created Date    : 04-Feb-2024
VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              04-Feb-2024            Anand              Initial Implementation        
*************/
public class OccuranceOfNumber {
    static list<integer>numb=new list<integer>{1,2,5,7,1,2,7,1};
        public static map<integer,integer> Occourances(){
            map<integer,integer> storedata= new map<integer,integer>();
            for(integer numfilter:numb){
                if(!storedata.containskey(numfilter)){
                    storedata.put(numfilter,0);
                }  
                integer curentValue = storedata.get(numfilter)+1;
                system.debug(storedata.get(numfilter));
                storedata.put(numfilter,curentValue);

            }
                                            system.debug(storedata);

            return storedata;
        }
    
}