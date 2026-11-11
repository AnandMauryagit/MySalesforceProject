import { LightningElement } from 'lwc';
import getCountry from '@salesforce/apex/CountryController.getCountry';

export default class CountrySearch extends LightningElement {

    countryName = '';
    responseData;

    handleCountryChange(event) {
        this.countryName = event.target.value;
    }

    searchCountry() {

        getCountry({
            countryName: this.countryName
        })
        .then(result => {
            this.responseData = JSON.stringify(
                JSON.parse(result),
                null,
                2
            );
        })
        .catch(error => {
            console.error(error);
        });
    }
}