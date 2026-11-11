public class CheckPostalCodeHandl {
    public static void postalCodCompa (list<account> newAccLst,map<id,account> accOldMap){
        integer matchCounter =0;
        Map<Id,Account> accEligibleForPinChanged= new map<Id,Account>();
        for(Account checkVal :newAccLst){
            system.debug('line 6 new value'+checkVal.Postal_Code__c+'--old vl---'+accOldMap.get(checkVal.Id).Postal_Code__c);
            if(!string.isEmpty(checkVal.Postal_Code__c) && checkVal.Postal_Code__c !=accOldMap.get(checkVal.Id).Postal_Code__c ){
                accEligibleForPinChanged.put(checkVal.Id,checkVal);
            }
        }
        map<Id,Contact> conId =new map<Id,Contact>();
        list<id>accIdToAssign=new list<Id>();
        list<Contact>conLst=[select Postal_Code__c,Postal_Code_Not_Valid__c,AccountId from Contact where AccountId IN: accEligibleForPinChanged.keyset()];
        for(Contact conData :conLst){
            if(conData.Postal_Code__c!= accEligibleForPinChanged.get(conData.AccountId).Postal_Code__c && accIdToAssign.size() < 2 && conData.AccountId==accEligibleForPinChanged.get(conData.AccountId).Id){
                conId.put(conData.Id,conData);
                matchCounter ++  ;
                accIdToAssign.add(conData.AccountId);
            }  
        }        
        for(Id conValidate :conId.keyset()){
            conId.get(conValidate).Postal_Code_Not_Valid__c = true;
        }       
        if(!accIdToAssign.isEmpty()){
            list<Account> acctoUoda=[select Postal_Code_Not_Valid__c ,Postal_Code__c from Account where id IN: accIdToAssign];
            for (Account accCheck :acctoUoda){
                if(accCheck.Postal_Code__c !=Null){
                    accCheck.Postal_Code_Not_Valid__c = true;
                }
            }
            Update acctoUoda;
        }
        Update conId.values();  
    }  
}