@isTest
public class ScheduleBatchConTest {
@isTest
    public static void testUpdateContact(){
        list<Account>accList = New List<Account>();
        for(integer i=0;i<200;i++){
            Account acc = New Account();
            acc.Name = 'Name'+i;
            acc.BillingLatitude =12;
            acc.BillingCity = 'Mau'+i;
            acc.BillingCountry = 'India'+i;
            acc.BillingStreet = 'Chanmari'+i;
           accList.add(acc);
        }  
        insert accList;
    }
}