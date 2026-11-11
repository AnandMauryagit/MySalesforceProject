public class UpdateCounterOnAccHandler {
    public static void assignCon(list<contact>newCon){ 
        map<id,contact>collectid = new map<id,contact>();
        for(contact addingCon :newCon){
            collectid.put(addingCon.AccountId,addingCon);
        }
        list<account>storeAcc = [select id, counter__c from account where id IN:collectid.keyset()];  
        list<account>updateAcc = new list<account>();
        for(account assignCons: storeAcc){
            assignCons.Counter__c= collectid.get(assignCons.Id).Counter__c;
            updateAcc.add(assignCons);          
        }
        update updateAcc;       
    }
    public static void updateAccProcess(list<contact>newContact,map<id,contact>oldMaps){     
        map<id,contact>conId = new map<id,contact>();
        for(contact con :newContact){
            if(con.counter__c!=Null && con.counter__c!=oldMaps.get(con.id).counter__c){
                conId.put(con.AccountId,con);
            }
        }
        list<account>accList=[select id,counter__c from account where id IN: conId.keyset()];
        list<account>accToUpdate=new list<account>();
        for(account accouAssign:accList ) {
            accouAssign.counter__c= conId.get(accouAssign.Id).counter__c;
            accToUpdate.add(accouAssign);
        }
        if(accToUpdate!=Null){
            update accToUpdate;
        }
    }
}