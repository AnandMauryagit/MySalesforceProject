public class CaseBusinessHourCalculateHelper {
    public static void calculateBusinessHour( Id recordId){
        List<BusinessHours> defaultBusinessHour =[Select id from BusinessHours where Name = 'default'];
        List<Case> caseRecord = [Select Id , CreatedDate From Case where Id =:recordId];
        if(!caseRecord.isEmpty()){
            Long BusinessTimeInSecond = BusinessHours.diff(defaultBusinessHour[0].Id,caseRecord[0].CreatedDate,System.Now());
            system.debug('BusinessTimeInSecond'+BusinessTimeInSecond);
        }
            
        
    }
}