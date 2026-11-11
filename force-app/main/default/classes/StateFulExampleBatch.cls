global class StateFulExampleBatch implements Database.Batchable<SObject>, Database.Stateful {

    // Instance variables to maintain state
    global Set<Id> processedContactIds = new Set<Id>();  // Set to track processed contact IDs
    global Integer totalContactsProcessed = 0;           // Counter for total contacts processed
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // Query contacts to be processed
        return Database.getQueryLocator([SELECT Id, FirstName, LastName FROM Contact LIMIT 50]);
    }

    global void execute(Database.BatchableContext bc, List<Contact> scope) {
        // List to store contacts to update
        List<Contact> contactsToUpdate = new List<Contact>();

        for (Contact con : scope) {
            // Check if the contact has already been processed
            if (processedContactIds.contains(con.Id)) {
                System.debug('Contact already processed: ' + con.FirstName + ' ' + con.LastName + ' (ID: ' + con.Id + ')');
            } else {
                // Process the contact and update the AssistantName field
                con.AssistantName = 'Processed by Batch finally';
                contactsToUpdate.add(con);

                // Track the processed contact in the Set
                processedContactIds.add(con.Id);
                totalContactsProcessed++; // Increment the counter
            }
        }
        
        if (!contactsToUpdate.isEmpty()) {
            // Update processed contacts in the database
            update contactsToUpdate;
        }
    }

    global void finish(Database.BatchableContext bc) {
        // Log the total number of unique contacts processed
        System.debug('Total unique contacts processed across batches: ' + totalContactsProcessed);
    }
}