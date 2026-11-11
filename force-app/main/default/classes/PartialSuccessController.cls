public with sharing class PartialSuccessController {

    @AuraEnabled
    public static PartialSuccessResponse insertAccounts() {

        List<Account> accountsToInsert = new List<Account>();

        // Creating 10 demo records
        for (Integer i = 1; i <= 10; i++) {

            Account acc = new Account();

            // First 5 records will be valid
            if (i <= 5) {
                acc.Name = 'Partial Success Account ' + i;
            }

            // Last 5 records will fail
            // Name is intentionally left blank
            else {
                acc.Name = null;
            }

            accountsToInsert.add(acc);
        }

        // false = partial success
        Database.SaveResult[] results =
            Database.insert(accountsToInsert, false);

        PartialSuccessResponse response =
            new PartialSuccessResponse();

        response.totalRecords = accountsToInsert.size();

        for (Integer i = 0; i < results.size(); i++) {

            Database.SaveResult result = results[i];

            RecordResult recordResult = new RecordResult();

            recordResult.recordName = accountsToInsert[i].Name;
            recordResult.success = result.isSuccess();

            if (result.isSuccess()) {

                recordResult.recordId = result.getId();
                recordResult.status = 'SUCCESS';
                recordResult.message = 'Record inserted successfully';

                response.successCount++;

            } else {

                recordResult.status = 'FAILED';

                response.failedCount++;

                Database.Error[] errors = result.getErrors();

                List<String> errorMessages = new List<String>();

                for (Database.Error error : errors) {

                    errorMessages.add(
                        String.valueOf(error.getStatusCode()) +
                        ': ' +
                        error.getMessage()
                    );
                }

                recordResult.message =
                    String.join(errorMessages, ' | ');
            }

            if (recordResult.success) {
                response.successRecords.add(recordResult);
            } else {
                response.failedRecords.add(recordResult);
            }
        }

        return response;
    }


    // Response returned to LWC
    public class PartialSuccessResponse {

        @AuraEnabled
        public Integer totalRecords;

        @AuraEnabled
        public Integer successCount = 0;

        @AuraEnabled
        public Integer failedCount = 0;

        @AuraEnabled
        public List<RecordResult> successRecords =
            new List<RecordResult>();

        @AuraEnabled
        public List<RecordResult> failedRecords =
            new List<RecordResult>();
    }


    // Individual record result
    public class RecordResult {

        @AuraEnabled
        public String recordName;

        @AuraEnabled
        public String recordId;

        @AuraEnabled
        public Boolean success;

        @AuraEnabled
        public String status;

        @AuraEnabled
        public String message;
    }
}