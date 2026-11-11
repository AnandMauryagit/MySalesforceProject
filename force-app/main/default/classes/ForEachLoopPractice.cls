public class ForEachLoopPractice {
    public static void ForEachloops(){
    list<sobject> sObjList = new list<sObject>();
Account acc = new Account(name='testAcc');
Contact con = new Contact(lastName ='TestCon');
sObjList.add(acc);
sObjList.add(con);
insert sObjList;
    } 
}