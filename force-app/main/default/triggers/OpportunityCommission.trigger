trigger OpportunityCommission on Opportunity (after update) {
  OpportunityCommissionHandler.OppRecCompare(trigger.new,trigger.oldMap);
}