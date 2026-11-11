public class CreateConOppnameInsert {
 /*public Static void NameUpdateAccountContactOpportunityMethod(List<Account> newList, Map<Id,Account> oldMapOfAccount){
       
        Set<Id> idOfAccount = new Set<Id>();
               
        if(!newList.isEmpty()){
            for(Account acc : newList){
                if(oldMapOfAccount != NULL & acc.Name != oldMapOfAccount.get(acc.Id).Name){
                    idOfAccount.add(acc.Id);
                }  
            }
        }
       
        List<sObject> sObjList = [SELECT Id, Name, (SELECT Id, LastName FROM Contacts WHERE AccountId IN : idOfAccount), (SELECT Id, Name FROM Opportunities WHERE AccountId IN : idOfAccount) FROM Account WHERE Id IN : idOfAccount];
       
        List<sObject> finalsObject = New List<sObject>();
        //List<Contact> updatedContact = new List<Contact>();
        //List<Opportunity> updatedOpportunity = new List<Opportunity>();
       
        For(sObject ref : sObjList){
            if (ref.getSObjectType() == Account.SObjectType) {
               
                Account acc = (Account)ref;
                // Process the Account record
                // e.g., acc.Id, acc.Name, etc.
               
                // Access Contacts for the current Account
                List<Contact> contacts = acc.Contacts;
                System.debug(contacts);
                for (Contact con : contacts) {
                    Contact updateContact = new Contact();
                        updateContact.id = con.Id;
                        updateContact.LastName = acc.Name;
                   
                    finalsObject.add(updateContact);
                }
               
                // Access Opportunities for the current Account
                List<Opportunity> opportunities = acc.Opportunities;
                System.debug(opportunities);
                for (Opportunity opp : opportunities) {
                 
                    Opportunity UpdateOpportunity = new Opportunity();
                    UpdateOpportunity.Id = opp.Id;
                    UpdateOpportunity.Name = acc.Name;
                   
                    finalsObject.add(UpdateOpportunity);
                }
            }
        }
       
        if(finalsObject != NULL ){
            update finalsObject;
            //update updatedOpportunity;
        }*/
    Public Static Void updateAccRecToCon(list<Account>newList, Map<id,Account>oldMap){
        list<Contact>ConUpdate=New list<Contact>();
       Map<String,Account>Acc=New Map<String,Account>();
        For(Account AcLoop:newList){
            if(AcLoop.Name!=oldMap.get(AcLoop.id).Name){
             Acc.Put(AcLoop.id,AcLooP); 
            }
            }      
       list<contact>ConList=[Select id , Name ,phone From contact where accountId In: Acc.keyset()];
        for(Account Acc2:newList){
        Contact Con =New Contact();
        for(Contact ConRec:ConList){
           // if(Acc.containsKey(ConRec.accountId)){
              // Con.lastName= Acc.get((ConRec.accountId).Name);
                //Con.phone=Acc.get((ConRec.accountId).phone);
            
             ConRec.lastName = Acc2.Name;
            ConRec.phone = Acc2.phone;
            ConUpdate.Add(ConRec);
        }  
        }

    
        Update ConUpdate;
    

}
}