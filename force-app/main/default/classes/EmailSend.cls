public class EmailSend {
    Public Static void Send(){
        list<string> mailtolist = new list<string>();
        mailtolist.add('surendramaurya1795@gmail.com');
        messaging.SingleEmailMessage myemail = new messaging.SingleEmailMessage();
        myemail.setToAddresses(mailtolist);
        myemail.setSubject('Your Record information ');
        myemail.setPlainTextBody('your has been updated ');
        messaging.sendEmail(New Messaging.SingleEmailMessage[]{myemail});
        system.debug('email send');
    }
}