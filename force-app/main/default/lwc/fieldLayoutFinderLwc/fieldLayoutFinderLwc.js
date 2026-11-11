import { LightningElement, track } from 'lwc';

import getLayoutsContainingField
    from '@salesforce/apex/FieldLayoutFinder.getLayoutsContainingField';

export default class FieldLayoutFinderLwc extends LightningElement {

    @track objectApiName = '';
    @track fieldApiName = '';

    @track layoutNames = [];
    @track errorMessage = '';

    handleObjectChange(event) {
        this.objectApiName = event.target.value;
    }

    handleFieldChange(event) {
        this.fieldApiName = event.target.value;
    }

    async handleSearch() {

        this.errorMessage = '';
        this.layoutNames = [];

        try {

            const result = await getLayoutsContainingField({
                objectApiName: this.objectApiName,
                fieldApiName: this.fieldApiName
            });

            this.layoutNames = result;

            if(result.length === 0) {
                this.errorMessage =
                    'No layouts contain this field.';
            }

        } catch(error) {

            console.error(error);

            this.errorMessage =
                error.body?.message || 'Unknown Error';
        }
    }
}