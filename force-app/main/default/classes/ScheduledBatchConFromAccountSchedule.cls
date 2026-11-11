global class ScheduledBatchConFromAccountSchedule implements Schedulable {
   global void execute(SchedulableContext sc) {
      ScheduledBatchConFromAccount b = new ScheduledBatchConFromAccount(); 
      
      Database.executeBatch(b);
   }
}