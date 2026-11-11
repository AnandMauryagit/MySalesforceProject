@isTest
public class UpdateSizeOppEquals4Test {
 
      @isTest   public static void UpdateSizeOppEquals4TestMethod(){
      
                  list <account> subject=[select id,Name from account limit 3];

         for(account abc:subject){
            abc.Name = 'sd';
         }
        update subject;
           updateDML.program();
    
}
}