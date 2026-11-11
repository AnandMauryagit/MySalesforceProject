public class DeactivateUserAfterInformation implements Database.Batchable <sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        list<String> profileName = New list<String>{'SManager','Analytics Cloud Integration User'};
            return Database.getQueryLocator ([SELECT Name,Id, Username,LastLoginDate,Email From user where Profile.Name IN : profileName]);
    }
    public void execute(DataBase.BatchableContext bc, list<User>userListOfData){
        Integer twoWeekBefore = 166;
        Integer threeDaysBefore = 177;
        Integer deactivateDate = 178;
        List<String> EmailTOSend = New List<String>();
        for(User lastLoginCheck:userListOfData){
            if(lastLoginCheck.LastLoginDate < System.TODAY()-twoWeekBefore){
                EmailTOSend.add(lastLoginCheck.Email);
            }
            if(lastLoginCheck.LastLoginDate < System.TODAY()-threeDaysBefore){
                EmailTOSend.add(lastLoginCheck.Email);
            }
            if(lastLoginCheck.LastLoginDate < System.TODAY()-deactivateDate){
                lastLoginCheck.IsActive = False;
            }            
        }        
    }
    public void finish(DataBase.BatchableContext bc){
       }
}