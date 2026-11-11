import { LightningElement, api } from 'lwc';

import getPrograms
    from '@salesforce/apex/UniversityAdmissionController.getPrograms';

import createApplication
    from '@salesforce/apex/UniversityAdmissionController.createApplication';

export default class UniversityAdmission extends LightningElement {

    /*
     * Program Id can be passed from University Programs.
     *
     * Example:
     * <c-university-admission
     *     selected-program-id={selectedProgramId}>
     * </c-university-admission>
     */
    @api selectedProgramId;


    // ==============================
    // DATA
    // ==============================

    programs = [];

    isLoading = false;
    isSubmitting = false;

    errorMessage = '';

    applicationSubmitted = false;

    applicationId;
    applicationNumber;
    applicationStatus;
    submittedProgram;


    // ==============================
    // FORM FIELDS
    // ==============================

    applicantName = '';
    email = '';
    mobile = '';
    dateOfBirth = '';
    gender = '';
    address = '';
    city = '';
    state = '';
    pincode = '';
    qualification = '';
    passingYear = '';

    selectedProgram = '';


    // ==============================
    // LIFECYCLE
    // ==============================

    connectedCallback() {
        this.loadPrograms();
    }


    // ==============================
    // LOAD PROGRAMS
    // ==============================

    loadPrograms() {

        this.isLoading = true;
        this.errorMessage = '';

        getPrograms()
            .then(result => {

                this.programs = result.map(program => ({
                    label: program.Name,
                    value: program.Id
                }));

                /*
                 * If Program Id was passed from
                 * Programs page, automatically select it.
                 */
                if (this.selectedProgramId) {
                    this.selectedProgram = this.selectedProgramId;
                }
            })
            .catch(error => {

                console.error(
                    'Error loading programs:',
                    error
                );

                this.errorMessage =
                    this.getErrorMessage(error);
            })
            .finally(() => {

                this.isLoading = false;
            });
    }


    // ==============================
    // INPUT HANDLER
    // ==============================

    handleInputChange(event) {

        const field = event.target.name;
        const value = event.target.value;

        this[field] = value;
    }


    // ==============================
    // PROGRAM CHANGE
    // ==============================

    handleProgramChange(event) {

        this.selectedProgram = event.detail.value;
    }


    // ==============================
    // SUBMIT
    // ==============================

    handleSubmit() {

        this.errorMessage = '';

        /*
         * Validate Lightning inputs
         */
        const inputs =
            this.template.querySelectorAll(
                'lightning-input, lightning-combobox, lightning-textarea'
            );

        let isValid = true;

        inputs.forEach(input => {

            if (!input.reportValidity()) {
                isValid = false;
            }
        });


        if (!isValid) {
            return;
        }


        if (!this.selectedProgram) {

            this.errorMessage =
                'Please select a program.';

            return;
        }


        this.isSubmitting = true;


        createApplication({
            applicantName: this.applicantName,
            email: this.email,
            mobile: this.mobile,
            dateOfBirth: this.dateOfBirth,
            gender: this.gender,
            address: this.address,
            city: this.city,
            state: this.state,
            pincode: this.pincode,
            qualification: this.qualification,
            passingYear: this.passingYear
                ? parseInt(this.passingYear, 10)
                : null,
            programId: this.selectedProgram
        })
            .then(applicationId => {

                this.applicationId =
                    applicationId;

                return this.loadSubmittedApplication(
                    applicationId
                );
            })
            .catch(error => {

                console.error(
                    'Error creating application:',
                    error
                );

                this.errorMessage =
                    this.getErrorMessage(error);
            })
            .finally(() => {

                this.isSubmitting = false;
            });
    }


    // ==============================
    // LOAD CREATED APPLICATION
    // ==============================

    loadSubmittedApplication(applicationId) {

        /*
         * We can import getApplication later
         * when we build the detailed confirmation.
         *
         * For now we already know the selected
         * program from the form.
         */

        const selected =
            this.programs.find(
                program =>
                    program.value === this.selectedProgram
            );

        this.submittedProgram =
            selected ? selected.label : '';

        this.applicationNumber =
            applicationId;

        this.applicationStatus =
            'Submitted';

        this.applicationSubmitted = true;
    }


    // ==============================
    // BACK / NEW APPLICATION
    // ==============================

    handleNewApplication() {

        this.applicationSubmitted = false;

        this.applicationId = null;
        this.applicationNumber = null;
        this.applicationStatus = null;

        this.applicantName = '';
        this.email = '';
        this.mobile = '';
        this.dateOfBirth = '';
        this.gender = '';
        this.address = '';
        this.city = '';
        this.state = '';
        this.pincode = '';
        this.qualification = '';
        this.passingYear = '';

        /*
         * Keep selected program if user came
         * from Apply Now.
         */
        if (!this.selectedProgramId) {
            this.selectedProgram = '';
        }

        this.errorMessage = '';
    }


    // ==============================
    // ERROR HANDLER
    // ==============================

    getErrorMessage(error) {

        if (error?.body?.message) {
            return error.body.message;
        }

        if (error?.message) {
            return error.message;
        }

        return 'Something went wrong. Please try again.';
    }


    // ==============================
    // UI GETTERS
    // ==============================

    get showForm() {
        return !this.applicationSubmitted;
    }

    get submitButtonLabel() {

        return this.isSubmitting
            ? 'Submitting...'
            : 'Submit Application';
    }
get genderOptions() {
    return [
        {
            label: 'Male',
            value: 'Male'
        },
        {
            label: 'Female',
            value: 'Female'
        },
        {
            label: 'Other',
            value: 'Other'
        }
    ];
}

}