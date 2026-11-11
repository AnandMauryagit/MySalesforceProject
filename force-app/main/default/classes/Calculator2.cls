public class Calculator2 {
  static double solution ;
    public static double Hal(string data,integer value1,integer value2,integer value3){
        if(data=='sum'){
            solution=value1+value2+value3;
        }
        if(data=='ghatana'){
        solution=value1-value2;    
        }
        if(data=='guna'){
        solution=value1*value2*value3;
        }
        if(data=='bhag'){
        solution=value1/value2;
        }
        system.debug(solution);
    return solution;
   }
}