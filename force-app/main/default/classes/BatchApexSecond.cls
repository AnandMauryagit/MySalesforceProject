public class BatchApexSecond implements Database.Batchable <sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator ([SELECT Id,Name,Phone FROM Account Limit 5]);
    }
    public void execute(DataBase.BatchableContext bc, list<Account>accList){
        for(Account acc:accList){
           acc.Phone = '0000000000000000'; 
        }
        update accList;
        
    }
    public void finish(DataBase.BatchableContext bc){
        ChaningSecondBatchClass creatingChains = new ChaningSecondBatchClass();
        DataBase.ExecuteBatch(creatingChains);
    }
    // Calling CHAINING OF CLASS  ------Id JobId =DataBase.executeBatch(new BatchApexSecond(),200);
       // system.debug('JobId of QueuableIterfaceDemo=== '+JobId);
}