public class DmlFunctionTesting {
    public static account updatePhone(string names,string phone){
        list<account>accList= [select id,name,phone from account where name=:names];      
        Account acc=new Account ();
        acc.Id=accList.get(0).id;
        acc.Phone= phone;
        update acc;
        return acc;
    }
    public static list<account> updaListAcc(list<string>accData,string phone){
        list<account> updateAcc=new list<account>();
        list<account>accList= [select id,name,phone from account where name IN :accData];      
        for(integer i=0;i<=(accList.size()-1);i++){
            account acc =new account();
            acc.Id=accList.get(i).Id;
            acc.Phone=phone;
            updateAcc.add(acc);
        }
        Update updateAcc;
        return updateAcc;
    }
    public static list<contact> createCon(){
        list<contact>conIns=new list<contact>();
        for (integer i=1;i<=50;i++){
            contact con =new contact();
            con.LastName='nam'+i; 
            conIns.add(con);
        }
        insert conIns;     
        return conIns;
        
    } 
    public static void deleteTodayCreatedRec(){
        list<contact> contactListTodel = [select LastName,CreatedDate from contact where CreatedDate=Today];
        delete contactListTodel;
    }
}