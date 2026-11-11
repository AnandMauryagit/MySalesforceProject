public class DmlOperations {
    public static void inertdmlCustome(){
        account h = new account ();
        Opportunity_LineItem__c[] savedAccts = [SELECT Id, Name FROM Opportunity_LineItem__c]; 
        undelete savedAccts;
        
        
    }
    
}