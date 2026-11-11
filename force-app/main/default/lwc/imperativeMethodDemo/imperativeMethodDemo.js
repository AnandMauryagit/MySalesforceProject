import { LightningElement,track } from 'lwc';
import getRecord from '@salesforce/apex/WireDemoClassShow.getRecord';
const columns =[
    {label : 'Account record id ', fieldName: 'Id'},
   { label : 'Account Name', fieldName:'Name'},
];

export default class ImperativeMethodDemo extends LightningElement {

    @track columns = columns;
@track data = [];

    connectedCallback(){
        getRecord()
        .then(result=>{
            this.data = result;
        })
        .catch( error =>{
            console.log ("error occurred");
        })
    }
}