public class QueuableIterfaceDemo implements queueable {
    Public void execute (QueueableContext qx){
        system.debug('i am in QueuableIterfaceDemo Class');
        list<Account>Acc2 = New list<Account>();
        for (Integer i=0; i<=5;i++){
            Account Acc =new Account();
            Acc.name ='QueuableIterfaceDemo Account Chirag'+i;
            Acc2.Add(Acc);
        }
        Insert Acc2;
        system.debug('Account inserted =='+Acc2);
        Id JobId =system.enqueueJob(new QueuableIterfaceDemo11());
        system.debug('JobId of QueuableIterfaceDemo11=== '+JobId);
    }
    
    
}