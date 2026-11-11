public class CreateAccountContactOnApproval {
    Public static void AfterApprovCreateAccCon(list<Account_Request__c>NewList){
        List<Account> InsertAc = new List<Account>();
        List<Contact> InsertCon = new List<Contact>();
        
        for(Account_Request__c accReq : NewList){
            if(accReq.Status__c == 'Approved'){
               Account acc = new  Account ();

                acc.Name= accReq.Name;    
                acc.Phone = accReq.Phone__c;
                acc.DOB__c = accReq.DOB__c;
                acc.Email__c = accReq.Email__c; 
                InsertAc.Add(acc) ;
            }   
        }
        insert InsertAc;
            
            for(Account accdata : InsertAc){ 
             Contact con = new Contact ();
              con.AccountId=accdata.Id; 
            con.LastName= accdata.Name;
            
            con.DOB__c = accdata.DOB__c;
            InsertCon.Add(con) ;    
            
    }
        
    insert InsertCon;     
}
}