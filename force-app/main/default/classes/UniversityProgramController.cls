/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : UniversityProgramController
 * Author          : <YourName>
 * Created Date    : Sep 17, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Sep 17, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Sep 17, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public with sharing class UniversityProgramController {

    @AuraEnabled(cacheable=true)
    public static List<University_Program__c> getPrograms() {

        return [
            SELECT
                Id,
                Name,
                Program_Code__c,
                Level__c,
                Category__c,
                Description__c,
                Duration__c,
                Eligibility__c,
                Annual_Fee__c,
                Mode__c,
                Active__c
               // Program_Image_URL__c
            FROM University_Program__c
            WHERE Active__c = true
            ORDER BY Name ASC
        ];

    }

}