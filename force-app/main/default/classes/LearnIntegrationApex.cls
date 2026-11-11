public class LearnIntegrationApex {
    public static void makeCa11Out(){
        Http http =  new Http();
        HttpRequest req = new HttpRequest();
        //req.setEndpoint('https://global-warming.org/api/temperature-api');
        req.setEndpoint('callout:Global_Warmimg/api/temperature-api');//Named Credential
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        if(res.getStatusCode()  == 200){
            System.debug('Made a Callout To External System'+res.getBody()) ;
        }
    }
     public static void makeCa11OutAccessKey(){
        Http http =  new Http();
        HttpRequest req = new HttpRequest();
        //req.setEndpoint('https://global-warming.org/api/temperature-api');
        req.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=6e2ffe016ca446369de80c7b42533dbb');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
         system.debug('res'+res);
        if(res.getStatusCode()  == 200){
            System.debug('Made a Callout To External System'+res.getBody()) ;
        }
    }
}