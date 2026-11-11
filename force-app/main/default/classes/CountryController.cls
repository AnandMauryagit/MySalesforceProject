public with sharing class CountryController {

    @AuraEnabled
    public static String getCountry(String countryName){

        HttpRequest req = new HttpRequest();

        req.setEndpoint(
            'https://api.restcountries.com/countries/v5?q=' +
            EncodingUtil.urlEncode(countryName, 'UTF-8')
        );

        req.setMethod('GET');

        req.setHeader(
            'Authorization',
            'Bearer rc_live_af69eb0736d4409ab123a30592923dc7'
        );

        Http http = new Http();

        HttpResponse res = http.send(req);

        System.debug('Status Code: ' + res.getStatusCode());
        System.debug('Response Body: ' + res.getBody());

        return res.getBody();
    }
}