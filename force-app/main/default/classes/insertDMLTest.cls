@isTest
          public class insertDMLTest {
  @isTest public static void program(){
        double i= Calculator2.Hal('sum',5,5,5);
      system.assertEquals(15,i); 
    }
    @isTest public static void program1(){
        double j= Calculator2.Hal('ghatana',10,5,0);
      system.assertEquals(5,j);
    }
              @isTest public static void program2(){
        double k= Calculator2.Hal('guna',10,5,2);
      system.assertEquals(100,k);
    }
}