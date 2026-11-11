import { LightningElement, wire, track } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import myResource from "@salesforce/resourceUrl/testzipupload";
import { NavigationMixin } from "lightning/navigation";
import Accounts from '@salesforce/schema/Account';
import { refreshApex } from '@salesforce/apex';
import getRecord from '@salesforce/apex/AccountDataForCustomRecordpage.getAccountDetail';

//export default class BasicDatatable extends LightningElement {
export default class BasicDatatable extends NavigationMixin(LightningElement) {
    data;
    @track isShowModal = false;
    @track fields
     @track dataInStaticResource 

     handleClick(){
         dataInStaticResource  = myResource
          console.log('Data in the resource  -------- : ',dataInStaticResource );
          console.log('Data in the main  resource  -------- : ',myResource )
     }

    columns = [
        { label: 'Name', type: 'url', fieldName: 'Name' , typeAttributes: { label: { fieldName: 'Name' }, target: '_self' } },
        { label: 'Website', fieldName: 'Website', type: 'url' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        {
            type: 'action',
            typeAttributes: { rowActions: this.getRowActions }
        }
        
    ];
    @wire(getRecord)
    wireAccount({ data, error }) {
        if (data) {
            this.data = data;
        } else if (error) {
            console.error('Error occurred:', error);
        }
    }
    getRowActions(row, doneCallback) {
        const actions = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'delete' }
        ];
        doneCallback(actions);
    }
    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        console.log('Action:', actionName, 'on row:', row);
        
        switch (actionName) {
            case 'edit':
                this.handleEdit(row);
                break;
            case 'delete':
                this.handleDelete(row);
                break;
            default:
                break;
        }
    }
    handleEdit(row) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: row.Id, // pass the record id here.
                actionName: 'edit',
                 
            },
        });
       
        console.log('Editing record:', row);
        
    }
    closeModal() {
        this.isShowModal = false;
    }
    handleDelete(row) {
        deleteRecord(row.Id);
        console.log('Deleting record:', row.Id);
        refreshApex(this.data);
    }
   

    

   //console.log(dataInStaticResource);
    //
}