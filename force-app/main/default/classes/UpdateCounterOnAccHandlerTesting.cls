@isTest
public class UpdateCounterOnAccHandlerTesting {
    @isTest
    public static void updateconToAcc(){
         Account Acc= new Account();
        Acc.Name='surendra';
        Acc.counter__c=12;
        insert Acc;
        contact con=new contact();
        con.AccountId=Acc.Id;
        con.LastName='katwRU';
        con.Counter__c=15;
        insert con;
        list<contact>contupdate=[select id ,Counter__c from contact where AccountId =: con.AccountId];
        list<contact>updateionCon=new list<contact>();
        for(contact itrateCon :contupdate){
        itrateCon.Counter__c=Acc.counter__c;
            updateionCon.add(itrateCon);
            
        }        
        update contupdate;
    }
    
}