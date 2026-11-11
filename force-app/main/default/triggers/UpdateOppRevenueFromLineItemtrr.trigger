trigger UpdateOppRevenueFromLineItemtrr on Opportunity_LineItem__c (after insert,after update) {
    if(trigger.isafter&& trigger.isinsert){
      UpdateOppRevenueFromLineItemHandler.insertRevenue(trigger.new);  
    }
    if(trigger.isafter && trigger.isupdate){
UpdateOppRevenueFromLineItemHandler.assignRevenue(trigger.newMap,trigger.oldMap);
    }
}