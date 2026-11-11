public class CountConOnAcc {
    public static map<Id,list<Contact>> ContData(list<contact>allCon){
        map<id,list<contact>>storeCon =new map<id,list<contact>>();
        for(contact ConOneByOne:allCon ){
            if(!storeCon.containskey(ConOneByOne.AccountId)){
                storeCon.put(ConOneByOne.AccountId, new list<contact>{ConOneByOne});                
            } else{

             storeCon.get(ConOneByOne.AccountId).add(ConOneByOne);
            }
             }
                                             system.debug('storeConccccc'+storeCon);
        return storeCon;
    }
    
    
}