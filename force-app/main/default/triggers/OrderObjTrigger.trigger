trigger OrderObjTrigger on Oder__c (before insert) {
orderObjHndler.orderAccountAnd(trigger.new);
}