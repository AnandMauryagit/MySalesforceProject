public class CountAssociatedContactFromAccount {
    public static void CountFunc(){
   /* map<String,List<Contact>> Condata =New map<String,List<Contact>>();
     List <Contact> ContacData =[Select Id,LastName,AccountId From Contact];
        for(Contact Con : ContacData ){
            if(Con.AccountId != null){
              system.debug(Con);
                
              
            }
        }   
    }*/
    /* Map<String,List<Contact>> conMap = new Map<String,List<Contact>>();
       // List<Account> accList = new List<Account>();
     
        for(Contact con: [SELECT Id, AccountId From Contact]){
            if(con.AccountId != null){
                if(!conMap.containskey(con.AccountId)){
                conMap.put(con.AccountId, new List<Contact>{con});
            } else{
                conMap.get(con.AccountId).add(con);
            }
        }
    }
       //  system.debug(conMap);
        for(Id cn: conMap.keySet()){
            System.debug('Contact count------'+ cn  + '----'  + conMap.get(cn).size());
        }
    }*/
        Map<String,list<Contact>> ConMap = new Map<String,list<Contact>>();
        for(Contact Con : [Select AccountId From Contact]){
            if(Con.AccountId != null){
                if(!ConMap.ContainsKey(Con.AccountId)){
                    ConMap.Put(Con.AccountId, new list<Contact>{Con});
                } else{
                    ConMap.get(Con.AccountId).Add(Con);
                }  
            }
        }
        for(id Ans : ConMap.keyset()){
            system.debug('Accont id =='+Ans+'   .........  '+' number of Associated Contacts =='+ConMap.get(Ans).size());
        }
}
}