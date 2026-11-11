public class AccountDataForCustomRecordpage {
 @AuraEnabled(cacheable=true)
    public static List<Account> getAccountDetail(){
        return [Select Id, Name ,Phone from Account];
    }
}