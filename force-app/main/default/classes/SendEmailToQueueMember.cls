public class SendEmailToQueueMember {
    //public static String subject = 'Test Email To queue';
    //public static String  body = 'we have got the email from apex  you have assigned a task';
    public static void sendEmailToQueueMembers(String returnedQueueName) {
        try {
            List<GroupMember> queueMembers = [SELECT UserOrGroupId FROM GroupMember WHERE Group.Name = : returnedQueueName];
            List<Id> listUserId  = New List<Id>();
            for (GroupMember gm : queueMembers) {
                listUserId.add(gm.UserOrGroupId);
            }
            // Get user emails
            List<User> userDeatil =[SELECT Email FROM User WHERE Id IN: listUserId];
            List<String> emailAddresses = New List<String>();
            for (User collectUserEmail : userDeatil) {
                emailAddresses.add(collectUserEmail.Email);
            }
            // Create the email message
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(emailAddresses);
            mail.setSubject('Test Email');
            mail.setHtmlBody('Are you getting email');
            // Send the email
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            System.debug('Email sent successfully to queue members.');
        } catch (Exception e) {
            System.debug('Error sending email: ' + e.getMessage());
        }
    }
}