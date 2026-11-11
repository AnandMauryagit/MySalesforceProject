public class ArrayUpToThree {
    static integer count=0;
    
    public static void validateIn (){
        list<integer>numHolder =new list<integer>{2,3,4,2,6,7,9,8,0,1};
            list<integer>newlist =new list<integer>();
        list<list<integer>>finalList = new list<list<integer>>();
        for(integer integ : numHolder){
            count ++;
            if(count <= 3){
                newlist.add(integ);
            }
            if(newlist.size()==3){ finalList.add(newlist.clone());}
            
            if (count==3) {count=0;} 
            
            if(newlist.size()==3){
                newlist.clear();
            }
            // this is the test commit for the feature branch;
            // this one too for the feature branch commit;
        }
        for(integer i=(finalList.size())*3;i<=(numHolder.size());i++ ){
            list<integer>remainingVal=new list<integer>{i};
                system.debug(i);
            finalList.add(remainingVal);     
        }
        system.debug('finalList'+finalList);
    }
}