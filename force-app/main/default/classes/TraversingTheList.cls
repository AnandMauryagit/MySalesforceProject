/************
Class Name      : updateDML
Description     : Here we see how to print list as it is. 
Created Date    : 31-Jan-2024
VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              31-Jan-2024             Anand              Initial Implementation        
*************/
public class TraversingTheList {
    public static void printAsItIs(){
        list<integer>numb=new list <integer>{10,2,5,3,1,4,5,2,1};
            for(integer prt:numb){
                system.debug(prt);
            }
    }
}