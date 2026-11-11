public with sharing class WeatherService {

    @AuraEnabled(cacheable=true)
    public static String getWeather(String city) {

        Http http = new Http();

        HttpRequest req = new HttpRequest();

        req.setEndpoint(
            'callout:PackagingTest32__OpenWeather/data/2.5/weather?q='
            + EncodingUtil.urlEncode(city,'UTF-8')
            + '&appid=eb2980d9332165c1863722ef13aa6f72'
        );

        req.setMethod('GET');

        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200){
            return res.getBody();
        }

        throw new AuraHandledException('Unable to fetch weather');
    }
}