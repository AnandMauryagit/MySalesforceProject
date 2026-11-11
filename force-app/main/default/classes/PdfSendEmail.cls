public class PdfSendEmail {
/*public reator()
    {
       
      
       

    }*/
   
    public static  void createPDF()
    {
        try
        {    
            // Instantiate a new http object
            Http h = new Http();
            // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
            HttpRequest req = new HttpRequest();
            req.setEndpoint('http://www.salesforce.com/assets/pdf/datasheets/sales-force-automation.pdf');
            req.setMethod('GET');
            // Send the request, and return a response
            HttpResponse res = h.send(req);
            System.debug('res is>>>>>>'+res);
            System.debug('res.getBody()>>>>>>'+res.getBody());
            Blob pdfContent= Blob.valueOf(res.getBody());
            //System.debug('pdfContent>>>>'+pdfContent);
           
            // Define the email 
   
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
           
            String[] toAddresses = new String[] {'anandmaurya4785@gmail.com'};
           
            Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
            efa.setFileName('attachment.pdf');
            efa.setContentType('application/pdf');
            efa.setBody(pdfContent);
           
            email.setSubject('Testing PDF attachment');
           
            email.setToAddresses(toAddresses);
            email.setPlainTextBody('Hello');

            email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});

            // Sends the email 
       
            Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});  
            //System.debug('>>>>>Email sent result'+r);


        }
        catch(Exception ex)
        {
            System.debug('>>>>>>>>>>>>>><<<'+ex);
        }

    }
}