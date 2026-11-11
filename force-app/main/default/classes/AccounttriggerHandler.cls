public class AccounttriggerHandler {
    public static void beforeInsert(List<Account> newList){
        for(Account Acc:newList){
            if(Acc.Industry!=Null&& Acc.Industry=='Media')
                Acc.Rating='Hot';
        }
    }
    public static void createRelatedOpportunity(List<Account> newList){
        list<Opportunity> OppIsInserted=new list<Opportunity>();
        for(Account Acc:newList){
            Opportunity Opp = New Opportunity();
            Opp.Name=Acc.Name;  
            Opp.AccountId=Acc.Id;
            Opp.CloseDate=System.Today();
            Opp.StageName='Prospecting';      
            OppIsInserted.add(Opp);
        }
        if(!OppIsInserted.isEmpty()){
            insert OppIsInserted;
        } 
    }
    public static void beforeupdatephoneDescription(List<Account> newList,Map<id,Account>oldMap){
        for(Account Acc:newlist){
            if(Acc.Phone!=Null&&Acc.Phone!=oldmap.get(Acc.id).Phone){
                Acc.Description='your phone is updated';
            }  
        }
    }
    public static void createRelatedOpportunityUpdatePhone(List<Account>NewList,Map<id,Account>oldMaps){
        Set<Id> AccountIds = new Set<Id>();
        
        for(Account Acc : NewList){
            if(Acc.Id != NULL && Acc.OwnerId != oldMaps.get(Acc.Id).OwnerId){
                AccountIds.add(Acc.Id);
            }
        }
        
        list<Contact> ConList= [Select id,Ownerid from contact where Accountid =: AccountIds];
        
        contact Con2 = new contact();
        
        for(Account Acc2 :  NewList){
            for(Contact Con : ConList){
                Con2.AccountId =   Acc2.Id;
                Con2.OwnerId = Con.OwnerId;
            }
        }
        
        update Con2;
        
    }
    Public Static void AddContact (List<Account> Newlist,Map<Id,Account>oldMap){
        Set<Id> newRecord = new Set<Id>();
        for(Account Acc : Newlist) {
            if(Acc.Phone!=Null && Acc.Phone!=oldMap.get(Acc.Id).Phone){
            	newRecord.add(Acc.Id);
            }
        } 
        list<Contact>Conlist=[Select Id,Name,Phone From Contact Where AccountId IN : newRecord];
        Contact Con = New Contact();
        for(Account Ac :Newlist){
        //for(Contact Con2:Con){
        Con.AccountId=Ac.Id; 
        Con.LastName=Ac.Name;
        }  
    }    
}