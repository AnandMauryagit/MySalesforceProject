/**
* @File Name : DecoratorControler.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : December 27, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | December 27, 2024 |   | Initial Version
**/

	public class DecoratorControler {
	@AuraEnabled(cacheable=true)


	public static List<Contact> getRelatedContacts(Id accountId) {
        return [SELECT Id, Name, Phone, Email FROM Contact WHERE AccountId = :accountId];
    }

}