public class EmailForwardService {

    public static void forwardEmail(Id emailMessageId, String toAddress) {

        // Fetch original email
        EmailMessage em = [
            SELECT Id, Subject, TextBody, HtmlBody, FromAddress, ToAddress, MessageDate
            FROM EmailMessage
            WHERE Id = :emailMessageId
            LIMIT 1
        ];

        // Create email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        // Set single recipient
        mail.setToAddresses(new String[] { toAddress });

        // Subject
        mail.setSubject('Fwd: ' + em.Subject);

        // Build body
        String header = 
            '---------- Forwarded message ---------\n' +
            'From: ' + em.FromAddress + '\n' +
            'Date: ' + String.valueOf(em.MessageDate) + '\n' +
            'To: ' + em.ToAddress + '\n\n';

        mail.setPlainTextBody(header + em.TextBody);

        // HTML body (if exists)
        if (em.HtmlBody != null) {
            String htmlHeader =
                '<p>---------- Forwarded message ---------</p>' +
                '<p><b>From:</b> ' + em.FromAddress + '<br/>' +
                '<b>Date:</b> ' + String.valueOf(em.MessageDate) + '<br/>' +
                '<b>To:</b> ' + em.ToAddress + '</p>';

            mail.setHtmlBody(htmlHeader + em.HtmlBody);
        }

        // Send
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

        // Optional: mark as forwarded (if allowed)
        // update new EmailMessage(Id = emailMessageId, Status = '4');
    }
}