trigger CaseToCalculateAmout on Case (after insert ,after update ,After delete){
    if(trigger.IsInsert){
        CaseToCalculateAmountHandler.compareMaxAndMin(trigger.new ,trigger.oldMap);
    }
    if(trigger.IsUpdate){
        CaseToCalculateAmountHandler.compareMaxAndMin(trigger.new,trigger.oldMap);
    }
    
}