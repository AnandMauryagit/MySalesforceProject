@isTest
public class TestOpportunityCommissionHandler {
    @isTest
    public static void testingUpdateOpp(){
        list<Opportunity> oppInsert = new list<Opportunity>();
        
        for (integer i=1; i<=10;i++){
            Opportunity Opp =New Opportunity();
            Opp.Name = 'Rec'+i;
            Opp.StageName = 'Perception Analysis';
            Opp.CloseDate = System.Today()+55;
            oppInsert.add(Opp);          
        }
        Insert oppInsert;
        
    }
    
}