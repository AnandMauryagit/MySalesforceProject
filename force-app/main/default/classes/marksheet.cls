public class marksheet {
   static double totalMark=0;
    public static void allsub(integer math,integer hindi,integer eng,integer sst,integer sci){
        system.debug('math='+math+' hindi='+hindi+' english='+eng+' sst='+sst+' science='+sci);
        totalMark = math+hindi+eng+sst+sci;
        system.debug('total marks ='+totalMark);
        double avg= totalMark/5;
        system.debug('avrage='+avg);
        if (math>=40 && hindi>=40 && eng>=40 && sst>=40 && sci>=40){ 
        if(avg>=80){
            system.debug('grad A \n congratulation you are passed');
        }else if(avg>=70){
            system.debug('grad B \n congratulation you are passed');
        }else if(avg>=60){
            system.debug('grad c \n congratulation you are passed');
        }else if(avg>=50){
            system.debug('grad D \n congratulation you are passed');
        }else {system.debug(' you are failed');}
        
        }else {  
        system.debug('chullu bhar pani me dub mar ....because you are failed ');
        }
        
    }
}