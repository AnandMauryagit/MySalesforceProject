/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : UniversityStudentServiceController
 * Author          : <YourName>
 * Created Date    : Sep 23, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Sep 23, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Sep 23, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public with sharing class UniversityStudentServiceController {

    /*
     * ============================================================
     * GET STUDENT DASHBOARD
     * ============================================================
     *
     * Student is identified using the logged-in Salesforce
     * user's email address.
     *
     * Admission records are matched using:
     * PackagingTest32__Email__c
     *
     * Service requests are matched using:
     * PackagingTest32__Student_Email__c
     * ============================================================
     */
    @AuraEnabled(cacheable=true)
    public static StudentDashboardWrapper getStudentDashboard() {

        String studentEmail = UserInfo.getUserEmail();

        if (String.isBlank(studentEmail)) {
            throw new AuraHandledException(
                'Unable to identify the current student.'
            );
        }


        /*
         * ========================================================
         * GET ADMISSION APPLICATIONS
         * ========================================================
         */
        List<PackagingTest32__Admission_Application__c> applications = [
            SELECT
                Id,
                Name,

                PackagingTest32__Email__c,
                PackagingTest32__Mobile_Number__c,
                PackagingTest32__Date_of_Birth__c,
                PackagingTest32__Gender__c,

                PackagingTest32__Application_Number__c,
                PackagingTest32__Application_Status__c,

                PackagingTest32__Address__c,
                PackagingTest32__City__c,
                PackagingTest32__State__c,
                PackagingTest32__Pincode__c,

                PackagingTest32__Qualification__c,
                PackagingTest32__Passing_Year__c,

                PackagingTest32__Application_Date__c,

                PackagingTest32__University_Program__c,

                PackagingTest32__University_Program__r.Name,
                PackagingTest32__University_Program__r.PackagingTest32__Program_Code__c,
                PackagingTest32__University_Program__r.PackagingTest32__Level__c,
                PackagingTest32__University_Program__r.PackagingTest32__Duration__c,
                PackagingTest32__University_Program__r.PackagingTest32__Mode__c,
                PackagingTest32__University_Program__r.PackagingTest32__Annual_Fee__c

            FROM PackagingTest32__Admission_Application__c

            WHERE PackagingTest32__Email__c = :studentEmail

            ORDER BY PackagingTest32__Application_Date__c DESC
        ];


        /*
         * ========================================================
         * GET SERVICE REQUESTS
         * ========================================================
         */
        List<PackagingTest32__Student_Service_Request__c> requests = [
            SELECT
                Id,
                Name,

                PackagingTest32__Student_Email__c,

                PackagingTest32__Application__c,

                PackagingTest32__Application__r.Name,

                PackagingTest32__Request_Type__c,
                PackagingTest32__Subject__c,
                PackagingTest32__Status__c,
                PackagingTest32__Priority__c,

                CreatedDate

            FROM PackagingTest32__Student_Service_Request__c

            WHERE PackagingTest32__Student_Email__c = :studentEmail

            ORDER BY CreatedDate DESC

            LIMIT 20
        ];


        /*
         * ========================================================
         * CREATE WRAPPER
         * ========================================================
         */
        StudentDashboardWrapper wrapper =
            new StudentDashboardWrapper();


        wrapper.studentEmail =
            studentEmail;


        /*
         * We don't have Applicant_Name__c on the
         * Admission Application object.
         *
         * Therefore use the current Salesforce user's name.
         */
        wrapper.studentName =
            UserInfo.getName();


        wrapper.applications =
            applications;


        wrapper.requests =
            requests;


        /*
         * ========================================================
         * LATEST APPLICATION
         * ========================================================
         */
        if (!applications.isEmpty()) {

            PackagingTest32__Admission_Application__c
                latestApplication =
                    applications[0];


            wrapper.latestApplication =
                latestApplication;


            wrapper.mobile =
                latestApplication
                    .PackagingTest32__Mobile_Number__c;
        }


        return wrapper;
    }


    /*
     * ============================================================
     * CREATE SERVICE REQUEST
     * ============================================================
     */
    @AuraEnabled
    public static Id createServiceRequest(
        String requestType,
        String subject,
        String priority,
        Id applicationId
    ) {

        String studentEmail =
            UserInfo.getUserEmail();


        /*
         * ========================================================
         * VALIDATION
         * ========================================================
         */

        if (String.isBlank(requestType)) {

            throw new AuraHandledException(
                'Please select a request type.'
            );
        }


        if (String.isBlank(subject)) {

            throw new AuraHandledException(
                'Please enter a subject.'
            );
        }


        if (String.isBlank(studentEmail)) {

            throw new AuraHandledException(
                'Unable to identify the current student.'
            );
        }


        /*
         * ========================================================
         * OPTIONAL APPLICATION VALIDATION
         * ========================================================
         *
         * If the student selected an application, make sure
         * that application actually belongs to the logged-in
         * student.
         * ========================================================
         */

        if (applicationId != null) {

            List<PackagingTest32__Admission_Application__c>
                applications = [

                    SELECT
                        Id,
                        PackagingTest32__Email__c

                    FROM PackagingTest32__Admission_Application__c

                    WHERE Id = :applicationId

                    AND PackagingTest32__Email__c = :studentEmail

                    LIMIT 1
                ];


            if (applications.isEmpty()) {

                throw new AuraHandledException(
                    'The selected application does not belong to the current student.'
                );
            }
        }


        /*
         * ========================================================
         * CREATE SERVICE REQUEST
         * ========================================================
         */

        PackagingTest32__Student_Service_Request__c request =
            new PackagingTest32__Student_Service_Request__c();


        request.PackagingTest32__Student_Email__c =
            studentEmail;


        request.PackagingTest32__Application__c =
            applicationId;


        request.PackagingTest32__Request_Type__c =
            requestType;


        request.PackagingTest32__Subject__c =
            subject;


        request.PackagingTest32__Priority__c =
            String.isBlank(priority)
                ? 'Medium'
                : priority;


        request.PackagingTest32__Status__c =
            'Open';


        insert request;


        return request.Id;
    }


    /*
     * ============================================================
     * WRAPPER CLASS
     * ============================================================
     */
    public class StudentDashboardWrapper {

        @AuraEnabled
        public String studentName;


        @AuraEnabled
        public String studentEmail;


        @AuraEnabled
        public String mobile;


        @AuraEnabled
        public PackagingTest32__Admission_Application__c
            latestApplication;


        @AuraEnabled
        public List<PackagingTest32__Admission_Application__c>
            applications;


        @AuraEnabled
        public List<PackagingTest32__Student_Service_Request__c>
            requests;
    }
}