public class CasePriorityCustomerTierHandler {  
    public static void compareCustomerTierInsert(list<Case>newLis){
        Map<string,Case_Priority__mdt> storeMetadata = new Map<string,Case_Priority__mdt>();
        list<Case_Priority__mdt > listCaseMeta= [Select Issue_Type__c,Customer_Tier__c,Case_Priority__c From Case_Priority__mdt];
        for(Case_Priority__mdt compTier :listCaseMeta){
            string keys = compTier.Customer_Tier__c+'@'+compTier.Issue_Type__c;
            storeMetadata.put(keys,compTier);           
        } 
        for(Case caseCompare : newLis) {
            string keyCompare= caseCompare.Cusomer_Tier__c+'@'+caseCompare.Issue_Type__c;
            if(storeMetadata.containsKey(keyCompare)){
                caseCompare.Priority=storeMetadata.get(keyCompare).Case_Priority__c;
            }
        }    
    }
    public static void compareCustomerTierUpdate(list<Case>newLisUpdate,Map<Id,Case>oldMapCase){
        Map<string,Case_Priority__mdt> storeMetad = new Map<string,Case_Priority__mdt>();
        list<Case_Priority__mdt > listCaseMetaRec= [Select Issue_Type__c,Customer_Tier__c,Case_Priority__c From Case_Priority__mdt];
        for(Case_Priority__mdt compTier :listCaseMetaRec){
            string keys = compTier.Customer_Tier__c+'@'+compTier.Issue_Type__c;
            storeMetad.put(keys,compTier);           
        } 
        list<Id>toUpdaCase =new list<Id>();
        for(Case caseCompUpda : newLisUpdate){
            if(caseCompUpda.Issue_Type__c!=oldMapCase.get(caseCompUpda.Id).Issue_Type__c
               || caseCompUpda.Cusomer_Tier__c!= oldMapCase.get(caseCompUpda.Id).Cusomer_Tier__c){
                   toUpdaCase.add(caseCompUpda.Id); 
               }
        }
        list<Case>caseData = [SELECT Issue_Type__c,Cusomer_Tier__c,Priority From Case Where Id IN: toUpdaCase ];
        for(Case tierCompare :caseData){
            String keyComp = tierCompare.Cusomer_Tier__c+'@'+tierCompare.Issue_Type__c;
            if(storeMetad.containsKey(keyComp)){
                tierCompare.Priority=storeMetad.get(keyComp).Case_Priority__c;
            }
        }
        Update caseData;           
    }
}