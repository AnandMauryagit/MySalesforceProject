import { LightningElement } from 'lwc';
import createDataFromLwc from '@salesforce/apex/CreateAccountThroughLwc.createDataFromLwc'
export default class FormCreation extends LightningElement {
    Name = ''
    Phone = ''
    Email = ''
    Address = ''


    handleChange(event) {
        const fields = event.target.name

        if (fields === 'name') {
            this.Name = event.target.value
        }
        if (fields === 'phone') {
            this.Phone = event.target.value
        }
        if (fields === 'email') {
            this.Email = event.target.value
        }
        if (fields === 'address') {
            this.Address = event.target.value
        }

    }
    handleClick() {
        createDataFromLwc({name:this.Name,phone:this.Phone,email:this.Email,address:this.Address})
    }
}