public class DuplicateAccountCreate {
    public static void copyAccount(){
        list< account> storeAcc =[Select Name,Phone,Opp_Name__c from account];
       system.debug(storeAcc);
        list<account> insertAcc = new list<account>();
        for(account accRec :storeAcc){
        account newAcc = new account();
         newAcc.Name = accRec.Name;
         newAcc.Phone = accRec.Phone;
         newAcc.Opp_Name__c=accRec.Opp_Name__c;
         insertAcc.add(newAcc);   
        }
       // insert insertAcc;
    }
}