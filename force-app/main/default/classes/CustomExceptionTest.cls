public class CustomExceptionTest {
    Contact record;
    public CustomExceptionTest(String lastName){
        List<contact> contacts = [SELECT Id,FirstName, LastName , Email From Contact WHERE LastName =:lastName];
        if(contacts.size()>0){
            this.record = contacts.get(0);
            System.debug(this.record);
        }
        else{
            throw new ContactException( 'Contact does not exist') ;
        }
    }
    public class ContactException extends Exception{}
}