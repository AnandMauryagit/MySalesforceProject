import { LightningElement } from 'lwc';

import insertAccounts
    from '@salesforce/apex/PartialSuccessController.insertAccounts';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class PartialSuccessDemo extends LightningElement {

    isLoading = false;

    showResults = false;

    totalRecords = 0;

    successCount = 0;

    failedCount = 0;

    successRecords = [];

    failedRecords = [];


    // Success table columns

    successColumns = [

        {
            label: 'Record Name',
            fieldName: 'recordName',
            type: 'text'
        },

        {
            label: 'Record Id',
            fieldName: 'recordId',
            type: 'text'
        },

        {
            label: 'Status',
            fieldName: 'status',
            type: 'text'
        },

        {
            label: 'Message',
            fieldName: 'message',
            type: 'text'
        }

    ];


    // Failed table columns

    failedColumns = [

        {
            label: 'Record',
            fieldName: 'recordName',
            type: 'text'
        },

        {
            label: 'Status',
            fieldName: 'status',
            type: 'text'
        },

        {
            label: 'Error',
            fieldName: 'message',
            type: 'text',
            wrapText: true
        }

    ];


    // Insert records

    handleInsert() {

        this.isLoading = true;

        this.showResults = false;

        insertAccounts()

            .then(result => {

                console.log(
                    'Partial Success Response:',
                    JSON.stringify(result)
                );

                this.totalRecords =
                    result.totalRecords;

                this.successCount =
                    result.successCount;

                this.failedCount =
                    result.failedCount;

                this.successRecords =
                    result.successRecords;

                this.failedRecords =
                    result.failedRecords;

                this.showResults = true;

                this.showToast(
                    'Completed',
                    `${this.successCount} records saved and ${this.failedCount} records failed.`,
                    'success'
                );

            })

            .catch(error => {

                console.error(error);

                this.showToast(
                    'Error',
                    this.getErrorMessage(error),
                    'error'
                );

            })

            .finally(() => {

                this.isLoading = false;

            });
    }


    get hasSuccessRecords() {

        return this.successRecords.length > 0;

    }


    get hasFailedRecords() {

        return this.failedRecords.length > 0;

    }


    getErrorMessage(error) {

        return error?.body?.message ||
            error?.message ||
            'Unknown error occurred';

    }


    showToast(title, message, variant) {

        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );

    }

}