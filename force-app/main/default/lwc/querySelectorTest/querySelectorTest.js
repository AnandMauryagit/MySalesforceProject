import { LightningElement } from 'lwc';
 
export default class QuerySelectorSampleCmp extends LightningElement {
 
    changeTextColor() {
        const element = this.template.querySelector('p');
        element.style.fontSize  = '30px';
        element.style.color = 'darkgoldenrod';
    }
}