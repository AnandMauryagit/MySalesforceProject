public class WireDemoClassShow {   
    @AuraEnabled(cacheable=true)
    public static list<Account> getRecord(){     
        list<Account> accountDetail= [SELECT Name , Website, phone from Account limit 20];
        return accountDetail;
        
    }
}