public class MapInsertAndGet {
    public static void childrenCounterFunction(){
        map<integer,integer> mauSchoolClass1= new map<integer,integer>{1=>30,2=>40,3=>50,4=>45};
            map<integer,integer> mauSchoolClass2= new map<integer,integer>{1=>10,2=>150,3=>130,4=>25,5=>65,6=>34};            
                map<string,map<integer,integer>> distschool1= new map<string,map<integer,integer>>{'Mau School1'=>mauSchoolClass1,'Mau School2'=>mauSchoolClass2};
                    
                    
                    map<integer,integer> delhiSchoolClass1= new map<integer,integer>{1=>35,2=>43,3=>57,4=>48};
                        map<integer,integer> delhiSchoolClass2= new map<integer,integer>{1=>37,2=>49,3=>54,4=>45,5=>76,6=>56};
                            map<string,map<integer,integer>> distschool2= new map<string,map<integer,integer>>{'Delhi School1'=>delhiSchoolClass1,'Delhi School2'=>delhiSchoolClass2};
                                
                                
                                map<string,map<string,map<integer,integer>>>dist=new map<string,map<string,map<integer,integer>>>{'Mau'=>distschool1,'Delhi'=>distschool2};
                                    
                                  //  for(string )
                                    
                                    }
}