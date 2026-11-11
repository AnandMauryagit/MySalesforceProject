trigger UpdateCounterOnAcc on Contact (before insert,after update) {
    if(trigger.isBefore && trigger.isInsert){
        UpdateCounterOnAccHandler.assignCon(trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate){
        UpdateCounterOnAccHandler.updateAccProcess(trigger.new,trigger.oldMap);
    }
}