import { LightningElement,track} from 'lwc';
import Accounts from '@salesforce/schema/Account';
import Name_Field from '@salesforce/schema/Account.Name';
import Phone_Field from '@salesforce/schema/Account.Phone';
export default class LdsRecordForm extends LightningElement {

@track fields = [Name_Field,Phone_Field]
objectApiName=Accounts
recordId = "001J3000009Iy9PIAS"
//objectApiName =  Accounts
}