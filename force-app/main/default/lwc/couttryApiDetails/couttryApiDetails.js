import { LightningElement, track } from 'lwc';
import calloutsExamp from '@salesforce/apex/HttpCallOutCallCountry.calloutsExamp';

export default class CouttryApiDetails extends LightningElement {
	@track accounts;
	@track error;
	@track countryna
	counrtyFlag
	counrtyMap
	inputData;

	handleChange(event) {
		this.inputData = event.target.value
		console.log('result handleChange--', this.inputData);
	}
	handleClick(event) {
		const searchKey = this.inputData;

		calloutsExamp({ countryName: searchKey })

			.then(result => {
				this.accounts = result;
				this.error = undefined;
				const objes = JSON.parse(result)

				objes.forEach((element) => {
					if (element.name.common == this.inputData) {
						this.countryna = element.name.common
						this.counrtyFlag = element.flags.png
						this.counrtyMap = element.maps.googleMaps
						console.log(element.name.common)
						console.log(element.flags.png)
					}
				});
			})
		console.log('result innner  data--', this.accounts)
			.catch(error => {
				this.error = error;
				this.accounts = undefined;
			})
		console.log('result data--', this.accounts);
	}

}