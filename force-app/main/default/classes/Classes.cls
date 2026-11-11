public class Classes {
    public static void dataCheck(){
        // A String variable to store any objects's API name
        String a_Object_API_Name = 'Account';
        
        Map<String, Schema.SObjectField> M_Objects_Schema_Field = Schema.getGlobalDescribe().get(a_Object_API_Name).getDescribe().fields.getMap();
        
        
        // Loop the keyset of map.
        for( String a_Field_Name : M_Objects_Schema_Field.keySet() ) {
            Schema.DescribeFieldResult a_Field_Description = M_Objects_Schema_Field.get( a_Field_Name ).getDescribe();
            System.debug('Data type:' +a_Field_Description.getType());
            
            
        }
    }
        
        public static void dataCheckType(String fieldName , String dataWeFill){
            String objectName = 'Account';
            //String fieldName = 'Name';
            
            SObjectType r = ((SObject)(Type.forName('Schema.'+objectName).newInstance())).getSObjectType();
            DescribeSObjectResult d = r.getDescribe();
           System.debug(d.fields
        .getMap()
        .get(fieldName)
        .getDescribe()
        .getType());
                         
                         
        }
    
}