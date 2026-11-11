trigger ConTovaliAccAndUser on Contact (before insert, before update) {
    if(trigger.isBefore && trigger.isInsert){
        ConTovaliAccAndUserhandler.filterDuplicateWithAccUser(trigger.New);
    }
    

}