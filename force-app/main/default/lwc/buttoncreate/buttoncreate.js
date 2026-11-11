import { LightningElement } from 'lwc';
import{  ShowToastEvent  } from 'lightning/platformShowToastEvent';
export default class Buttoncreate extends LightningElement {
    myTitle ="Salesforce Check";


    handleClick(){
//c/apiPropatieswindow.alert("Hello Salesforce");
this.showToast(this.myTitle);
    }
    showToast(firstfunctionArgument){
        const event = new ShowToastEvent({
            title: firstfunctionArgument,
            message:'want to display toast example ',
            variant : 'error',
        })
        this.dispatchEvent(event);
    }

}