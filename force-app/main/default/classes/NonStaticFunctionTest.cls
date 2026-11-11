/************
Class Name      : updateDML
Description     : Here we see how we found a DML limit error. 

Created Date    : 29-Jan-2024
Reviewd By      :
VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              30-Jan-2024             Anand              Initial Implementation        
*************/
public class NonStaticFunctionTest {   
    integer atmPin=6;
    integer distPin=2;
    integer sum;
    public integer pinCollection(){
        sum = atmPin +distPin;
        system.debug(sum);
        return sum;
    }
    /* Calling a non static function --
NonStaticFunctionTest callings = new NonStaticFunctionTest();
callings.pinCollection(); ------*/
}