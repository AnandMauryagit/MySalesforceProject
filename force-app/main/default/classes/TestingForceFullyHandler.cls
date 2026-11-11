public class TestingForceFullyHandler {
   /*public Static Boolean isFirstTime=true;
    public static void insertAccount(Map<Id,Account>newMap,List<Account>newLists,List<Account>oldList){
        List<Account>accDataFirst=[SELECT Id,Phone From Account where Id IN :newMap.keyset()];
        for(Account Acc :accDataFirst){
            
            Acc.Phone ='1111';
        }
         system.debug('newList data before Update line--'+ 'Name--'+newLists[0].Name +'Phone--'+newLists[0].Phone);
       // system.debug('newList data before Update line--'+ 'Name--'+oldList[0].Name + 'Phone--'+oldList[0].Phone);
        Update accDataFirst;
        system.debug('newList data--'+ 'Name--'+newLists[0].Name +'Phone--'+newLists[0].Phone);
       // system.debug('oldList data--'+ 'Name--'+oldList[0].Name + 'Phone--'+oldList[0].Phone);
        
        List<Account>accdata=[SELECT Id,Phone From Account where Id IN :newMap.keyset()];
        for(Account accRecord :accdata){
            accRecord.Phone = '22222'; 
        }
        Update accdata;
        
        system.debug('newList data--'+ 'Name--'+newLists[0].Name +'Phone--'+newLists[0].Phone);
        //system.debug('oldList data--'+ 'Name--'+oldList[0].Name + 'Phone--'+oldList[0].Phone); 
    }
    public static void updateCheckOld (List<Account>newList,List<Account>oldList){
        system.debug('newList data--'+ 'Name--'+newList[0].Name +'Phone--'+newList[0].Phone);
        system.debug('oldList data--'+ 'Name--'+oldList + 'Phone--'+oldList); 
    }*/
    public static Boolean isFirstTime = true;

    public static void handleAccountChanges(Map<Id, Account> newMap, List<Account> newList, List<Account> oldList) {
        // First update the phone numbers to '1111'
        List<Account> accountsToUpdate = [SELECT Id, Phone FROM Account WHERE Id IN :newMap.keySet()];
        for(Account acc : accountsToUpdate) {
            acc.Phone = '1111';
        }
        update accountsToUpdate;
        
        // Log newList data before second update
        for(Account acc : newList) {
            System.debug('newList data before second update - Name: ' + acc.Name + ' Phone: ' + acc.Phone);
        }
        
        // Second update the phone numbers to '22222'
        accountsToUpdate = [SELECT Id, Phone FROM Account WHERE Id IN :newMap.keySet()];
        for(Account acc : accountsToUpdate) {
            acc.Phone = '22222';
        }
        update accountsToUpdate;
        
        // Log newList data after second update
        for(Account acc : newList) {
            System.debug('newList data after second update - Name: ' + acc.Name + ' Phone: ' + acc.Phone);
        }

        // Call the method to log old and new phone values
        updateCheckOld(newList, oldList);
    }

    public static void updateCheckOld(List<Account> newList, List<Account> oldList) {
        for(Integer i = 0; i < newList.size(); i++) {
            Account newAcc = newList[i];
            Account oldAcc = oldList != null && oldList.size() > i ? oldList[i] : null;
            String oldPhone = oldAcc != null ? oldAcc.Phone : 'N/A';
            String newPhone = newAcc.Phone;
            System.debug('Record Id: ' + newAcc.Id + ' Old Phone: ' + oldPhone + ' New Phone: ' + newPhone);
        }
    }
}