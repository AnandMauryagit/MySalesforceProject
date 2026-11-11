import { LightningElement } from 'lwc';
import runSavepointDemo from '@salesforce/apex/SavepointDemoController.runSavepointDemo';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class SavepointDemo extends LightningElement {

    // =====================================================
    // ACCOUNT
    // =====================================================

    accountName = '';
    accountPhone = '';
    accountIndustry = '';
    accountWebsite = '';

    // =====================================================
    // CONTACT
    // =====================================================

    contactFirstName = '';
    contactLastName = '';
    contactEmail = '';
    contactPhone = '';

    // =====================================================
    // OPPORTUNITY
    // =====================================================

    opportunityName = '';
    opportunityAmount = '';
    opportunityStage = 'Prospecting';
    opportunityCloseDate;

    // =====================================================
    // RESULT
    // =====================================================

    isRunning = false;
    showResult = false;

    accountId;
    contactId;
    opportunityId;

    accountCreated = false;
    contactRolledBack = false;
    opportunityRolledBack = false;

    errorMessage = '';

    // =====================================================
    // OPTIONS
    // =====================================================

    industryOptions = [
        {
            label: 'Technology',
            value: 'Technology'
        },
        {
            label: 'Finance',
            value: 'Finance'
        },
        {
            label: 'Healthcare',
            value: 'Healthcare'
        },
        {
            label: 'Manufacturing',
            value: 'Manufacturing'
        },
        {
            label: 'Retail',
            value: 'Retail'
        }
    ];


    stageOptions = [
        {
            label: 'Prospecting',
            value: 'Prospecting'
        },
        {
            label: 'Qualification',
            value: 'Qualification'
        },
        {
            label: 'Needs Analysis',
            value: 'Needs Analysis'
        },
        {
            label: 'Proposal/Price Quote',
            value: 'Proposal/Price Quote'
        }
    ];


    // =====================================================
    // DEFAULT DATE
    // =====================================================

    connectedCallback() {

        const today = new Date();

        today.setDate(today.getDate() + 30);

        this.opportunityCloseDate =
            today.toISOString().split('T')[0];
    }


    // =====================================================
    // HANDLE INPUT
    // =====================================================

    handleChange(event) {

        const field =
            event.target.dataset.field;

        this[field] = event.target.value;
    }


    // =====================================================
    // RUN DEMO
    // =====================================================
async runDemo() {

    console.log('===== SAVEPOINT DEMO START =====');

    // Validate all inputs
    const inputs = this.template.querySelectorAll(
        'lightning-input, lightning-combobox'
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

    this.isRunning = true;
    this.showResult = false;

    try {

        console.log('Calling Apex...');

        const result = await runSavepointDemo({

            // ================================
            // ACCOUNT
            // ================================

            accountName: this.accountName,

            accountPhone: this.accountPhone,

            accountIndustry: this.accountIndustry,

            accountWebsite: this.accountWebsite,


            // ================================
            // CONTACT
            // ================================

            contactFirstName: this.contactFirstName,

            contactLastName: this.contactLastName,

            contactEmail: this.contactEmail,

            contactPhone: this.contactPhone,


            // ================================
            // OPPORTUNITY
            // ================================

            opportunityName: this.opportunityName,

            opportunityAmount:
                this.opportunityAmount
                    ? Number(this.opportunityAmount)
                    : null,

            opportunityStage:
                this.opportunityStage,

            opportunityCloseDate:
                this.opportunityCloseDate
        });


        console.log(
            'Apex Result:',
            result
        );


        // =====================================
        // SUCCESS
        // =====================================

        if (result && result.startsWith('SUCCESS|')) {

            this.showResult = true;

            this.accountCreated = true;

            this.contactRolledBack = true;

            this.opportunityRolledBack = true;


            // Remove SUCCESS| from message
            this.resultMessage =
                result.substring(8);


            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Savepoint Demo Completed',
                    message:
                        'Rollback completed successfully.',
                    variant: 'success'
                })
            );
        }

    } catch (error) {

        console.error(
            'SAVEPOINT DEMO ERROR:',
            JSON.stringify(error)
        );


        let message = 'Unknown error';


        if (
            error &&
            error.body &&
            error.body.message
        ) {

            message =
                error.body.message;

        } else if (
            error &&
            error.message
        ) {

            message =
                error.message;
        }


        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Savepoint Demo Error',
                message: message,
                variant: 'error',
                mode: 'sticky'
            })
        );

    } finally {

        this.isRunning = false;
    }
}


    // =====================================================
    // RESET
    // =====================================================

    resetDemo() {

        this.accountName = '';
        this.accountPhone = '';
        this.accountIndustry = '';
        this.accountWebsite = '';

        this.contactFirstName = '';
        this.contactLastName = '';
        this.contactEmail = '';
        this.contactPhone = '';

        this.opportunityName = '';
        this.opportunityAmount = '';
        this.opportunityStage = 'Prospecting';

        const today = new Date();

        today.setDate(today.getDate() + 30);

        this.opportunityCloseDate =
            today.toISOString().split('T')[0];

        this.showResult = false;

        this.accountId = null;
        this.contactId = null;
        this.opportunityId = null;

        this.errorMessage = '';
    }


    // =====================================================
    // ACCOUNT URL
    // =====================================================

    get accountUrl() {

        if (!this.accountId) {
            return '#';
        }

        return '/' + this.accountId;
    }
}