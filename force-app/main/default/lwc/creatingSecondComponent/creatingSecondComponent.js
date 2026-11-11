import { LightningElement } from 'lwc';

export default class CreatingSecondComponent extends LightningElement {
    myTitle = "Salesforce Title";

    connectedCallback(){
       // if(this.myTitle){
            const name = "Salesforce Title";
name ="use var to multiple assignment "
       // }
        window.alert("name by const "+name);
    }
}