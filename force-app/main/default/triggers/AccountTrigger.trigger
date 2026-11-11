trigger AccountTrigger on Account (before insert,after insert,before update,after update) {
   if(trigger.isInsert){
      if(trigger.isBefore){
        Accounttriggerhandler.beforeInsert(Trigger.New);
         }else if(trigger.isAfter){
             Accounttriggerhandler.createRelatedOpportunity(Trigger.New);  
         }
    }
    if(trigger.isupdate){
      if(trigger.isBefore){
        Accounttriggerhandler.beforeupdatephoneDescription(Trigger.New,Trigger.oldMap);
         }else if(trigger.isAfter){
             Accounttriggerhandler.createRelatedOpportunityUpdatePhone(Trigger.new,Trigger.oldMap);  
         }
    }
    
    
}