import { LightningElement, wire } from 'lwc';

import { subscribe,APPLICATION_SCOPE, MessageContext } from 'lightning/messageService';
import Counting_Update_Channel from '@salesforce/messageChannel/CountingUpdated__c';

export default class Subs extends LightningElement {

    counter = 0;
    subscription = null

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }
    subscribeToMessageChannel() {

        this.subscription = subscribe(this.messageContext, Counting_Update_Channel, (message) => this.handleMessage(message),{ scope: APPLICATION_SCOPE })
    }
    handleMessage(message) {
        //alert("message:"+JSON.stringify(message))
        if (message.operator == 'add') {
            this.counter += message.constant
        }
        else if (message.operator == 'substract') {
            this.counter -= message.constant
        }
        else if (message.operator == 'multiply') {
            this.counter *= message.constant
        }

    }
}