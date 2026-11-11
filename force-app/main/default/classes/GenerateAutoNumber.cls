public class GenerateAutoNumber {
    public static List<String>AutoNumbvalueType(String maxSize,integer numSize){        
        list<string>a=new list<string>();
        for (integer i = 0; i <= numSize; i++){
            AutoNumberType temp= new AutoNumberType();
            String asd = String.valueOf(i);
            String m = maxSize.substring(asd.length(), maxSize.length());
          //  String s=m+asd;
            temp.AutoNumbervalueType=m+asd;
            a.add(temp.AutoNumbervalueType);
        }
        system.debug('numbers are s'+a);
        return a ;
    }
}