public class BatchForSameNameOfAccountAndOppur implements Database.Batchable<SObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bx){
        return Database.getQueryLocator([Select id,Name,Phone,(Select id ,name From Opportunities) From Account Limit 10]); 
    }
    Public void execute (Database.BatchableContext bxc,List<Account>scope){
        system.debug('Account Scope Size is=='+scope.Size());
        system.debug('Account Scope Size is=='+scope);
        
        
        list<opportunity> updateOppFromAcount = new list<opportunity>();
        
        For(Account Acc : scope){
            for(Opportunity Opps : Acc.Opportunities){
                //opportunity Opps = New opportunity();
                //Opps.AccountId = Acc.id;
                Opps.Name = Acc.Name;
                
                updateOppFromAcount.Add(Opps); 
            }
        }
        Update updateOppFromAcount;
        system.debug('updateOppFromAcount updated==='+updateOppFromAcount); 
    }
    public void finish(database.BatchableContext bxcs){
        system.debug('i am in finish');
       // list<string>rec=new  list<string>();
       // rec.add (updateOppFromAcount);
     list<string> mailtolist = new list<string>();
        mailtolist.add('surendramaurya1795@gmail.com');
        messaging.SingleEmailMessage myemail = new messaging.SingleEmailMessage();
        myemail.setToAddresses(mailtolist);
        myemail.setSubject('Your Record information ');
        myemail.setPlainTextBody('your has been updated ');
        messaging.sendEmail(New Messaging.SingleEmailMessage[]{myemail});
        system.debug('email send');
    }
}