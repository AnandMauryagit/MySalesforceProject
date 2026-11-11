@isTest
public class TestCreateAccountContactOnApproval {
    @isTest
    static void testAfterApprovCreateAccCon() {
        // Create test data
        List<Account_Request__c> testRequests = new List<Account_Request__c>();
        for (Integer i = 0; i < 5; i++) {
            Account_Request__c req = new Account_Request__c(
                Name = 'Test Account ' + i,
                Status__c = 'Approved',
                Phone__c = '123-456-7890',
                DOB__c = Date.newInstance(1990, 1, 1),
                Email__c = 'test' + i + '@example.com'
            );
            testRequests.add(req);
        }
        insert testRequests;

        // Call the handler method
        Test.startTest();
        CreateAccountContactOnApproval.AfterApprovCreateAccCon(testRequests);
        Test.stopTest();

        // Verify Account and Contact creation
        List<Account> createdAccounts = [SELECT Id, Name, Phone, DOB__c, Email__c FROM Account];
        System.assertEquals(5, createdAccounts.size());

        List<Contact> createdContacts = [SELECT Id, AccountId, LastName, DOB__c FROM Contact];
        System.assertEquals(5, createdContacts.size());

        for (Integer i = 0; i < 5; i++) {
            System.assertEquals('Test Account ' + i, createdAccounts[i].Name);
            System.assertEquals('123-456-7890', createdAccounts[i].Phone);
            System.assertEquals(Date.newInstance(1990, 1, 1), createdAccounts[i].DOB__c);
            System.assertEquals('test' + i + '@example.com', createdAccounts[i].Email__c);

            System.assertEquals(createdAccounts[i].Id, createdContacts[i].AccountId);
            System.assertEquals('Test Account ' + i, createdContacts[i].LastName);
            System.assertEquals(Date.newInstance(1990, 1, 1), createdContacts[i].DOB__c);
        }
    }
}