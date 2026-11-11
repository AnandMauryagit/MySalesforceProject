public class PreviousAndNext {
    static integer enterIndex=0;
    static  list <integer> num = new list<integer>{1,2,3,4,5,6};
        public static integer nextVal(integer enterNum){
            integer enterIndex = num.indexOf(enterNum);
            if(enterIndex==(num.size()-1)){
                enterIndex= enterIndex-(num.size());
            }
            system.debug('nextvalue=='+num.get(enterIndex+1));
            return enterIndex;
        }
    public static void  PreviousVal(integer enterNum){
        integer enterIndex = num.indexOf(enterNum);
        if(enterIndex==0){
          enterIndex=num.size();  
        }
        system.debug('previousValue=='+num.get(enterIndex-1));
        
  
    }
}