public class UpdateAssessmentResponse {
     @InvocableMethod(label='Recieve data from flow' description=' Send data to apex'  category='Contact')
 public static void updateAccountFields(List<GettingInputDataForResponse>contactsData) {
     system.debug('flow data'+contactsData);
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
    // for(GettingInputDataForResponse Dataum :contactsData)
    List<Contact> csss = new List<Contact>();
        for (Contact con : csss){
            if (con.AccountId != null && con.Responce__c != null && con.AccFields__c != null) {
                Account acc = accountsToUpdate.get(con.AccountId);
                if (acc == null){
                    acc = new Account(Id = con.AccountId);
                    accountsToUpdate.put(con.AccountId, acc);
                }
                try {
                    acc.put(con.AccFields__c, con.Responce__c);
                } catch (Exception e) {
                    System.debug('Invalid field specified in accountFieldAPIName__c: ' + e.getMessage());
                }
            }
        }
        if (accountsToUpdate.size() > 0) {
            update accountsToUpdate.values();
        }
    }
    public  class GettingInputDataForResponse{
        @InvocableVariable
        public List<Contact>ContaDatas;
        
    }
}