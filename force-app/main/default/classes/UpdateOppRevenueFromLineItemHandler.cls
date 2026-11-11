public class UpdateOppRevenueFromLineItemHandler {
    public static void insertRevenue(list<Opportunity_LineItem__c>lstOppRev){
        Double ActualAmount=0;
        Double ProjectedAmount =0;
        set<id> idset= new set<id>();
        for(Opportunity_LineItem__c oppLinItm :lstOppRev ){
            if(oppLinItm.OppStatus__c!=Null){
                idset.add(oppLinItm.OpportunityId__c);
            }           
        }
        list<id> idToUpdat =new list<id>();
        for(Opportunity_LineItem__c linItmAddi :lstOppRev){
            if(linItmAddi.OppStatus__c!=Null){
                idToUpdat.add(linItmAddi.OpportunityId__c); 
                if(linItmAddi.OppStatus__c =='Actual Amount'){
                    ActualAmount +=  linItmAddi.LineItemAmount__c;
                }else{
                    ProjectedAmount += linItmAddi.LineItemAmount__c;
                }
            }
        }
        list<Opportunity> lstOpp = [select Actual_Revenue__c,Expected_Revenue__c from Opportunity where id IN:idset];
        for(Opportunity assignRevenu :lstOpp){
            assignRevenu.Actual_Revenue__c = ActualAmount;
            assignRevenu.Expected_Revenue__c = ProjectedAmount;
            
        }
        update lstOpp;
    }
    // update process begins here 
    public static void assignRevenue(map<id,Opportunity_LineItem__c>oppLine,map<id,Opportunity_LineItem__c>oldOppLine){
        map<id,Opportunity_LineItem__c> linItmchangeVal =new map<id,Opportunity_LineItem__c>();
        for(Opportunity_LineItem__c OppliItm:oppLine.values()){
            if(OppliItm.LineItemAmount__c!=Null && OppliItm.OppStatus__c!=oldOppLine.get(OppliItm.Id).OppStatus__c){
                linItmchangeVal.put(OppliItm.OpportunityId__c,OppliItm);
            }
        } 
        if(!linItmchangeVal.isEmpty()){
           /*
            double dedExpVal =0;
            double dedActAmou =0;
            map<id,Opportunity>oppRec = new map<id,Opportunity>([select Expected_Revenue__c,Actual_Revenue__c from Opportunity where id IN:linItmchangeVal.keyset()]);
            for(Opportunity assignVal:oppRec.values()){
                if(linItmchangeVal.get(assignVal.Id).OppStatus__c=='Expected Amount' && assignVal.Expected_Revenue__c !=Null ){
                    dedExpVal= assignVal.Actual_Revenue__c-oldOppLine.get(assignVal.Id).LineItemAmount__c;
                    //assignVal.Expected_Revenue__c = linItmchangeVal.get(assignVal.Id).LineItemAmount__c;
                    assignVal.Expected_Revenue__c = dedExpVal + oppLine.get(assignVal.Id).LineItemAmount__c;
                }
                system.debug('linItmchangeVal.get(assignVal.Id).OppStatus__c'+linItmchangeVal.get(assignVal.Id).OppStatus__c);
                if(linItmchangeVal.get(assignVal.Id).OppStatus__c=='Actual Amount' ){
                                       system.debug('assignVal.Expected_Revenue__c'+oldOppLine.get(assignVal.Id).LineItemAmount__c);
                   assignVal.Expected_Revenue__c=   assignVal.Expected_Revenue__c-oldOppLine.get(assignVal.Id).LineItemAmount__c ;
                    assignVal.Actual_Revenue__c= assignVal.Actual_Revenue__c + linItmchangeVal.get(assignVal.Id).LineItemAmount__c;
                }
            }
            update oppRec.values();
            */
            list<Opportunity> opps =[select Expected_Revenue__c,Actual_Revenue__c from Opportunity where id IN:linItmchangeVal.keyset() ];
            for(Opportunity compRevenue:opps){
                for(Opportunity_LineItem__c compLinItm :oppLine.values()){
                    if(compLinItm.OppStatus__c == 'Actual Amount' && compLinItm.LineItemAmount__c!=Null){
                       compRevenue.Expected_Revenue__c = compRevenue.Expected_Revenue__c- oldOppLine.get(compLinItm.id).LineItemAmount__c;
                        compRevenue.Actual_Revenue__c = compRevenue.Actual_Revenue__c + compLinItm.LineItemAmount__c;
                    } 
                    if(compLinItm.OppStatus__c =='Projected Amount'&& compLinItm.LineItemAmount__c!=Null){
                        system.debug('oldOppLine.get(compLinItm.id).LineItemAmount__c'+oldOppLine.get(compLinItm.id).LineItemAmount__c);
                        system.debug('compRevenue.Actual_Revenue__c'+compRevenue.Actual_Revenue__c);
                       compRevenue.Actual_Revenue__c = compRevenue.Actual_Revenue__c- oldOppLine.get(compLinItm.id).LineItemAmount__c;
                        system.debug('compRevenue.Actual_Revenue__c '+compRevenue.Actual_Revenue__c );
                        compRevenue.Expected_Revenue__c = compRevenue.Expected_Revenue__c + compLinItm.LineItemAmount__c;
                    } 
                }
            }
            update opps;
        }
    }
}