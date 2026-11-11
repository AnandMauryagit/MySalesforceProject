public class CaseAssignInQueueHandler {
    Static String queueNames;
    Public Static map<String,Integer>caseSizeOfUsers = New Map<String,Integer>();
    public static void checkAndAssignCaseToUser(List<Case>newCase,Map<Id,Case>newCaseMap){       
        Map<Id,Case>copyNewCase = new Map<Id,Case>(newCaseMap);
        list<Group>lstOfQueue= [SELECT Id,Name,(SELECT UserOrGroupId FROM  GroupMembers)FROM Group WHERE Type='Queue'];
        list<Id>memberId=new list<Id>();
        for(Group getQueueMember :lstOfQueue){
            queueNames = getQueueMember.Id;
            for(GroupMember queueMembId :getQueueMember.GroupMembers){
                memberId.add(queueMembId.UserOrGroupId);
            }
        }
        list<AggregateResult>userRecord=[Select Count(Id),OwnerId From Case where OwnerId IN : memberId Group By OwnerId order by count(Id) Asc];
        for(AggregateResult checkCaseNo :userRecord){       
            caseSizeOfUsers.put((String)checkCaseNo.get('OwnerId'),(Integer)checkCaseNo.get('expr0'));    
        }
        for(Case CasRec :copyNewCase.Values()){
            list<String>IdNumberWise = new list<String>(caseSizeOfUsers.KeySet()) ;
            String LeastCasetWithUser = swapMap(caseSizeOfUsers);
            If(caseSizeOfUsers.get(LeastCasetWithUser) <5){
                CasRec.OwnerId =  LeastCasetWithUser;
                caseSizeOfUsers.put(LeastCasetWithUser,caseSizeOfUsers.get(LeastCasetWithUser)+1);
                copyNewCase.remove(LeastCasetWithUser);                
            }   
            else{
                CasRec.OwnerId =  queueNames;
            }
        }     
    }
    public Static String  swapMap(Map<String,Integer>caseSizeOfUsers){
        Map<integer,String> exchangeKeyValuePlace = new Map<Integer,String>();
        for(String nums :caseSizeOfUsers.keyset()){
            exchangeKeyValuePlace.put(caseSizeOfUsers.get(nums),nums);
        }
        Map<String,Integer> exchangesorts = new Map<String,Integer>();
        list<Integer>sortings = new list<integer>(exchangeKeyValuePlace.keyset());
        sortings.sort();
        return String.valueOf(sortings.get(0));
    }
}