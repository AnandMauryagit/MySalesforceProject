public class calculator{
  public static double result;
    public static double DoCalculation(string datatype,integer num1,integer num2,integer num3){
        if(datatype=='sum'){
            result=num1+num2;
            }
        if(datatype=='sub'){
           result=num1*num2;
       }
        if(datatype=='mul'){
            result=num1*num2;
        }
        if(datatype=='div'){
            result=num1/num2;
        }
        system.debug(result);
       return result;
    }
}