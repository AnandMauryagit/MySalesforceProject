@isTest
public class UpdateCounterOnConHandlertest {
    @isTest
    public static void updateContacts(){
        list<account>newacc=new list<account>();
        for(integer i=1;i<=8;i++){
        Account Acc= new Account();
        Acc.Name='surendra'+i;
        Acc.counter__c=12;
            newacc.add(Acc);
        }
        insert newacc;
        list<contact>newconinsert= new list<contact>();
        for(account aacrec :newacc){
        contact con=new contact();
        con.AccountId=aacrec.Id;
        con.LastName='katwRU';
        con.Counter__c=15;
            newconinsert.add(con);
        }
        insert newconinsert;
        
        for(account updatacc:newacc){
            updatacc.Counter__c=123;
        }
        update newacc;
        list<contact>newcons=[select id ,Counter__c from contact where id IN: newconinsert];
        system.assertEquals(123,newcons[0].Counter__c);
       
        
    }
}