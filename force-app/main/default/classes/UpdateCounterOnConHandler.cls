public class UpdateCounterOnConHandler {
    public static void contactUpdation(list<account>newAcc,map<id,account>oldMap){
        map<id,account>newCounterRec=new map<id,account>();
        for(account accRec:newAcc){
            if(accRec.counter__c!=Null && accRec.counter__c!=oldMap.get(accRec.Id).counter__c){
                newCounterRec.put(accRec.Id,accRec);
            }
        }
        list<contact>conToUpdate=new list<contact>([select AccountId,counter__c from contact where accountId IN: newCounterRec.keyset()]);
        list<contact> conUpdation=new list<contact>();
        if(!conToUpdate.isEmpty()){
        for(contact assignCon:conToUpdate){
            assignCon.counter__c= newCounterRec.get(assignCon.AccountId).counter__c;
            conUpdation.add(assignCon);
        }
             if(conUpdation!=Null){
            update conUpdation;
        }
       
        }
    }

    }