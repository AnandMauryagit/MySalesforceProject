public class ManageAssignmentInRelationRecordCreation {
    public Static void recordToAssignOnCreation(list<Case>listOfRec){
        Map<String,List<String>>toManageRecord = New Map<String,List<String>>();
        for(Case caseRec : listOfRec){
            toManageRecord.put(caseRec.Subject,New List<String>{caseRec.ContactEmail , caseRec.Reason});
            
        }
        
        list<Account> accCreatedList = new list<Account>();
        for(String accMapping :toManageRecord.keyset()){
            Account accToCreate = New Account ();
            accToCreate.Name = accMapping;
            accCreatedList.add(accToCreate);
        }
        Insert accCreatedList;
        list<Sobject> toInsertData= New list<Sobject>();
            for(Account matchAccount :accCreatedList){
            Contact conCreation = New Contact();
            conCreation.AccountId = matchAccount.Id;
            
            conCreation.LastName = toManageRecord.get(matchAccount.Name).get(0);
            Case CaseCreate = New Case ();
            CaseCreate.AccountId = matchAccount.Id;
            CaseCreate.Status= 'New';
            CaseCreate.Priority= 'Low';
            CaseCreate.Origin = 'Web';
            conCreation.Responce__c = toManageRecord.get(matchAccount.Name).get(1);
            toInsertData.add(conCreation);
            toInsertData.add(CaseCreate);
        }
        Insert toInsertData;
    }
}


//tagada right.
/*public class ApexTestPraticeCode {
    
     public static void processARecords(List<A_Object__c> aRecords) {
        List<B_Object_c> bRecords = new List<B_Object_c>();
        List<C_Object_c> cRecords = new List<C_Object_c>();
        List<D_Object_c> dRecords = new List<D_Object_c>();
        
        for (A_Object__c aRec : aRecords) {
            B_Object_c bRec = new B_Object_c();
            bRec.Name = aRec.Name;
            bRec.Address_c = aRec.Address_c;
            bRecords.add(bRec);
        }
        
        
        insert bRecords;
        
        for (Integer i = 0; i < aRecords.size(); i++) {
            A_Object__c aRec = aRecords[i];
            B_Object__c bRec = bRecords[i]; 
            
            C_Object_c cRec = new C_Object_c();
            cRec.Email_c = aRec.Email_c;
            cRec.B_Object__c = bRec.Id;
            cRecords.add(cRec);
            
            D_Object_c dRec = new D_Object_c();
            dRec.Phone_c = aRec.Phone_c;
            dRec.B_Object__c = bRec.Id;
            dRecords.add(dRec);
        }
        
        insert cRecords;
        insert dRecords;
    }

}*/

/*public class ConfigurAllRec {
public static void GetData(List<Account_Rec__c> accRecList) {
List<Account_Rec_c> accRecList2 = new List<Account_Rec_c>();
List<Account> accList = new List<Account>();
List<Contact> conList = new List<Contact>();
List<Opportunity> oppList = new List<Opportunity>();

for (Account_Rec__c accRec : accRecList) {
if (accRec.Email__c != null) {
accRecList2.add(accRec);
Account acc = new Account();
acc.Name = accRec.Name; 
accList.add(acc);
}
}

if (!accList.isEmpty()) {
// Insert accounts
insert accList; 

// Create contacts and opportunities
for (Integer i = 0; i < accRecList2.size(); i++) {
Account_Rec__c accRec = accRecList2[i];

// Create Contact
Contact con = new Contact();
con.LastName = accRec.Name; 
con.Email = accRec.Email__c; 
con.AccountId = accList[i].Id; 
conList.add(con);

// Create Opportunity
Opportunity opp = new Opportunity();
opp.Name = accRec.Name; 
opp.AccountId = accList[i].Id; 
opp.CloseDate = Date.today(); 
opp.StageName = 'Prospecting'; 
oppList.add(opp);
}

insert conList; 
insert oppList; 
}
}
}*/