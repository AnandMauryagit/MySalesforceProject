trigger OrderLineItemAmountAndRemainingQuan on OrderLineitem__c ( before insert,before update  ) {
O2rderLineItemAmountAhandler.Amount_utopopulate_on_amount_and_Quantity(trigger.new,trigger.oldMap);
}