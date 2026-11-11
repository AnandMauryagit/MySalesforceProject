trigger AccountEmailTrigger on Account (after update) {
 List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
    Set<Id> accountIds = new Set<Id>();
    Map<Id, Contact> contactMap = new Map<Id, Contact>();
    for (Account updatedAccount : Trigger.new) {
        if (updatedAccount.Email__c == Trigger.oldMap.get(updatedAccount.Id).Email__c) {
            accountIds.add(updatedAccount.Id);
           // system.debug('updatedAccount.Id'+updatedAccount.Id);
          //  system.debug('accountIds'+accountIds);
        }
    }
    if (!accountIds.isEmpty()) {
        List<Contact> contactList = [SELECT Id, AccountId, LastName, FirstName, Phone, Email FROM Contact WHERE AccountId IN :accountIds ];
        for (Contact con : contactList) {
            contactMap.put(con.AccountId, con);
        }
    }
    LIST<Contact> ConDatas = new List<Contact > ();
    for (Account updatedAccount : Trigger.new) {
        if (updatedAccount.Email__c == Trigger.oldMap.get(updatedAccount.Id).Email__c) {
            
            Contact relatedContact = contactMap.get(updatedAccount.Id);
            ConDatas.add(relatedContact);
            if (relatedContact != null && relatedContact.Email != null) {
            for(Contact  Cont :ConDatas){
                Messaging.SingleEmailMessage newMail = new Messaging.SingleEmailMessage();
                List<String> sendToAddressesList = new List<String>{updatedAccount.Email__c};
                    system.debug('updatedAccount.Email__c'+updatedAccount.Email__c);
                newMail.setToAddresses(sendToAddressesList);
                newMail.setSubject('Your Account details have been updated');
                String body = 'Hello ' + relatedContact.FirstName + ' ' + relatedContact.LastName + ', ';
                body += 'Your details have been updated for the account: ' + updatedAccount.Name + '.<br/>';
               //s body += 'Hello ' + Cont.FirstName + ' ' + Cont.LastName + '<br/>';
                body += 'Account Name: ' + updatedAccount.Name + '<br/>';
                body += 'New Email Address: ' + updatedAccount.Email__c + '<br/>';
                newMail.setHtmlBody(body);
                mailList.add(newMail);
               // system.debug('mailList'+mailList);
            }
        }
   // }
    // }
    if (!mailList.isEmpty()) {
        //system.debug('Messaging'+Messaging);
        Messaging.sendEmail(mailList);
        
    }
}
    }
}