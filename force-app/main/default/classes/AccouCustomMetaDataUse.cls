public class AccouCustomMetaDataUse {
    public static void getRecord ( list<account>newData){
        map<string,custom_Account__mdt> gettRec= new  map<string,custom_Account__mdt> ();
        for(custom_Account__mdt getmdtRec:custom_Account__mdt.getall().values()){
            gettRec.put(getmdtRec.Name__c, getmdtRec);
        }             
        for(account acc:newData){
            if( acc.Name.replace(' ','') == gettRec.get( acc.Name.replace(' ','')).Name__c){                
                acc.Phone = gettRec.get( acc.Name.replace(' ','')).Phone__c;         
            }            
        }
    }
}

//for(custom_Account__mdt checkValue:getmdtRec.values()){   


/* public static void getRecord ( list<account>newData){
list<custom_Account__mdt> getmdtRec = custom_Account__mdt.getall().values();
list<string> aacName= new list<string>(); 
for(account acc:newData){
for(custom_Account__mdt checkValue:getmdtRec){                
if(acc.Name == checkValue.Name__c&& acc.Phone!=checkValue.Phone__c){
aacName.add(acc.Name);    
}
}
}
list<account> numupdate= new list< account>();
list<account> accRec = new list< account>([select id ,name,phone from  account  where name IN :aacName]);
system.debug(accRec);
for(account newAcc:accRec){
for(custom_Account__mdt checkV:getmdtRec){ 
if(newAcc.Name == checkV.Name__c ){

newAcc.Phone=checkV.Phone__c;

numupdate.add(newAcc);
}
}               

}
update numupdate;
}*/