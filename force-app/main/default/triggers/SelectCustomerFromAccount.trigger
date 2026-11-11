trigger SelectCustomerFromAccount on Cart_c__c (before insert, before update){
SelectCustomerFromAccountsHandler.getAccountCustomerSelected(trigger.new);
}