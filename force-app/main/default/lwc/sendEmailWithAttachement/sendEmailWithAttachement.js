import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/OB_DocumentChecklistController.getFiles';
import getEmailData from '@salesforce/apex/OB_DocumentChecklistController.sendEmailFromApex';
export default class ModalExample extends LightningElement {
    @track isModalOpen = false;
    @track firstInputValue = '';
    @track secondInputValue = '';
    @track richTextValue = '';
    @track searchKey;
    @track inputValue;
    @track filenametoShow;
    @track inputValueEmail;
    @track accountsArray = [];
    @track documentIdToAttach = [];
    @track emailAddressArray = [];
    handleFirstInputChange(event) {
        const richTextValue = event.target.value.trim();
        if (richTextValue && !this.emailAddressArray.includes(richTextValue)) {
            this.emailAddressArray.push(richTextValue);
        }
    }
    handleSecondInputChange(event) {
        this.secondInputValue = event.target.value
    }
    handleRichTextChange(event) {
        this.richTextValue = event.target.value
    }
    recIds(event) {
        const inputValue = event.target.value.trim();
        if (inputValue && !this.accountsArray.includes(inputValue)) {
            this.accountsArray.push(inputValue);
        }
    }
    openModal() {
        this.isModalOpen = true;
        console.log('button works')
        getAccounts({ listOfRecordIds: this.accountsArray })
            .then((result) => {
              this.documentIdToAttach.push(result.documentId)

                this.filenametoShow = result.fileName
                console.log('Result from Apex:', result);
            })
            .catch((error) => {
                console.error('Error sending data to Apex:', error);
            });
    }
    closeModal() {
        this.isModalOpen = false;
    }
    handleSave() {
        getEmailData({ toAddress: this.emailAddressArray, Subject: this.secondInputValue, EmailBody: this.firstInputValue , documentIdToClass : this.documentIdToAttach})
            .then((result) => {

                console.log('Result from Apex for email function:', result);
            })
            .catch((error) => {
                console.error('Error sending data to Apex from Email :', error);
            });
        this.closeModal();
    }
}