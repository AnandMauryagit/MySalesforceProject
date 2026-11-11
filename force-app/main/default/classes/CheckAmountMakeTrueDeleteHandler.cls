public class CheckAmountMakeTrueDeleteHandler{
    public static void amountCheckerAndMakeTrue(List<Opportunity_LineItem__c>oldLineItem){      
        for(Opportunity_LineItem__c checkAmount :oldLineItem){
            if(checkAmount.Amount__c >=500){
               checkAmount.IsDelete__c = True; 
            }
        }
        
    }
}