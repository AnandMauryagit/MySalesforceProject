public class DynamicUploadController{
     @AuraEnabled(cacheable=true)
    public static List<String>getObjectFields(String objectName) {
        // Retrieve field names for the specified object
        try {
            Map<String, Schema.SObjectField> fieldsMap = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap();
            system.debug('fieldsMap'+fieldsMap);
            return new List<String>(fieldsMap.keySet());
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching fields: ' + e.getMessage());
        }
    }
    @AuraEnabled
    public static void insertRecords(String objectName, String records) {
        // Insert records into the specified object
        if (String.isBlank(objectName) || String.isBlank(records)) {
            throw new AuraHandledException('Object Name and Records cannot be empty.');
        }
        List<SObject> sObjectList = new List<SObject>();
        List<Map<String, Object>> recordList = (List<Map<String, Object>>) JSON.deserializeUntyped(records);
        
        for (Map<String, Object> recordMap : recordList) {
            SObject sObjectRecord = (SObject) Schema.getGlobalDescribe().get(objectName).newSObject(null, true);
            for (String fieldName : recordMap.keySet()) {
                sObjectRecord.put(fieldName, recordMap.get(fieldName));
            }
            sObjectList.add(sObjectRecord);
        }
        try {
            insert sObjectList;
            system.debug('sObjectList'+sObjectList);
        } catch (Exception e) {
            throw new AuraHandledException('Error inserting records: ' + e.getMessage());
        }
    }
}