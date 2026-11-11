public class ConcatRelatedOppName {
    public static  void  getConcatNameAndAssign(){
        list<account> accRec = [select Name , BillingAddress,(select name from opportunities)from account];       
        for(account itrateAcc :accRec){
            string concatedNme = '';         
            for(opportunity takeOpp:itrateAcc.opportunities){                
                concatedNme +=  takeOpp.Name  ;             
            }
            itrateAcc.Opp_Name__c = concatedNme;
        }       
        update accRec;
    }
}