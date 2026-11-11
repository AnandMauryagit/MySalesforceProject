trigger TriggerAccountRequest on Account_Request__c (after update){
    if (trigger.isupdate && trigger.isafter){
       CreateAccountContactOnApproval.AfterApprovCreateAccCon(trigger.new);
    }
}