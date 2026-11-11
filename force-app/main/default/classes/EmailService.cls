public class EmailService {

    public static void sendEmail() {
        // 1. Get a valid Contact ID for tracking (REQUIRED)
        // If you don't have this, the status will never change to '1'
        Contact trackingContact = [SELECT Id FROM Contact WHERE Email != null LIMIT 1];
        
        // 2. Create the email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        // 3. Set the specific recipient address
        mail.setToAddresses(new List<String>{'anand2461999@gmail.com'});
        
        // 4. ENABLE TRACKING PIXEL: Link to the contact but don't send it to them
       // mail.setTargetObjectId(trackingContact.Id);
        mail.setTreatTargetObjectAsRecipient(false); // Only send to 'setToAddresses'
        
        mail.setSubject('Test Email with Active Tracking Live Refresh');
        
        // 5. REQUIRED: Must use HTML for the tracking pixel to exist
        mail.setHtmlBody('<html><body><p>Hello, this is a test email with active tracking enabled.</p></body></html>');
        
        // 6. Save as activity so the 'EmailMessage' record is created
        mail.setSaveAsActivity(true);
        
        // Send email
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});
    }
}