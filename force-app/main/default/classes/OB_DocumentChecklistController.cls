public class OB_DocumentChecklistController {
    @AuraEnabled
    public static void sendEmailFromApex(String Subject,String EmailBody,List<string> toAddress,List<String>documentIdToClass){
        String Success = 'SUCCESS';
        String Failed = 'FAILED';
        
       try {
            // Retrieve the ContentVersion records for the provided document IDs
            system.debug('test--'+documentIdToClass);
            List<ContentVersion> contentVersions = [
                SELECT Id, Title, VersionData, FileExtension
                FROM ContentVersion
                WHERE Id IN :documentIdToClass
            ];

            // Prepare the email message
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(toAddress);
            email.setSubject(Subject);
            email.setHtmlBody(EmailBody); // Use HTML body instead of plain text

            // Add file attachments to the email
            List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>();
            for (ContentVersion cv : contentVersions) {
                SYSTEM.debug('testcv'+cv);
                Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
                attachment.setFileName(cv.Title + '.' + cv.FileExtension);
                attachment.setBody(cv.VersionData);
                attachments.add(attachment);
            }

            email.setFileAttachments(attachments);

            // Send the email
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ email });
        } catch (Exception ex) {
            // Handle errors gracefully
            System.debug('Error sending email: ' + ex.getMessage());
            throw new AuraHandledException('An error occurred while sending the email: ' + ex.getMessage());
        }

    }
    
    @AuraEnabled
    public static List<documentData> getFiles(List<String> listOfRecordIds){
        Set<String> setOfRecordIds=new Set<String>(listOfRecordIds);
        Map<Id,Id> entityIdVscontentDocIds = new Map<Id,Id>();
        Map<Id,ContentVersion> DocumentIdVscontentVersion = new Map<Id,ContentVersion>();
        List<documentData> listOfDocumentDetail=new List<documentData>();
        for (ContentDocumentLink cdl : [
            SELECT ContentDocumentId, LinkedEntityId
            FROM ContentDocumentLink
            WHERE LinkedEntityId IN :setOfRecordIds
        ]) {
            entityIdVscontentDocIds.put(cdl.LinkedEntityId, cdl.ContentDocumentId);
        }
        
        if(!entityIdVscontentDocIds.isEmpty()){
            for(ContentVersion cv: [SELECT Id,ContentDocumentId,ContentDocument.FileType,ContentDocument.Title,ContentDocument.LatestPublishedVersion.VersionData FROM ContentVersion 
                                    WHERE ContentDocumentId IN:entityIdVscontentDocIds.values() 
                                    AND isLatest=true]){
                                        DocumentIdVscontentVersion.put(cv.ContentDocumentId,cv);
                                    }           
        }
        for(String docCheckListId:setOfRecordIds){
            Id documentId=entityIdVscontentDocIds.get(docCheckListId);
            ContentVersion version=DocumentIdVscontentVersion.get(documentId);
            if(version!=null){
                String base64Data = EncodingUtil.base64Encode(version.ContentDocument.LatestPublishedVersion.VersionData);
                listOfDocumentDetail.add(new documentData(version.Id,
                                                          '',
                                                          base64Data,
                                                          version.ContentDocument.Title,
                                                          version.ContentDocument.FileType
                                                         ));
            }else{
                listOfDocumentDetail.add(new documentData(docCheckListId,
                                                          'No files available for download. The selected items do not have any attachments.'+docCheckListId,
                                                          '',
                                                          '',
                                                          ''));
            }
        }
        return listOfDocumentDetail;
        
    }
    private class documentData{
        @AuraEnabled
        public String documentId;
        @AuraEnabled
        public String versionData;
        @AuraEnabled
        public String fileName;
        @AuraEnabled
        public String errorMsg;
        private documentData(String documentId,String errorMsg,String versionData,String fileName,String fileType){
            this.documentId=documentId;
            this.errorMsg=errorMsg;
            this.versionData=versionData;
            this.fileName=fileName+'.'+fileType;
        }
    }
}