trigger ObjAInsertTriggers on Obj_A__c (after update) {
If(trigger.isafter && Trigger.isupdate){
        UpdateObjAAndObjBWhileAupdate.updateRecordA(Trigger.New );
    }Else{
        //CreateConOppnameInsert.updateAccRecToCon(Trigger.New , Trigger.OldMap);
    }
}