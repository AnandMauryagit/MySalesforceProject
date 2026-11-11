public with sharing class SavepointDemoController {

    // =========================================================
    // MAIN METHOD
    // =========================================================

    @AuraEnabled
    public static String runSavepointDemo(
        String accountName,
        String accountPhone,
        String accountIndustry,
        String accountWebsite,
        String contactFirstName,
        String contactLastName,
        String contactEmail,
        String contactPhone,
        String opportunityName,
        Decimal opportunityAmount,
        String opportunityStage,
        String opportunityCloseDate
    ) {

        Savepoint sp = null;

        try {

            System.debug('========== DEMO START ==========');


            // =================================================
            // METHOD 1 - ACCOUNT
            // =================================================

            System.debug('METHOD 1: Creating Account');

            Account acc = createAccount(
                accountName,
                accountPhone,
                accountIndustry,
                accountWebsite
            );

            System.debug(
                'Account Created: ' + acc.Id
            );


            // =================================================
            // SAVEPOINT
            // =================================================

            System.debug('Creating Savepoint');

            sp = Database.setSavepoint();

            System.debug('Savepoint Created');


            // =================================================
            // METHOD 2 - CONTACT
            // =================================================

            System.debug('METHOD 2: Creating Contact');

            Contact con = createContact(
                contactFirstName,
                contactLastName,
                contactEmail,
                contactPhone,
                acc.Id
            );

            System.debug(
                'Contact Created: ' + con.Id
            );


            // =================================================
            // METHOD 3 - OPPORTUNITY
            // =================================================

            System.debug('METHOD 3: Creating Opportunity');

            Opportunity opp = createOpportunity(
                opportunityName,
                opportunityAmount,
                opportunityStage,
                opportunityCloseDate,
                acc.Id
            );

            System.debug(
                'Opportunity Created: ' + opp.Id
            );


            // =================================================
            // INTENTIONAL ERROR
            // =================================================

            System.debug(
                'Generating intentional error'
            );

            throw new DemoException(
                'Intentional error after all three records were inserted.'
            );


        } catch (Exception e) {

            System.debug('========== ERROR ==========');

            System.debug(
                'Error Type: ' +
                e.getTypeName()
            );

            System.debug(
                'Error Message: ' +
                e.getMessage()
            );


            // =================================================
            // ROLLBACK
            // =================================================

            if (sp != null) {

                System.debug(
                    'Rolling back to Savepoint'
                );

                Database.rollback(sp);

                System.debug(
                    'Rollback completed'
                );
            }


            // =================================================
            // SEND RESULT TO LWC
            // =================================================

            return 'SUCCESS|' +
                'Savepoint rollback completed. ' +
                'Account was kept. ' +
                'Contact and Opportunity were rolled back. ' +
                'Error: ' +
                e.getMessage();
        }
    }


    // =========================================================
    // METHOD 1 - CREATE ACCOUNT
    // =========================================================

    private static Account createAccount(
        String accountName,
        String accountPhone,
        String accountIndustry,
        String accountWebsite
    ) {

        System.debug(
            '----- ACCOUNT METHOD START -----'
        );

        Account acc = new Account();

        acc.Name = accountName;


        if (String.isNotBlank(accountPhone)) {

            acc.Phone = accountPhone;
        }


        if (String.isNotBlank(accountIndustry)) {

            acc.Industry = accountIndustry;
        }


        if (String.isNotBlank(accountWebsite)) {

            acc.Website = accountWebsite;
        }


        insert acc;


        System.debug(
            'Account Inserted: ' +
            acc.Id
        );


        return acc;
    }


    // =========================================================
    // METHOD 2 - CREATE CONTACT
    // =========================================================

    private static Contact createContact(
        String firstName,
        String lastName,
        String email,
        String phone,
        Id accountId
    ) {

        System.debug(
            '----- CONTACT METHOD START -----'
        );

        Contact con = new Contact();


        if (String.isNotBlank(firstName)) {

            con.FirstName =
                firstName;
        }


        con.LastName =
            lastName;


        if (String.isNotBlank(email)) {

            con.Email =
                email;
        }


        if (String.isNotBlank(phone)) {

            con.Phone =
                phone;
        }


        con.AccountId =
            accountId;


        insert con;


        System.debug(
            'Contact Inserted: ' +
            con.Id
        );


        return con;
    }


    // =========================================================
    // METHOD 3 - CREATE OPPORTUNITY
    // =========================================================

    private static Opportunity createOpportunity(
        String opportunityName,
        Decimal opportunityAmount,
        String opportunityStage,
        String opportunityCloseDate,
        Id accountId
    ) {

        System.debug(
            '----- OPPORTUNITY METHOD START -----'
        );

        Opportunity opp =
            new Opportunity();


        opp.Name =
            opportunityName;


        opp.AccountId =
            accountId;


        opp.StageName =
            opportunityStage;


        opp.CloseDate =
            Date.valueOf(
                opportunityCloseDate
            );


        if (opportunityAmount != null) {

            opp.Amount =
                opportunityAmount;
        }


        insert opp;


        System.debug(
            'Opportunity Inserted: ' +
            opp.Id
        );


        // IMPORTANT:
        // DO NOT THROW ERROR HERE.
        //
        // We throw the intentional error in the MAIN METHOD
        // AFTER this method returns.
        //
        // This allows this method to return normally.

        return opp;
    }


    // =========================================================
    // CUSTOM EXCEPTION
    // =========================================================

    public class DemoException extends Exception {
    }
}