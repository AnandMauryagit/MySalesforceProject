import { LightningElement, api, wire } from 'lwc';
import getRelatedContacts from '@salesforce/apex/DecoratorControler.getRelatedContacts';

export default class AccountRelatedContact extends LightningElement {

   @api recordId;
   @api objectApiName;
    contacts;

    @wire(getRelatedContacts, { accountId: '$recordId' })
      wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.error('------------Error----------', error);
        }
    }
}