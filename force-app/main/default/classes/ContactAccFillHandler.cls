public class ContactAccFillHandler {
    public static void handleAccToPopulate (list<Contact>newAcc){
        List<Id> conList = New List<Id>();
        Map<String,Id> conMap = New Map<String,Id>();
        for(Contact conData :newAcc){
            conMap.put(conData.Responce__c,conData.AccountId);
        }
        List<Account>acclist = [Select Id ,Phone,Postal_Code__c,Product__c,oppName__c From Account Where Id  IN : conMap.Values()];
        
    }
}