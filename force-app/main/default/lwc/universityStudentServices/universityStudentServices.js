import { LightningElement, wire } from 'lwc';

import { refreshApex } from '@salesforce/apex';

import getStudentDashboard
    from '@salesforce/apex/UniversityStudentServiceController.getStudentDashboard';

import createServiceRequest
    from '@salesforce/apex/UniversityStudentServiceController.createServiceRequest';


export default class UniversityStudentServices extends LightningElement {

    // =========================================================
    // LOADING / ERROR
    // =========================================================

    isLoading = true;
    errorMessage = '';

    showSuccessMessage = false;
    successMessage = '';


    // =========================================================
    // STUDENT INFORMATION
    // =========================================================

    studentName = 'Student';
    studentEmail = '';
    studentMobile = '';
    studentCity = '';
    studentState = '';


    // =========================================================
    // DASHBOARD DATA
    // =========================================================

    applications = [];
    requests = [];
    latestApplication;


    // Stores the wired Apex response.
    // Required for refreshApex().
    wiredDashboardResult;


    // =========================================================
    // SERVICE REQUEST MODAL
    // =========================================================

    showRequestModal = false;
    isSubmittingRequest = false;
    requestError = '';

    requestType = '';
    priority = 'Medium';
    subject = '';
    applicationId = '';


    // =========================================================
    // GET STUDENT DASHBOARD
    // =========================================================

    @wire(getStudentDashboard)
    wiredDashboard(result) {

        this.wiredDashboardResult = result;

        if (result.data) {

            console.log(
                'Student Dashboard Result:',
                result.data
            );

            const data = result.data;


            // ---------------------------------------------
            // Student information
            // ---------------------------------------------

            this.studentEmail =
                data.studentEmail || '';

            this.studentName =
                data.studentName || 'Student';


            // ---------------------------------------------
            // Applications
            // ---------------------------------------------

            this.applications =
                data.applications || [];


            // ---------------------------------------------
            // Service Requests
            // ---------------------------------------------

            this.requests =
                this.prepareRequests(
                    data.requests || []
                );


            // ---------------------------------------------
            // Latest Application
            // ---------------------------------------------

            this.latestApplication =
                data.latestApplication;


            // ---------------------------------------------
            // Student information from latest application
            // ---------------------------------------------

            if (this.latestApplication) {

                this.studentMobile =
                    this.latestApplication
                        .PackagingTest32__Mobile_Number__c || '';

                this.studentCity =
                    this.latestApplication
                        .PackagingTest32__City__c || '';

                this.studentState =
                    this.latestApplication
                        .PackagingTest32__State__c || '';
            }


            this.errorMessage = '';
            this.isLoading = false;

        } else if (result.error) {

            console.error(
                'Student dashboard error:',
                result.error
            );

            this.errorMessage =
                this.getErrorMessage(result.error);

            this.isLoading = false;
        }
    }


    // =========================================================
    // PREPARE SERVICE REQUESTS
    // =========================================================

    prepareRequests(requests) {

        return requests.map(request => {

            let statusClass =
                'request-status';

            const status =
                request.PackagingTest32__Status__c;


            if (status === 'Open') {

                statusClass +=
                    ' status-open';

            } else if (status === 'In Progress') {

                statusClass +=
                    ' status-progress';

            } else if (status === 'Resolved') {

                statusClass +=
                    ' status-resolved';

            } else if (status === 'Closed') {

                statusClass +=
                    ' status-closed';
            }


            return {

                ...request,

                statusClass,

                createdDate:
                    this.formatDate(
                        request.CreatedDate
                    ),

                requestType:
                    request.PackagingTest32__Request_Type__c,

                requestSubject:
                    request.PackagingTest32__Subject__c,

                requestStatus:
                    request.PackagingTest32__Status__c,

                requestPriority:
                    request.PackagingTest32__Priority__c
            };
        });
    }


    // =========================================================
    // GETTERS
    // =========================================================

    get showDashboard() {

        return !this.isLoading &&
               !this.errorMessage;
    }


    get applicationCount() {

        return this.applications.length;
    }


    get requestCount() {

        return this.requests.length;
    }


    get hasApplication() {

        return !!this.latestApplication;
    }


    get hasRequests() {

        return this.requests.length > 0;
    }


    // =========================================================
    // LATEST APPLICATION
    // =========================================================

    get latestProgramName() {

        if (
            this.latestApplication &&
            this.latestApplication
                .PackagingTest32__University_Program__r
        ) {

            return this.latestApplication
                .PackagingTest32__University_Program__r
                .Name;
        }

        return 'Program information unavailable';
    }


