import { LightningElement ,api} from 'lwc';

export default class ChildComponentapiDecorator extends LightningElement {
  @api itemName ="SalesForce  Test arjun";

  @api handleChangeValue(){
    this.itemName= "Salesforce LWC Demo";
  }
}