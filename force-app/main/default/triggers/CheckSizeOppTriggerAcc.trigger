trigger CheckSizeOppTriggerAcc on Account (after update){
  UpdateSizeOppEquals4.toCheckOppSizeManageToFour(trigger.old);  
}