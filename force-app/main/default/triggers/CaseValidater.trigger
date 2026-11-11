trigger CaseValidater on Case (before insert) {
CaseValidatorHandler.validatForCreateRecords(trigger.new);
}