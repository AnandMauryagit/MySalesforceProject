/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : UniversityAdmissionController
 * Author          : <YourName>
 * Created Date    : Sep 18, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Sep 18, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Sep 18, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public with sharing class UniversityAdmissionController {

    /*
     * Get active programs for the Admission form.
     */
    @AuraEnabled(cacheable=true)
    public static List<University_Program__c> getPrograms() {

        return [
            SELECT
                Id,
                Name,
                Program_Code__c,
                Level__c,
                Category__c,
                Duration__c,
                Eligibility__c,
                Annual_Fee__c,
                Mode__c
            FROM University_Program__c
            WHERE Active__c = true
            ORDER BY Name ASC
        ];
    }


    /*
     * Create Admission Application
     */
    @AuraEnabled
    public static Id createApplication(
        String applicantName,
        String email,
        String mobile,
        Date dateOfBirth,
        String gender,
        String address,
        String city,
        String state,
        String pincode,
        String qualification,
        Integer passingYear,
        Id programId
    ) {

        /*
         * Basic server-side validation
         */
        if (String.isBlank(applicantName)) {
            throw new AuraHandledException('Applicant Name is required.');
        }

        if (String.isBlank(email)) {
            throw new AuraHandledException('Email is required.');
        }

        if (String.isBlank(mobile)) {
            throw new AuraHandledException('Mobile number is required.');
        }

        if (programId == null) {
            throw new AuraHandledException('Please select a program.');
        }


        /*
         * Verify that selected program exists
         * and is active.
         */
        List<University_Program__c> programs = [
            SELECT Id, Name
            FROM University_Program__c
            WHERE Id = :programId
            AND Active__c = true
            LIMIT 1
        ];

        if (programs.isEmpty()) {
            throw new AuraHandledException(
                'The selected program is not available.'
            );
        }


        /*
         * Create Application
         */
        Admission_Application__c application =
            new Admission_Application__c();

        application.Name = applicantName;
        application.Email__c = email;
        application.PackagingTest32__Mobile_Number__c = mobile;
        application.Date_of_Birth__c = dateOfBirth;
        application.Gender__c = gender;
        application.Address__c = address;
        application.City__c = city;
        application.State__c = state;
        application.Pincode__c = pincode;
        application.Qualification__c = qualification;
        application.Passing_Year__c = passingYear;

        /*
         * Relationship with Program
         */
        application.PackagingTest32__University_Program__c = programId;

        /*
         * Initial application status
         */
        application.Application_Status__c = 'Submitted';

        /*
         * Application date
         */
        application.Application_Date__c = Date.today();


        insert application;

        return application.Id;
    }


    /*
     * Get a submitted application.
     * Useful for the success screen.
     */
    @AuraEnabled(cacheable=true)
    public static Admission_Application__c getApplication(Id applicationId) {

        if (applicationId == null) {
            throw new AuraHandledException(
                'Application Id is required.'
            );
        }

        return [
            SELECT
                Id,
                Name,
                Email__c,
                PackagingTest32__Mobile_Number__c,
                Application_Status__c,
                Application_Date__c,
                PackagingTest32__University_Program__c,
                PackagingTest32__University_Program__r.Name
            FROM Admission_Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];
    }
}