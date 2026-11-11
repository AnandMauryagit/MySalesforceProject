trigger ContactprimaryCustomer on Contact (before insert, after update) {
    if(trigger.isBefore && trigger.isinsert){
ContactprimaryCustomerHandler.insertContact(trigger.new);
    }
    else{
       ContactprimaryCustomerHandler.updateContact(trigger.new, trigger.oldMap); 
    }
}