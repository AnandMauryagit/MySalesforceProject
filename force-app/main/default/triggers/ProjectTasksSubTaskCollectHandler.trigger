trigger ProjectTasksSubTaskCollectHandler on SubTask__c (after update) {
TasksSubTaskCollectHandler.projectDuration(trigger.newMap);
}