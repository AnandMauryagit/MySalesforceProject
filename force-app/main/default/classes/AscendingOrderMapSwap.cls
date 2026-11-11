public class AscendingOrderMapSwap {
    public Static void swapMap(){
        Map<String,Integer>mapOfRecord =new Map<String,Integer>{'A'=>4,'b'=>2,'c'=>3,'d'=>1};
            Map<integer,String> exchangeKeyValuePlace = new Map<Integer,String>();
        for(String nums :mapOfRecord.keyset()){
            exchangeKeyValuePlace.put(mapOfRecord.get(nums),nums);
        }
        Map<String,Integer> exchangesorts = new Map<String,Integer>();
        list<Integer>sortings = new list<integer>(exchangeKeyValuePlace.keyset());
        sortings.sort();
        for(integer sortedNums :sortings){ 
            exchangesorts.put(exchangeKeyValuePlace.get(sortedNums),sortedNums);
             system.debug('swapMap'+exchangesorts);
        }
    }
}