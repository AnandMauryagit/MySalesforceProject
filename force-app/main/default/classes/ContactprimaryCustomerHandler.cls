public class ContactprimaryCustomerHandler {
    public static Boolean isRecursive = false;
     public static void insertContact(list<Contact> newList){
        set<id> ids = new set<id>();
        for (Contact newCon:newList){
                if (newCon.AccountId != null){
                    ids.add(newCon.AccountId);
                }
        }
        List<Contact> ConList = [Select id,name,Primary_Customer__c From contact Where accountId In:Ids];
        for(contact con:ConList){
            if(con.Primary_Customer__c){
                con.Primary_Customer__c=false;
            }
            update ConList;
        }
    }    
    public static void updateContact(list<Contact> newList,map<id,Contact> oldCon){
        if(isRecursive) 
            return;
        map<id,id> ids = new map<id,id>();      
        for (Contact newCon:newList){
            if(newCon.Primary_Customer__c != oldCon.get(newCon.Id).Primary_Customer__c){
                if (newCon.AccountId != null){
                    ids.put(newCon.Id,newCon.AccountId);
                }
            }
        }
        List<Contact> listOFContactToUpdate = new List<Contact>();
        for(contact con:[Select id,name,Primary_Customer__c From contact Where accountId In:Ids.values()]){
            if(!ids.containsKey(con.Id)){
                con.Primary_Customer__c=false;
                listOFContactToUpdate.add(con);
            }
        }
        if(!listOFContactToUpdate.isEmpty()){
            isRecursive = true;
            update listOFContactToUpdate;
        }
            
        
    }
}