    get latestApplicationDate() {

        if (!this.latestApplication) {
            return '';
        }

        return this.formatDate(
            this.latestApplication
                .PackagingTest32__Application_Date__c
        );
    }


    get latestApplicationStatus() {

        if (!this.latestApplication) {
            return 'Not Available';
        }

        return (
            this.latestApplication
                .PackagingTest32__Application_Status__c
            || 'Not Available'
        );
    }


    get applicationStatusClass() {

        const status =
            this.latestApplicationStatus;


        if (status === 'Approved') {

            return 'application-status status-approved';
        }


        if (status === 'Submitted') {

            return 'application-status status-submitted';
        }


        if (status === 'Pending') {

            return 'application-status status-pending';
        }


        if (status === 'Rejected') {

            return 'application-status status-rejected';
        }


        return 'application-status';
    }


    // =========================================================
    // APPLICATION PROGRESS
    // =========================================================

    get submittedProgressClass() {

        const status =
            this.latestApplicationStatus;


        if (
            status === 'Submitted' ||
            status === 'Approved'
        ) {

            return 'progress-step completed';
        }


        return 'progress-step active';
    }


    get reviewProgressClass() {

        const status =
            this.latestApplicationStatus;


        if (status === 'Approved') {

            return 'progress-step completed';
        }


        if (status === 'Submitted') {

            return 'progress-step active';
        }


        return 'progress-step';
    }


    get approvalProgressClass() {

        if (
            this.latestApplicationStatus === 'Approved'
        ) {

            return 'progress-step completed';
        }


        return 'progress-step';
    }


    // =========================================================
    // APPLICATION OPTIONS
    // =========================================================

    get applicationOptions() {

        return this.applications.map(
            application => {

                return {

                    label:
                        application.Name ||
                        application.PackagingTest32__Application_Number__c ||
                        'Application',

                    value:
                        application.Id
                };
            }
        );
    }


    // =========================================================
    // REQUEST TYPE OPTIONS
    // =========================================================
    //
    // IMPORTANT:
    // These values MUST exactly match the active
    // Request Type picklist values in Salesforce.
    //
    // Update only these values if your Salesforce
    // picklist uses different values.
    // =========================================================

    get requestTypeOptions() {

        return [

            {
                label: 'Admission',
                value: 'Admission'
            },

            {
                label: 'Documents',
                value: 'Documents'
            },

            {
                label: 'Fees & Payment',
                value: 'Fees & Payment'
            },

            {
                label: 'Examination',
                value: 'Examination'
            },

            {
                label: 'Academic',
                value: 'Academic'
            },

            {
                label: 'Technical Support',
                value: 'Technical Support'
            },

            {
                label: 'Other',
                value: 'Other'
            }
        ];
            }


    // =========================================================
    // PRIORITY OPTIONS
    // =========================================================

    get priorityOptions() {

        return [

            {
                label: 'Low',
                value: 'Low'
            },

            {
                label: 'Medium',
                value: 'Medium'
            },

            {
                label: 'High',
                value: 'High'
            }
        ];
    }


    // =========================================================
    // REQUEST BUTTON LABEL
    // =========================================================

    get requestButtonLabel() {

        return this.isSubmittingRequest
            ? 'Submitting...'
            : 'Submit Request';
    }


    // =========================================================
    // QUICK ACTIONS
    // =========================================================

    handleQuickAction(event) {

        const action =
            event.currentTarget.dataset.action;


        console.log(
            'Quick Action:',
            action
        );


        if (action === 'request') {

            this.openRequestModal();

        } else if (action === 'applications') {

            this.scrollToSection(
                '.applications-section'
            );

        } else if (action === 'requests') {

            this.scrollToSection(
                '.requests-section'
            );

        } else {

            this.showComingSoon(action);
        }
    }


    // =========================================================
    // SCROLL TO SECTION
    // =========================================================

