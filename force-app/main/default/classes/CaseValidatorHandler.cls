public class CaseValidatorHandler {
 public static void validatForCreateRecords(list<Case> newCaseList){
          List<CaseValidator__mdt> caseMetaRecord = CaseValidator__mdt.getAll().values();  
        Id userId = UserInfo.getUserId(); 
        list<AggregateResult> caseRecordList = [select count(id) , OwnerId  from Case  where OwnerId =:  userId  group by OwnerId];
        system.debug('caseRecordList'+caseRecordList);
          for(AggregateResult ar : caseRecordList) {
              if(Integer.valueOf(caseMetaRecord[0].CaseCounter__c) < (Integer)ar.get('expr0')){
                     for(case css :newCaseList ){
                         css.addError('you are not create new case');
                     }
      		   }
        }
 }
 }