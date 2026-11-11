public class NestedList { 
    Public Static Void Newlist(){
        List<Sobject>SObj=[SELECT id,Name,(Select Id,Name From Contacts),(Select Id,Name From Opportunities)From Account];                                                                                                                                                                                                                                                                                                                                                                                                                                          
       // List<Contact> ConList =New List<Contact>();
       // List<Opportunity> OppList =New List<Opportunity>();      
       // SObj.Add(OppList);
        //SObj.Add(ConList);
        //for(Sobject InnerList:SObj){
           // for(String Element:InnerList){
           System.debug(SObj.getSObjectType());            }
        }