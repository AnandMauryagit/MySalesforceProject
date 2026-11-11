public class AssignPermissionToCreateAcc {
    
    public static void getAccessAndCreate(){
        AvoidDmlErrorAssignPermissionToCreateAcc.assignPermissionSet();
      
      list<Account> accListToUpdate = [Select id ,name ,Phone ,AccountNumber from Account limit 2 ];
        for(Account accountUpdate :accListToUpdate){
           accountUpdate.AccountNumber = '1222111' ; 
        }
        update accListToUpdate;
        
        AvoidDmlErrorAssignPermissionToCreateAcc.deleteAssignSet();
    } 
}