public class FindAllFullnamePerAccount {
    public static void fullNameFinder(list<String>accName){
        list<Account>accProduct =[SELECT  Name ,Product__c FROM Account WHERE Name IN :accName];
        Map<String,String> mapAccountData = New Map <String,String>();    
        for(Account accCreatePair :accProduct){
            mapAccountData.Put(accCreatePair.Product__c,accCreatePair.Name);
        }
        Map<String,List<String>> allResult = New Map<String,List<String>>();
        List<Contact>conRecordProductWise = [SELECT LastName, FullName__c FROM Contact Where LastName IN :mapAccountData.Keyset()];
        for(Contact ConData :conRecordProductWise){
            if(! allResult.ContainsKey(mapAccountData.get(ConData.LastName))){
                allResult.Put( mapAccountData.get(ConData.LastName),new list<String>{ConData.FullName__c});
            }else{
                allResult.get( mapAccountData.get(ConData.LastName)).add(ConData.FullName__c);
            }
        }
        system.debug('allResult --'+allResult);
    }
}