    scrollToSection(selector) {

        const section =
            this.template.querySelector(selector);


        if (section) {

            section.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    }


    // =========================================================
    // COMING SOON
    // =========================================================

    showComingSoon(feature) {

        console.log(
            feature + ' feature selected'
        );
    }


    // =========================================================
    // OPEN REQUEST MODAL
    // =========================================================

    openRequestModal() {

        this.requestError = '';
        this.showRequestModal = true;
    }


    // =========================================================
    // CLOSE REQUEST MODAL
    // =========================================================

    closeRequestModal() {

        if (this.isSubmittingRequest) {
            return;
        }


        this.showRequestModal = false;

        this.resetRequestForm();
    }


    // =========================================================
    // RESET REQUEST FORM
    // =========================================================

    resetRequestForm() {

        this.requestType = '';
        this.priority = 'Medium';
        this.subject = '';
        this.applicationId = '';
        this.requestError = '';
    }


    // =========================================================
    // HANDLE REQUEST INPUT
    // =========================================================

    handleRequestInput(event) {

        const fieldName =
            event.target.name;


        const value =
            event.detail?.value ??
            event.target.value;


        if (fieldName === 'requestType') {

            this.requestType = value;

        } else if (fieldName === 'priority') {

            this.priority = value;

        } else if (fieldName === 'subject') {

            this.subject = value;

        } else if (fieldName === 'applicationId') {

            this.applicationId = value;
        }
    }


    // =========================================================
    // SUBMIT SERVICE REQUEST
    // =========================================================

    async submitRequest() {

        this.requestError = '';


        // ---------------------------------------------
        // Validation
        // ---------------------------------------------

        if (!this.requestType) {

            this.requestError =
                'Please select a request type.';

            return;
        }


        if (
            !this.subject ||
            !this.subject.trim()
        ) {

            this.requestError =
                'Please enter a subject.';

            return;
        }


        // ---------------------------------------------
        // Start submission
        // ---------------------------------------------

        this.isSubmittingRequest = true;


        try {

            // -----------------------------------------
            // Create actual Salesforce record
            // -----------------------------------------

            const recordId =
                await createServiceRequest({

                    requestType:
                        this.requestType,

                    subject:
                        this.subject.trim(),

                    priority:
                        this.priority,

                    applicationId:
                        this.applicationId || null
                });


            console.log(
                'Service request created:',
                recordId
            );


            // -----------------------------------------
            // Close modal
            // -----------------------------------------

            this.showRequestModal = false;


            // -----------------------------------------
            // Reset form
            // -----------------------------------------

            this.resetRequestForm();


            // -----------------------------------------
            // Success message
            // -----------------------------------------

            this.successMessage =
                'Service request submitted successfully.';

            this.showSuccessMessage = true;


            // -----------------------------------------
            // Refresh actual Salesforce data
            // -----------------------------------------

            await refreshApex(
                this.wiredDashboardResult
            );


            // -----------------------------------------
            // Hide success message
            // -----------------------------------------

            setTimeout(() => {

                this.showSuccessMessage = false;

            }, 4000);


        } catch (error) {

            console.error(
                'Create service request error:',
                error
            );


            this.requestError =
                this.getErrorMessage(error);


        } finally {

            this.isSubmittingRequest = false;
        }
    }


    // =========================================================
    // FORMAT DATE
    // =========================================================

    formatDate(value) {

        if (!value) {
            return '';
        }


        try {

            return new Intl.DateTimeFormat(
                'en-IN',
                {
                    day: '2-digit',
                    month: 'short',
                    year: 'numeric'
                }
            ).format(
                new Date(value)
            );


        } catch (error) {

            console.error(
                'Date formatting error:',
                error
            );

            return value;
        }
    }


    // =========================================================
    // ERROR HANDLING
    // =========================================================

    getErrorMessage(error) {

        if (!error) {

            return 'An unexpected error occurred.';
        }


        // ---------------------------------------------
        // Aura/LWC page errors
        // ---------------------------------------------

        if (
            error.body &&
            error.body.message
        ) {

            return error.body.message;
        }


        // ---------------------------------------------
        // Field errors
        // ---------------------------------------------

        if (
            error.body &&
            error.body.fieldErrors
        ) {

            const fieldErrors =
                error.body.fieldErrors;


            const messages = [];


            Object.keys(fieldErrors)
                .forEach(fieldName => {

                    const errors =
                        fieldErrors[fieldName];


                    errors.forEach(fieldError => {

                        if (fieldError.message) {

                            messages.push(
                                fieldError.message
                            );
                        }
                    });
                });


            if (messages.length > 0) {

                return messages.join(', ');
            }
        }


        // ---------------------------------------------
        // Array error response
        // ---------------------------------------------

        if (
            error.body &&
            Array.isArray(error.body)
        ) {

            return error.body
                .map(item => item.message)
                .join(', ');
        }


        // ---------------------------------------------
        // Standard JavaScript error
        // ---------------------------------------------

        if (error.message) {

            return error.message;
        }


        return 'An unexpected error occurred.';
    }
}