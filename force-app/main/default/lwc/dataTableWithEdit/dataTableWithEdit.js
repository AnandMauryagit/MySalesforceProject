import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactControllerLwc.getContacts';

export default class DatatableWithApex extends LightningElement {
    data; // Stores the data retrieved from Apex
    error; // Stores any error message
    isLoading = true; // Shows a spinner while loading data

    columns = [
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' }
    ];

    // Wire the Apex method
    @wire(getContacts)
    wiredContacts({ error, data }) {
        if (data) {
            this.data = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.data = undefined;
        }
        this.isLoading = false;
    }
}