public class PickLIstClass {

   @InvocableMethod(label='Get Class method' description='picklist show by the class' )
    public static List<list<String>> getPicklist(){
        list<string> fistString= new list<string>();
        list<list<string>> finalString = new list<list<string>> ();
        fistString.add('element');
        fistString.add('element1');
        finalString.add(fistString);        
        
        return finalString;
    }
    @AuraEnabled
     public String valueStore;
}