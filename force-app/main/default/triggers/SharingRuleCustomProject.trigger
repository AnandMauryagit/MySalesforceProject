trigger SharingRuleCustomProject on Project__c (after insert,after update){
    if(Trigger.isAfter && Trigger.isInsert){
        SharingRuleCustom.ruleAssignInsert(Trigger.New);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        SharingRuleCustom.ruleAssignUpdate(Trigger.New,Trigger.OldMap);
    }
}