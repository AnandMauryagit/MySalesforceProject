public class CaseToCalculateAmountHandler {
    public static void compareMaxAndMin(List<Case>newCase , Map<Id,Case>oldData){
        List<Id>accountId = New List<Id>();
        List<Id>CaseId = New List<Id>();
        for(Case caseChangesCheck :newCase){
            If(caseChangesCheck.Amount__c!= Null && caseChangesCheck.Amount__c != oldData.get(caseChangesCheck.Id).Amount__c ){
                CaseId.add(caseChangesCheck.Id);
            }
        }
        for(Case caseIdCollection : [SELECT Id ,contact.Account.id FROM  Case where Id IN :newCase]){
            accountId.add(caseIdCollection.contact.Account.id);
        }
        AggregateResult[] groupedResults= [Select contact.Account.id, MIN(Amount__c), MAX(Amount__c) from  Case Where contact.Account.id IN : accountId  Group By contact.Account.id  ];
        List<Account> accountToUpdateData = New List<Account> ();
        for (AggregateResult ar : groupedResults){
            Account accountToUpdate = new Account ();
            accountToUpdate.Id =  String.valueOf(ar.get('id'));
            accountToUpdate.AccountNumber=String.valueOf(ar.get('expr0'));
            accountToUpdateData.add(accountToUpdate);
        }
        update accountToUpdateData;
    }
}