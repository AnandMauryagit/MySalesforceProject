import { LightningElement ,wire,track} from 'lwc';
import getRecord from '@salesforce/apex/WireDemoClassShow.getRecord';
const columns =[
    {label : 'Account record id ', fieldName: 'Id'},
   { label : 'Account Name', fieldName:'Name'},
];
export default class WireDemoClassShow extends LightningElement {
    @track columns = columns;
    @track data=[];

    @wire(getRecord)
   wireAccount({data,error}){
    if(data){
this.data=data;
    }
    else if(error){
        console.log("error occured")
    }
   }

}