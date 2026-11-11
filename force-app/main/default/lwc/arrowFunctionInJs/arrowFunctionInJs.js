import { LightningElement } from 'lwc';
import{  ShowToastEvent  } from 'lightning/platformShowToastEvent';

export default class ArrowFunctionInJs extends LightningElement {
    myTitle = "Salesforce Check";

    connectedCallback(){
        let callMyFunction =this.myFunction(10 , 2);
        window.alert("callMyFunction       value by arrow function  ====="+callMyFunction);
    }
     myFunction = (divident,divisor) =>{
        return(divident/divisor);
     }
}