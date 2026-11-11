public class CreateAccountThroughLwc {
    @AuraEnabled
    public static string createDataFromLwc(string name,string address,string phone,String email){
        Account acc = New Account();
        acc.Name=name;
        acc.Phone=phone;
        acc.Email__c=email;
        if(acc!=Null){
        insert acc;
        }
        return '';
    }
}