import { LightningElement } from 'lwc';

export default class MyComponent extends LightningElement {
    renderedCallback() {
        // Ensure the shadow root is created only once
        if (this.shadowRoot) {
            return;
        }

        // Access the element with class 'host'
        const elem = this.template.querySelector('.host');
        
        // Attach Shadow DOM and add content
        const shadowRoot = elem.attachShadow({ mode: 'open' });
        shadowRoot.innerHTML = '<p>I am in Shadow DOM</p>';
    }
}