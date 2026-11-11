public class ChaningSecondBatchClass implements  DataBase.Batchable <sObject>{
    public DataBase.QueryLocator Start(DataBase.BatchableContext bx){
        return DataBase.getQueryLocator([SELECT Name ,Phone FROM Contact limit 5 ]);
        
    }
    public Void execute(DataBase.BatchableContext bx , list<Contact>conList){
        for(Contact conData :conList){
          conData.Phone =  '000000000000000';
        }
        update conList;
    }
    public  void finish(DataBase.BatchableContext bx){    
    }
    // Calling --------  Id JobId =DataBase.executeBatch(new BatchApexSecond(),200);
        //system.debug('JobId of QueuableIterfaceDemo=== '+JobId);
}