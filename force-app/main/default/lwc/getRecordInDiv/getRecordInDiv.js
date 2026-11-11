import { LightningElement ,wire } from 'lwc';
import getObjectDetail from '@salesforce/apex/ForAccountDetail.getObjectDetail';
export default class GetRecordInDiv extends LightningElement {

@wire(getObjectDetail)
accountsData
wiredData({ error, data }) {
  if (data) {

    console.log('Data', data);

  } else if (error) {
    console.error('Error:', error);
  }
}
}