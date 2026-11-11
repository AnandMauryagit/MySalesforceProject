trigger CaseAssignInQueue on Case (after insert) {
CaseAssignInQueueHandler.checkAndAssignCaseToUser(Trigger.New,Trigger.NewMap);
}