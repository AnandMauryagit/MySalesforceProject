public class LongestSubStringWithoutRepetation {
    public static void filterSubString(){
        set<String>LstOfString = New set<String>{'andfghjan','dfhjkdfjdf','asdfghj','asasjsak','ghjk'};
            List<String>resultList =New List<String>();
        for(String checkRepetation :LstOfString){
            list<String>splitedString = checkRepetation.split('');
            for(String checkRepeat:splitedString){
                if(checkRepetation.countMatches(checkRepeat)>1){
                    LstOfString.remove(checkRepetation);    
                }                   
            }        
        }
        for(String sortString :LstOfString){
            if(resultList.isEmpty()){
                resultList.add(sortString);
            }else{
                if((resultList.get(resultList.size()-1).length())>(sortString.length())){
                    resultList.add(resultList.size()-1,(resultList.get(resultList.size()-1)));
                }else{
                    resultList.add(sortString);
                }              
            }           
        }
        system.debug('notRepeated-----'+resultList.get(resultList.size()-1));
    }  
}