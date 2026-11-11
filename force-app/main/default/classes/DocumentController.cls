/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : DocumentController
 * Author          : <YourName>
 * Created Date    : Aug 6, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Aug 6, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Aug 6, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public with sharing class DocumentController {

    @AuraEnabled

    public static void saveDocument(

        String documentName,
        String category,
        Date startDate,
        Date expiryDate,
        String description

    ){

        PackagingTest32__Document__c doc =
            new PackagingTest32__Document__c();

        doc.Name=documentName;

        doc.PackagingTest32__Category__c=category;

        doc.PackagingTest32__Start_Date__c=startDate;

        doc.PackagingTest32__Expiry_Date__c=expiryDate;

        doc.PackagingTest32__Description__c=description;

        insert doc;

    }

}