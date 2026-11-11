trigger TestingForceFully on Account (after insert,after update) {
   /* if(TestingForceFullyHandler.isFirstTime){
        TestingForceFullyHandler.isFirstTime = false;
        
        TestingForceFullyHandler.insertAccount(trigger.newMap,trigger.New,trigger.Old);
        //if(trigger.isafter && trigger.isUpdate){
            TestingForceFullyHandler.updateCheckOld(trigger.new,trigger.old);
        //}
    }*/
    if(TestingForceFullyHandler.isFirstTime) {
        TestingForceFullyHandler.isFirstTime = false;
        
        TestingForceFullyHandler.handleAccountChanges(trigger.newMap, trigger.new, trigger.old);
    }
}