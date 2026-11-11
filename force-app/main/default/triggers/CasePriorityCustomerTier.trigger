trigger CasePriorityCustomerTier on Case (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
CasePriorityCustomerTierHandler.compareCustomerTierInsert(Trigger.New);
    }
    if(trigger.isBefore && trigger.isUpdate){
      CasePriorityCustomerTierHandler.compareCustomerTierUpdate(Trigger.new,Trigger.oldMap);  
    }
}