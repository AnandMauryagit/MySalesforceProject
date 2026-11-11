trigger AccountTriggers on Account (Before Insert){
/*List<contact> cons=new List<contact>();
      for(Account acc: Trigger.New){
            Contact c=new Contact();
            c.accountid=acc.id;
            c.lastname=acc.name;
            c.phone=acc.phone;
            cons.add(c);
           }
   insert cons;*/
    
        MixedDMLErrorHandler.updateUser();

    List<String>Alist=New List<String>();
        List<Account>aclist=[Select id,Name from Account];
    For(Account acc:aclist){
        Alist.add(acc.Name);
    }
    for(Account ac:trigger.new){
        if(Alist.contains(ac.Name)){
            ac.Name.addError('D');
        }
    }
    
}