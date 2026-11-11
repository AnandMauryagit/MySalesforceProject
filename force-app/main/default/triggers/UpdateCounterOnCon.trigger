trigger UpdateCounterOnCon on Account (after update) {
    if(trigger.isAfter && trigger.isupdate){
        UpdateCounterOnConHandler.contactUpdation(trigger.new,trigger.oldMap);
    }
}