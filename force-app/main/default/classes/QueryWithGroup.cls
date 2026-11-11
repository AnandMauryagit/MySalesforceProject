public class QueryWithGroup {
    public static void test(){
        list <AggregateResult> ser =[Select Count(name),count(id), Leadsource from Lead group by Leadsource Having Count(Leadsource)>2 ]; 
         system.debug(ser);
           for(AggregateResult ars:ser){
            system.debug(ars);
        }
    }
    
}