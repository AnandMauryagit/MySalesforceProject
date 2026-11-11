/**
* @File Name : ForAccountDetail.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : September 11, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | September 11, 2024 |   | Initial Version
**/

public class ForAccountDetail {
    @AuraEnabled
    Public static list<Account> getObjectDetail(){
        list<Account> accData = [Select Id ,Name from  Account];
        return accData;
    }
}
/*trigger OSBFreightFavoriteUpdateDate on OSB_Freight_Inquiry_Favorite__c (After Update) {
    
    Set<Id> updatedFreightRecords = new Set<Id>();

    for (OSB_Freight_Inquiry_Favorite__c record : Trigger.new) {
        OSB_Freight_Inquiry_Favorite__c oldRecord = Trigger.oldMap.get(record.Id);
        
        if (record.OSB_Freight_Updated_Date_c != oldRecord.OSB_Freight_Updated_Date_c) {
            updatedFreightRecords.add(record.Id);
        }
    }

    if (!updatedFreightRecords.isEmpty()) {
        List<NotificationAlert_c> notifications = new List<NotificationAlert_c>();

        List<OSB_Freight_Inquiry_Favorite__c> freightRecords = [
            SELECT Id, Name, OwnerId
            FROM OSB_Freight_Inquiry_Favorite__c
            WHERE Id IN :updatedFreightRecords
        ];

        Set<Id> userIds = new Set<Id>();
        for (OSB_Freight_Inquiry_Favorite__c freightRecord : freightRecords) {
            userIds.add(freightRecord.OwnerId);
        }

        Map<Id, User_Notification_Preference_c> userPreferencesMap = new Map<Id, User_Notification_Preference_c>(
            [SELECT Id, User_c, OSB_Freight_Bell_Alertc, OSB_Freight_Both_c
             FROM User_Notification_Preference__c
             WHERE (OSB_Freight_Bell_Alert_c = True OR OSB_Freight_Bothc = TRUE) AND User_c IN :userIds]
        );

        for (OSB_Freight_Inquiry_Favorite__c freightRecord : freightRecords) {
            User_Notification_Preference__c userPreference = userPreferencesMap.get(freightRecord.OwnerId);
            
            if (userPreference != null && (userPreference.OSB_Freight_Bell_Alert_c || userPreference.OSB_Freight_Both_c)) {
                NotificationAlert_c notification = new NotificationAlert_c();
                notification.OSB_Freight_Inquiry_Favorite__c = freightRecord.Id;  
                notification.Type__c = 'OSB Freight Changes';
                notification.User__c = freightRecord.OwnerId; 
                
                notifications.add(notification);
            }
        }

        if (!notifications.isEmpty()) {
            insert notifications;
        }
    }

}*/