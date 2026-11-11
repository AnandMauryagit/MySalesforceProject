trigger CreateOpp on Account (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        list<Opportunity> OppIsInserted = new list<Opportunity>();
        
        For(Account Ac : trigger.new){
            if(Ac.Type =='Agriculture'){
                Opportunity Opp = New Opportunity();
                opp.AccountId = Ac.Id;
                Opp.name=Ac.name+'Agriculture';
                opp.StageName = 'Negotiation';
                opp.CloseDate = System.today();
                OppIsInserted.add(opp);
            }
        }
        insert OppIsInserted;
    }
}