trigger CartClculations on Cart_Item__c (before insert) {
    if(trigger.isbefore && trigger.isinsert){
    CartitemAmountCalculation.Amount_utopopulate_on_amount_and_Quantity(trigger.new);
}
}