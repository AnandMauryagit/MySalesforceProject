public class DmlAccounts {
    public static void InsertDmls (){
     List<account>input=new list<account>();
        for(integer i=0;i<=10;i++){
        account alter=new account();
        alter.name= 'anand maurya'+i;
        alter.phone='38947547'+i;
        input.add(alter);
        }
           Insert input;
    }
    public static void updateDmls(){
    List<account>outcome=[select id, name from account limit 10];    
        for(account upd:outcome){
            upd.name='hari';
        }
        update outcome;
    }
    public static void DeleteDmls(){
      List<account>Erase=[select id, name from account limit 5];    
        for(account dele:Erase){
        dele.name='hari';
        }
   delete Erase;
    }
    public static void UnDeleteDmlss(){
    List<account>retu=[select id, name from account where isdeleted=true and name='hari'all rows];
      account retur=new account();
       retur.name='hari';
     
      Undelete retu;
    }
    
}