public class Asthana {
    public static void allRecord (){
        list<account> allRecord=[SELECT Name, Id, IsDeleted, MasterRecordId FROM Account where name='surendra'];
        system.debug(allRecord);
        for(account all:allRecord){
            system.debug(all);
            if (all.name=='surendra'){
                system.debug('perd');
            }            
        }
    }
       
    
}