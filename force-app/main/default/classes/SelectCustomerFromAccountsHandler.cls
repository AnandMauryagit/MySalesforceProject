public class SelectCustomerFromAccountsHandler {
    public static void  getAccountCustomerSelected (list<Cart_c__c> newList){
        set<Id>idOfSelectedAccount=new set<Id>();
        for(Cart_c__c accId :newList){
            if(accId.Account__c!=Null){
                idOfSelectedAccount.add(accId.Account__c);
            }
        }
        if(!idOfSelectedAccount.isEmpty()){
            List<contact> conListFinal = [Select id,AccountId,Primary_Customer__c from Contact where AccountId =:idOfSelectedAccount];          
            for(contact  con : conListFinal){
                if(con.Primary_Customer__c== true){
                    for(Cart_c__c newcart :newList){
                        newcart.Customer__c  =  con.id;   
                    }                    
                }                    
            }                
        }
    }
}