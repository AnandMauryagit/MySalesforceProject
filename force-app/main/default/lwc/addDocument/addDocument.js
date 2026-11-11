import { LightningElement, track } from 'lwc';
import saveDocument from '@salesforce/apex/DocumentController.saveDocument';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AddDocument extends LightningElement {

    @track documentName = '';
    @track category = '';
    @track startDate = '';
    @track expiryDate = '';
    @track description = '';

    showModal = false;

    openModal() {
        this.showModal = true;
    }

    closeModal() {
        this.showModal = false;
    }


    categoryOptions = [
        { label: 'Hospital contract', value: 'Hospital contract' },
        { label: 'Fire Licence', value: 'Fire Licence' }
    ];

    handleName(event) {
        this.documentName = event.target.value;
    }

    handleCategory(event) {
        this.category = event.detail.value;
    }

    handleStartDate(event) {
        this.startDate = event.target.value;
    }

    handleExpiryDate(event) {
        this.expiryDate = event.target.value;
    }

    handleDescription(event) {
        this.description = event.target.value;
    }

    clearForm() {

        this.documentName = '';
        this.category = '';
        this.startDate = '';
        this.expiryDate = '';
        this.description = '';

    }

    saveDocument() {

        saveDocument({

            documentName: this.documentName,
            category: this.category,
            startDate: this.startDate,
            expiryDate: this.expiryDate,
            description: this.description

        })

            .then(() => {

                this.dispatchEvent(

                    new ShowToastEvent({

                        title: 'Success',
                        message: 'Document Created Successfully',
                        variant: 'success'

                    })

                );

                this.clearForm();

            })

            .catch(error => {

                this.dispatchEvent(

                    new ShowToastEvent({

                        title: 'Error',
                        message: error.body.message,
                        variant: 'error'

                    })

                );
                this.clearForm();

                this.closeModal();

            });

    }


}