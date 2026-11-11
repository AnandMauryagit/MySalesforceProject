/************
Class Name      : PrintReverseList
Description     : Here we see how to print list reverse.
Created Date    : 06-Feb-2024
VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              06-Feb-2024            Anand              Initial Implementation        
*************/
public class PrintReverseList {
    static list<integer>numbe=new list <integer>{10,2,5,3,1,4,5,2,1};
        public static list<integer> printAsReverse(){
            list<integer>reverseNum =new list <integer>();
            for(integer newNum:numbe){
                reverseNum.add(((reverseNum.size())-(reverseNum.size())),newNum);
            }
            system.debug(reverseNum);
            return reverseNum;
        }
    //in this method we use array to do all the reorder in index value. 
    public static list<integer> reversrInArray(){
        list<integer>reverseOrder=new list<integer>();
        for( integer i=0;i<numbe.size();i++){
            for(integer j=i+1;j<numbe.size();j++){
                integer temp=numbe[i];
                numbe[i]=numbe[j];
                numbe[j]=temp;
            }
        }
        system.debug(numbe);
        return numbe;
    }
}