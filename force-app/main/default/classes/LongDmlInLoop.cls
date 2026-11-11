public class LongDmlInLoop {
    public static void crossLimits(){
        // Use this format if you are not executing DML statements 
        // within the for loop
        for (Account a : [SELECT Id, Name FROM Account 
                          WHERE Name LIKE 'Acme%']) {
                              // Your code without DML statements here
                          }
        
        // Use this format for efficiency if you are executing DML statements 
        // within the for loop
        for (List<Account> accts : [SELECT Id, Name FROM Account]) {
            for (Account a : accts) {
                // Your code here
                a.Name += 'A';
            }
            update accts;
        }
    }
}