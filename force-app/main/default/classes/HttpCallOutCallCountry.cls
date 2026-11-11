public class HttpCallOutCallCountry {
    @auraEnabled
    public static string calloutsExamp(String countryName){
        Http htp = New Http ();
        HttpRequest req = New HttpRequest ();
        req.setEndpoint('https://restcountries.com/v3.1/name/'+countryName);
        req.setMethod('GET');
        HttpResponse res = htp.send(req);
        String status =  res.getStatus();
        String jsonRespons = res.getBody();
        system.debug('jsonRespons'+res.getBody());
        system.debug('status'+res.getStatus());
        return jsonRespons;
    }
}