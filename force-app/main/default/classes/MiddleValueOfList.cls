/************
Class Name      : MiddleValueOfList
Description     : Here we see how to find the mid value of a list without any pre defined function.
Created Date    : 03-Feb-2024
VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              03-Feb-2024            Anand              Initial Implementation        
*************/
public class MiddleValueOfList {
   static integer count=0;
    static integer reCount;
     static integer totalNum;
    public static integer midvalue(){
        list<integer>numList=new list<integer>{2,1,6,4,9,7,10};
            for(integer numComing:numList){
              count ++;
            }
        integer totalNum=count/2;
        integer midValue=numList[totalNum];
        return midValue;
    }
    public static list<integer> midvalueOfComingList(list<integer>enterNum){
            for(integer numComing:enterNum){
              count ++;
            }
          totalNum=Count/2;
         
        list<integer> midValue= new list<integer>{enterNum[totalNum]};
        return midValue;
    }
}