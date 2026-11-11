trigger AfterUpdatetrigger on Obj_A__c (after update) {// Step 1: Collect the updated ObjectA__c records with non-zero "Amount" field
    List<Obj_A__c> updatedObjectAList = new List<Obj_A__c>();
    for (Obj_A__c aRecord : Trigger.new) {
        if (aRecord.Amount__c != Trigger.oldMap.get(aRecord.Id).Amount__c) {
            updatedObjectAList.add(aRecord);
        }
    }    
    if (updatedObjectAList.isEmpty()) {
        return;
    }                                      // Step 2: Calculate the total amount to distribute among ObjectB__c records
    Decimal totalAmount = 0;
    for (Obj_A__c aRecord : updatedObjectAList) {
        totalAmount += aRecord.Amount__c;
    }                               // Step 3: Calculate the amount to be equally distributed to each ObjectB__c record
    Decimal amountPerBRecord = totalAmount / updatedObjectAList.size();   // Step 4: Create a map to hold ObjectB__c records to be updated
    Map<Id, Obj_B__c> bRecordsToUpdate = new Map<Id, Obj_B__c>();    // Step 5: Update ObjectB__c records
    for (Obj_A__c aRecord : updatedObjectAList) {
        List<Obj_B__c> childBRecords = [SELECT Id, Amount__c FROM Obj_B__c WHERE Obj_A__c = :aRecord.Id];
        for (Obj_B__c bRecord : childBRecords) {
            bRecord.Amount__c = amountPerBRecord;
            bRecordsToUpdate.put(bRecord.Id, bRecord);
        }
    }
    if (!bRecordsToUpdate.isEmpty()) {
        update bRecordsToUpdate.values();
    }                              // Step 6: Calculate the amount to be equally distributed to each ObjectC__c record
    Decimal amountPerCRecord = amountPerBRecord / [SELECT COUNT() FROM Obj_C__c WHERE Obj_B__c IN :bRecordsToUpdate.keySet()];    // Step 7: Create a list to hold ObjectC__c records to be updated
    List<Obj_C__c> cRecordsToUpdate = new List<Obj_C__c>();                     // Step 8: Update ObjectC__c records
    for (Obj_B__c bRecord : bRecordsToUpdate.values()) {
        List<Obj_C__c> childCRecords = [SELECT Id, Amount__c FROM Obj_C__c WHERE Obj_B__c = :bRecord.Id];
        for (Obj_C__c cRecord : childCRecords) {
            cRecord.Amount__c = amountPerCRecord;
            cRecordsToUpdate.add(cRecord);
        }
    }
    if (!cRecordsToUpdate.isEmpty()) {
        update cRecordsToUpdate;
    }
}