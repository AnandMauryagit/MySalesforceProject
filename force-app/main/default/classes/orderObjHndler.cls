public class orderObjHndler {
    public static void orderAccountAnd(list<Oder__c>newOrder ){
        set<id> Ids =new set<id>();
        for(Oder__c orderin :newOrder){
            if(orderin.AccountName__c != Null){
             Ids.add(orderin.AccountName__c); 
            }
        }
         if(!Ids.isEmpty()){
            List<contact> conListFinal = [Select id,AccountId,Primary_Customer__c from Contact where AccountId =:Ids];          
            for(contact  con : conListFinal){
                if(con.Primary_Customer__c== true){
                    for(Oder__c newcart :newOrder){
                        newcart.Customer__c  =  con.id;   
                    }                    
                }                    
            }
    }
    }
    }