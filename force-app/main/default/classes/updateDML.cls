/************
Class Name      : updateDML
Description     : Here we see how we found a DML limit error. 

Created Date    : 29-Jan-2024
Reviewd By      :

VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              30-Jan-2024           Anand              Initial Implementation        
*************/
public class updateDML {
    public static void program (){
        list <account> subject=[select id,Name from account];
        for(account ac:subject){
            ac.Name='maurya';
            update subject;
        }     
    }
}