/************
Class Name      : updateDML
Description     : Here we see how we return a static function. 
Created Date    : 29-Jan-2024
Reviewd By      :
VERSION          DATE                   AUTHOR                DETAIL
--------------------------------------------------------------------------------------------------------- 
1.0              30-Jan-2024            Anand              Initial Implementation        
*************/
public class StaticFunctionTest {
    static string name='Anand';
    static string lastName='Maurya';
    public static string add(){
        string address='mau';
        string sum = name+lastName+address;
        system.debug('sum ---  '+sum);
        return sum;      
    }
    // calling of any static function---StaticFunctionTest.add();----
}