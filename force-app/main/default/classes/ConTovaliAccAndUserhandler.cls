public class ConTovaliAccAndUserhandler {
    public static void filterDuplicateWithAccUser(List<Contact>NewList){
        Map<String,Contact>conRecToFilter= New Map<String,contact>();
        For(Contact Cont :NewList){
            if(!conRecToFilter.containskey(Cont.AccountId+'-'+Cont.OwnerId)){
                conRecToFilter.put(Cont.AccountId+'-'+Cont.OwnerId,Cont);   
            }else{
                Cont.addError('Enter New Account you entering existing account.'); 
            }
        }
        List<Contact>CondataToMatch = [Select id, AccountId,OwnerId, LastModifiedById From Contact];
        for(Contact Cons :CondataToMatch){
            
            
            if(conRecToFilter.containskey(Cons.AccountId+'-'+Cons.OwnerId)){
                conRecToFilter.get(Cons.AccountId+'-'+Cons.OwnerId).addError('Enter New Account you entering existing account.');  
            }
        }
        
    }   
}