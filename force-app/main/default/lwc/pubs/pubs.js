import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import Counting_Update_Channel from '@salesforce/messageChannel/CountingUpdated__c';
export default class Pubs extends LightningElement {
    @wire(MessageContext)
    messageContext

    handleIncrement() {
        const payload = {
            operator: 'add',
            constant: 1
        }
        publish(this.messageContext, Counting_Update_Channel, payload)
    }
    handleDecrement() {
        const payload = {
            operator: 'substract',
            constant: 1
        }
        publish(this.messageContext, Counting_Update_Channel, payload)
    }

    handleMultiply() {
        const payload = {
            operator: 'multiply',
            constant: 2
        }
        publish(this.messageContext, Counting_Update_Channel, payload)
    }
}