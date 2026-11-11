public without sharing class GetPageLayout {
    
    @AuraEnabled
    public static List<String> getFieldPageLayouts(String objectName,String fieldName) {
        List<String> layoutNames =  new List<String>();
        try {
            
            String sessionId =
                UserInfo.getSessionId();
            
            String baseUrl =
                URL.getOrgDomainUrl()
                .toExternalForm();
            
            Http http =
                new Http();
            
            /*
* FIX OBJECT NAME
*/
            
            Map<String, Schema.SObjectType> gd =
                Schema.getGlobalDescribe();
            
            for(String key : gd.keySet()) {
                
                if(
                    key.toLowerCase() ==
                    objectName.toLowerCase()
                ) {
                    
                    objectName = key;
                    break;
                }
            }
            
            /*
* GET ALL LAYOUT IDS
*/
            
            String query =
                'SELECT Id, Name ' +
                'FROM Layout ' +
                'WHERE TableEnumOrId = \'' +
                objectName +
                '\'';
            
            String endpoint =
                baseUrl +
                '/services/data/v61.0/tooling/query/?q=' +
                EncodingUtil.urlEncode(
                    query,
                    'UTF-8'
                );
            
            HttpRequest req =
                new HttpRequest();
            
            req.setEndpoint(endpoint);
            
            req.setMethod('GET');
            
            req.setHeader(
                'Authorization',
                'Bearer ' + sessionId
            );
            
            HttpResponse res =
                http.send(req);
            
            System.debug(
                'QUERY === ' +
                res.getBody()
            );
            
            if(res.getStatusCode() == 200) {
                
                Map<String,Object> response =
                    (Map<String,Object>)
                    JSON.deserializeUntyped(
                        res.getBody()
                    );
                
                List<Object> records =
                    (List<Object>)
                    response.get('records');
                
                /*
* LOOP ALL LAYOUTS
*/
                
                for(Object obj : records) {
                    
                    Map<String,Object> rec =
                        (Map<String,Object>)obj;
                    
                    String layoutId =
                        (String)rec.get('Id');
                    
                    String layoutName =
                        (String)rec.get('Name');
                    
                    /*
* SINGLE LAYOUT QUERY
*/
                    
                    String singleQuery =
                        'SELECT Id, Metadata ' +
                        'FROM Layout ' +
                        'WHERE Id = \'' +
                        layoutId +
                        '\'';
                    
                    String singleEndpoint =
                        baseUrl +
                        '/services/data/v61.0/tooling/query/?q=' +
                        EncodingUtil.urlEncode(
                            singleQuery,
                            'UTF-8'
                        );
                    
                    HttpRequest singleReq =
                        new HttpRequest();
                    
                    singleReq.setEndpoint(
                        singleEndpoint
                    );
                    
                    singleReq.setMethod(
                        'GET'
                    );
                    
                    singleReq.setHeader(
                        'Authorization',
                        'Bearer ' + sessionId
                    );
                    
                    HttpResponse singleRes =
                        http.send(singleReq);
                    
                    if(singleRes.getStatusCode() == 200) {
                        
                        String responseBody =
                            singleRes.getBody();
                        
                        System.debug(
                            'LAYOUT BODY === ' +
                            responseBody
                        );
                        
                        /*
* CHECK FIELD
*/
                        
                        if(
                            responseBody.contains(
                                fieldName
                            )
                        ) {
                            
                            layoutNames.add(
                                layoutName
                            );
                        }
                    }
                }
            }
            
        } catch(Exception e) {
            
            System.debug(
                'ERROR === ' +
                e.getMessage()
            );
            
            throw new AuraHandledException(
                e.getMessage()
            );
        }
        
        return layoutNames;
    }
}