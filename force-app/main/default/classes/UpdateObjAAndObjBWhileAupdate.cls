public class UpdateObjAAndObjBWhileAupdate {
/*public Static void UpdateAmountOnBandCFromA(List<Obj_A__c> newList, Map<Id,Obj_A__c> oldMap){
       
        Set<Id> idOfA= new Set<Id>();
               
        if(!newList.isEmpty()){
            for(Obj_A__c ac : newList){
                if(oldMap!= NULL & ac.Amount__c != oldMap.get(ac.Id).Amount__c){
                    idOfA.add(ac.Id);
                }  
            }
        }
       
        List<sObject> sObjList = [SELECT Id, Name, (SELECT Id, Amount__c FROM Obj_Bs__r WHERE Obj_A__c IN : idOfA) FROM Obj_A__c WHERE Id IN : idOfA];
        List<sObject> finalsObject = New List<sObject>();
    For(sObject ref : sObjList){
            if (ref.getSObjectType() == Obj_A__c.SObjectType) {
               
                Obj_A__c  ac  = (Obj_A__c )ref;
               List<Obj_B__c> Bbs = ac.Obj_B__c;
               
                for (Obj_B__c con : Bbs) {
                    Obj_B__c updateContact = new Obj_B__c();
                        updateContact.id = con.Id;
                        updateContact.Amount__c = ac.Amount__c;
                   
                    finalsObject.add(updateContact);
                }
               
                // Access Opportunities for the current Account
               /* List<Opportunity> opportunities = acc.Opportunities;
                System.debug(opportunities);
                for (Opportunity opp : opportunities) {
                 
                    Opportunity UpdateOpportunity = new Opportunity();
                    UpdateOpportunity.Id = opp.Id;
                    UpdateOpportunity.Name = acc.Name;
                   
                    finalsObject.add(UpdateOpportunity);
                }
            }
        }
       
        if(finalsObject != NULL ){

           update finalsObject;
 
}
 }*/
    public static void updateRecordA(List<Obj_A__c> newList){
       
        Set<Id> ids = new Set<Id>();
        double amount = 0;
        for(Obj_A__c rec : newList){
            amount = rec.Amount__c;
            ids.add(rec.Id);  
        }      
        List<Obj_B__c> recBList = [SELECT Id, Amount__c, Obj_A__c FROM Obj_B__c WHERE Obj_A__r.id =: ids]; 
        if(recBList.size()>0){
            integer totalB = recBList.size();        
        double splitAmount = amount / totalB;
        Map<id,double> mapOfB = new Map<id,double>();        
        for(Obj_B__c recBdata : recBList){
            mapOfB.put(recBdata.Id,recBdata.Amount__c);
            recBdata.Amount__c = splitAmount;            
         
                             }
        
        update recBList;
        List<Obj_B__c> recOfBList = [SELECT Id, Amount__c, (SELECT Id, Amount__c FROM Obj_Cs__r) FROM Obj_B__c WHERE id =: mapOfB.keySet()];
       
        //Map<String,List<RecordC_c>> mapOfC = new Map<String,List<RecordC_c>>();
        List<Obj_C__c> recCList = new List<Obj_C__c>();
        for(Obj_B__c recB : recOfBList){
            //mapOfC.put(recB.id,recB.RecordC__r);
            if( recB.Obj_Cs__r.Size()>0){
                double splitAmountOfBToC = recB.Amount__c / recB.Obj_Cs__r.Size();            
            for(Obj_C__c recBInner : recB.Obj_Cs__r){
                recBInner.Amount__c = splitAmountOfBToC;
                recCList.add(recBInner);
            }    }
                    
        }
        update recCList;
}
}
}