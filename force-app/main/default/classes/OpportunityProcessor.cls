public class OpportunityProcessor {
    //Apex Class with Database Rollback (Savepoint):
    public static void processOpportunities(List<Opportunity> oppsToUpdate) {
        // Create a savepoint
        Savepoint sp = Database.setSavepoint();
        
        try {
            // Perform some updates on opportunities
            update oppsToUpdate;
        } catch (Exception e) {
            // Rollback changes if an exception occurs
            Database.rollback(sp);
            System.debug('Rollback executed due to exception: ' + e.getMessage());
        }
    }
    //Apex Class with Custom Exception Handling:
    public class MyCustomException extends Exception {}
    
    public static void process() {
        try {
            // Some operation that may throw an exception
            Integer result = 10 / 0; // This will cause a division by zero exception
        } catch (Exception e) {
            throw new MyCustomException('An error occurred: ' + e.getMessage());
        }
    }
    
    
    public static Integer divide(Integer dividend, Integer divisor) {
 // Ensure divisor is not zero
 System.assert(divisor != 0, 'Divisor cannot be zero.');
 return dividend / divisor;
 }
}