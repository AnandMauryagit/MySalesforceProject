public class QueuableIterfaceDemo22 implements queueable{
 Public void execute (QueueableContext qx){
        system.debug('i am in QueuableIterfaceDemo22 Class');
     list<Opportunity> opp2 = New list<Opportunity>();
        Opportunity Opp =new Opportunity();
     for(integer i=0; i<=5; i++){
        Opp.Name ='QueuableIterfaceDemo22 Opportunity'+i; 
            Opp.CloseDate= System.Today()+i;
            Opp.StageName= 'Prospecting'+i;
     }
            opp2.Add(Opp);
        Insert Opp2;
       system.debug('Opportunity inserted =='+Opp2);
    }
}