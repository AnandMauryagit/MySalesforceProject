/**
* @File Name : AccountHelperForDataTable.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : October 4, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | October 4, 2024 |   | Initial Version
**/

public class AccountHelperForDataTable {
	//public with sharing class AccountHelper {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Type, Rating,
                Phone, Website, AnnualRevenue
            FROM Account LIMIT 5];
    }
}