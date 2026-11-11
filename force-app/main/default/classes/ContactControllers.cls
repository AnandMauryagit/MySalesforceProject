public with sharing class ContactControllers {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(String accId) {
        return [
            SELECT AccountId, Id, FirstName, LastName, Title, Phone, Email
            FROM Contact
            WHERE AccountId = :accId
            WITH SECURITY_ENFORCED
        ];
    }
}