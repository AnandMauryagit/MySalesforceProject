public class EmailSender {

    public static void sendEmailWithTemplate(Id templateId, String recipientEmail, String subject, Map<String, String> templateVariables) {
        // Create a new instance of SingleEmailMessage
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        // Set the email template ID
        mail.setTemplateId(templateId);

        // Set the recipient address
        mail.setToAddresses(new List<String>{ recipientEmail });

        // Set the subject of the email
        mail.setSubject(subject);

        // Set the whatId if needed (e.g., related to a record, like an Account or Opportunity)
        // mail.setWhatId('001xxxxxxxxxxxx');

        // Set the target object ID if the email template contains merge fields that require a contact or lead
        // mail.setTargetObjectId('003xxxxxxxxxxxx');

        // Set any additional template variables (merge fields) in the email template
        mail.setWhatId(templateVariables.containsKey('whatId') ? templateVariables.get('whatId') : null);
        mail.setTargetObjectId(templateVariables.containsKey('targetObjectId') ? templateVariables.get('targetObjectId') : null);

        // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}