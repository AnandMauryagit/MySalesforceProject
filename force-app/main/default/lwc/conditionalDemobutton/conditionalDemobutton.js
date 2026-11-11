import { LightningElement, track } from 'lwc';

export default class ConditionalDemobutton extends LightningElement { 
    @track onClickedButtonLabel ='Show';
    myTitle = 'Salesforce Check';
    @track cardVisible = false ;

    handleclick(event){
        const label = event.target.label;
        if(label==='Show'){
            this.onClickedButtonLabel ='Hide';
            this.cardVisible = true;
        }
        else if(label==='Hide'){
            this.onClickedButtonLabel ='Show'; 
            this.cardVisible = false;
        }
     }
}