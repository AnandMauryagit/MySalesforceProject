public class Dmls {
    public static void loops(){
        list<account> looping=new list <account>();
        account allrecord = new account();
        allrecord.name='birendra';
        allrecord.phone='4345655';
        //system.debug(allrecord);
        insert allrecord;
        system.debug('allrecord'+allrecord);
        delete allrecord;
    }
     public static void undeleteAccounts() {
               List<Account> deletedAccounts = [
            SELECT Id, Name 
            FROM Account 
            
           where IsDeleted = TRUE 
            ALL ROWS
        ];
           undelete deletedAccounts;
         system.debug('deletedAccounts'+deletedAccounts);
    }
}