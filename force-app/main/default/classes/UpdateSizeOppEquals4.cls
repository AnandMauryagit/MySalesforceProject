public class UpdateSizeOppEquals4 {
    integer remains;
    public static void toCheckOppSizeManageToFour(list<Account>oldlist){
        List<id> oppList = new  List<id>();
        List<opportunity> OppToBeAdded =new List<opportunity>();
        List<opportunity> OppToBeDeleted =new List<opportunity>();
        for(Account Acc:oldlist){
            oppList.add(Acc.id); 
        }
        list<Opportunity> OppSize =[Select id,Accountid from Opportunity where Accountid = : oppList];
        system.debug(OppSize);
        for(Account Acc:oldlist){
            if(Acc.Validate_Opp__c == true){
                if(OppSize.size()>4){
                    integer delet = OppSize.size()-4;
                    for(integer j=0;j<delet;j++){
                        OppToBeDeleted.add(OppSize[j]);   
                    }
                }
                else if (OppSize.size()<4){
                    for(integer i = OppSize.size();i<4; i++){
                        opportunity op = new opportunity ();
                        op.AccountId = Acc.Id;
                        op.stageName = 'Prospecting';
                        op.Name ='Ana Ma';
                        op.CloseDate =System.Today();
                        OppToBeAdded.add(op);
                    }
                }                
            }
        }
        insert OppToBeAdded ;
        delete OppToBeDeleted;
    } 
}