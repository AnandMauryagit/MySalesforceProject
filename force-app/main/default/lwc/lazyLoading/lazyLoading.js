import { LightningElement, track } from 'lwc';
import getContacts from '@salesforce/apex/LazyLoadingController.getContacts';

const columns = [
    { label: 'Id', fieldName: 'Id', type: 'text' },
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'text' }
];

export default class LazyLoading extends LightningElement{
    @track contacts = [];
    @track error;
    columns = columns;
    rowLimit = 25;
    rowOffset = 0;
    hasMoreData = true;

    connectedCallback() {
        this.loadData();
    }

    loadData() {
        getContacts({ limitSize: this.rowLimit, offset: this.rowOffset })
            .then(result => {
                if (result && result.length > 0) {
                    this.contacts = [...this.contacts, ...result];
                    this.rowOffset += this.rowLimit;
                } else {
                    this.hasMoreData = false;
                }
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.contacts = undefined;
            });
    }

    loadMoreData(event) {
        this.loadData();
    }
}