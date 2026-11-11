import { LightningElement, track } from 'lwc';

import getWeather from '@salesforce/apex/WeatherService.getWeather';

export default class WeatherApp extends LightningElement {

    city;
    weather;

    handleChange(event){
        this.city = event.target.value;
    }

    fetchWeather(){

        getWeather({ city : this.city })
        .then(result => {
            this.weather = result;
        })
        .catch(error => {
            console.error(error);
        });
    }
}