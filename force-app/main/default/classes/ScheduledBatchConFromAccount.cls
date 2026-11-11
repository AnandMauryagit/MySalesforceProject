public class ScheduledBatchConFromAccount implements Database.Batchable<sObject>{
    public DataBase.QueryLocator start(DataBase.BatchableContext bc){
        return DataBase.getQueryLocator([Select Id, Name,BillingAddress From Account]);
    }
    public void execute(DataBase.BatchableContext bc, List<Account>accList){
        list<Contact>Con =[Select id ,AccountId, LastName,MailingAddress From Contact Where AccountId IN : accList];
        Address BillingAddres;
        list<Contact>updateCont = New List<Contact>();
        for(Account accData :accList){ 
            BillingAddres = accData.BillingAddress;
            Contact conData = New Contact();
            conData.AccountId = accData.Id;
           conData.MailingStreet = accData.BillingStreet;
           conData.MailingCountry=accData.BillingCountry;
            conData.MailingCity = accData.BillingCity;
            conData.MailingLatitude = accData.BillingLatitude;
            updateCont.add(conData);
        }
        Update updateCont;
    }     
    public void finish(DataBase.BatchableContext bc){       
    }
    
}