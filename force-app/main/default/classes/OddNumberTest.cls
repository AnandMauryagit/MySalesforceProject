public class OddNumberTest {
  public  static integer sol;
    public static list<integer> oddFunction(){
        list<integer> numlist = new list<integer>();
        for (integer i = 1;i<=100;i=i+2){
             sol=i;
            numlist.add(i);
            System.debug(i);
             
        }
        
        return numlist;
    }
    //we can print wih this -------
    //list<integer> nums = OddNumberTest.oddFunction();
     //system.debug('nums'+nums);
}