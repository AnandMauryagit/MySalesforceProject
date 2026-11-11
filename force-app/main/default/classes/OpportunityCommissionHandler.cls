public class OpportunityCommissionHandler {
    public static void OppRecCompare (List<Opportunity>newData,Map<Id,Opportunity>oldOpportunityRec){
        list<Id>oppId =new list<Id>();
        for(Opportunity oppCheckStat :newData){
            if((oppCheckStat.Amount!=Null && oppCheckStat.StageName =='Closed Won')&&(oppCheckStat.StageName!= oldOpportunityRec.get(oppCheckStat.Id).StageName)){
                oppId.add(oppCheckStat.Id );
            }
        }
        if(!oppId.isEmpty()){
            List<OpportunityUserRole__mdt> OppRoleMdt =[Select Role__c,Percent__c From OpportunityUserRole__mdt];
            Map<String,OpportunityUserRole__mdt>mapRecRoleWise = New Map<String,OpportunityUserRole__mdt>();
            for(OpportunityUserRole__mdt metaItrate :OppRoleMdt){
                mapRecRoleWise.put(metaItrate.Role__c,metaItrate);
            }
            list<Opportunity>oppData = [Select OwnerId ,Owner.Name,Amount,name,Owner.UserRole.Name from opportunity where Id IN:oppId];
            list<Commission__c>CommisionRecInsert =new list<Commission__c>();
            for(Opportunity checkOwnerRole :oppData){
                Commission__c creaetCommisRec =New Commission__c();
                creaetCommisRec.Name = checkOwnerRole.Owner.UserRole.Name;
                creaetCommisRec.User_Name__c = checkOwnerRole.Owner.Name;
                creaetCommisRec.TotalCommision__c = (checkOwnerRole.Amount)*mapRecRoleWise.get(checkOwnerRole.Owner.UserRole.Name).Percent__c/100;
                CommisionRecInsert.add(creaetCommisRec);   
            }
            Insert CommisionRecInsert;
        }
    }
}