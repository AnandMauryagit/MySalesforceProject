public with sharing class FieldLayoutFinder {

    @AuraEnabled(cacheable=true)
    public static List<String> getLayoutsContainingField(
        String objectApiName,
        String fieldApiName
    ) {

        List<String> layoutNames = new List<String>();

        String sessionId = UserInfo.getSessionId();

        // Get layouts for object
        String query =
            'SELECT Id, Name FROM Layout WHERE TableEnumOrId = \'' +
            objectApiName + '\'';

        String endpoint =
            URL.getOrgDomainUrl().toExternalForm() +
            '/services/data/v61.0/tooling/query/?q=' +
            EncodingUtil.urlEncode(query, 'UTF-8');

        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + sessionId);
        req.setHeader('Content-Type', 'application/json');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() != 200) {
            throw new AuraHandledException(
                'Error fetching layouts: ' + res.getBody()
            );
        }

        Map<String, Object> responseMap =
            (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

        List<Object> records =
            (List<Object>) responseMap.get('records');

        for (Object obj : records) {

            Map<String, Object> layoutRecord =
                (Map<String, Object>) obj;

            String layoutId =
                (String) layoutRecord.get('Id');

            String layoutName =
                (String) layoutRecord.get('Name');

            // Fetch full layout metadata
            String layoutEndpoint =
                URL.getOrgDomainUrl().toExternalForm() +
                '/services/data/v61.0/tooling/sobjects/Layout/' +
                layoutId;

            HttpRequest layoutReq = new HttpRequest();
            layoutReq.setEndpoint(layoutEndpoint);
            layoutReq.setMethod('GET');
            layoutReq.setHeader(
                'Authorization',
                'Bearer ' + sessionId
            );

            HttpResponse layoutRes =
                http.send(layoutReq);

            if (layoutRes.getStatusCode() == 200) {

                Map<String, Object> layoutMap =
                    (Map<String, Object>) JSON.deserializeUntyped(
                        layoutRes.getBody()
                    );

                Map<String, Object> metadata =
                    (Map<String, Object>) layoutMap.get('Metadata');

                List<Object> sections =
                    (List<Object>) metadata.get('layoutSections');

                Boolean fieldFound = false;

                if (sections != null) {

                    for (Object secObj : sections) {

                        Map<String, Object> section =
                            (Map<String, Object>) secObj;

                        List<Object> columns =
                            (List<Object>) section.get('layoutColumns');

                        if (columns != null) {

                            for (Object colObj : columns) {

                                Map<String, Object> column =
                                    (Map<String, Object>) colObj;

                                List<Object> items =
                                    (List<Object>) column.get('layoutItems');

                                if (items != null) {

                                    for (Object itemObj : items) {

                                        Map<String, Object> item =
                                            (Map<String, Object>) itemObj;

                                        String fieldName =
                                            (String) item.get('field');

                                        if (
                                            fieldName != null &&
                                            fieldName.equalsIgnoreCase(fieldApiName)
                                        ) {
                                            fieldFound = true;
                                            break;
                                        }
                                    }
                                }

                                if (fieldFound) {
                                    break;
                                }
                            }
                        }

                        if (fieldFound) {
                            break;
                        }
                    }
                }

                if (fieldFound) {
                    layoutNames.add(layoutName);
                }
            }
        }
system.debug('All Places where the field is '+layoutNames);
        return layoutNames;
    }
}