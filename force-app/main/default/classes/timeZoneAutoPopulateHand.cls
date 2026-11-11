public class timeZoneAutoPopulateHand {
    /*public static void populateTime (list<CustomerDemo__c>cusList){
     map<string,string>Mymap= new map<string,string>();
     List<Mastercustomer__c> ListCountryTiZo = [select state__c, country__c, TimeZone__c from Mastercustomer__c];
         if(cusList.size()>0){
          for(Mastercustomer__c masterMaping :ListCountryTiZo){
          String country = masterMaping.Country__c;
          Set<string>states=new Set<string>(masterMaping.State__c.split(';'));
              for(String state : states){
                  String contryState = country  + '-' + state;
                  Mymap.put(contryState,masterMaping.TimeZone__c);
                      }
            }
         for (CustomerDemo__c fieldUpdate : cusList){  
		 string country=fieldUpdate.Country__c;
         string state=fieldUpdate.state__c;
             string countrystate= country +'-' +state;
          if (Mymap.containsKey(countrystate)) {   
         fieldUpdate.timeZonne__c = Mymap.get(countrystate);              
		 		} 
		 	}
        }
     }*/
    public static void updateCustomerTimeZone(list<CustomerDemo__c>newCustomerList){
        Map<String, Map<string, String>> CountryStateTimeZoneMap = new Map<String, Map<string, String>>();
        List<Mastercustomer__c> allTimeZoneDataBase = [SELECT Id, country__c, state__c, TimeZone__c 
                                                         FROM Mastercustomer__c];
        for (Mastercustomer__c mtz : allTimeZoneDataBase) {
            if (!CountryStateTimeZoneMap.containsKey(mtz.Country__c)) {
                CountryStateTimeZoneMap.put(mtz.Country__c, new Map<string, String>());     
            }
            CountryStateTimeZoneMap.get(mtz.Country__c).put(mtz.state__c, mtz.TimeZone__c);
        }
        for(CustomerDemo__c cus:newCustomerList){
            cus.timeZonne__c= getTimeZone(cus.states__c,CountryStateTimeZoneMap.get(cus.Country__c));
        }
    }
    public static string getTimeZone(string states,map<string,string>statesAndTimeZoneMap){
        string returnValue;
        for(string str:statesAndTimeZoneMap.keySet()){
            if(str.contains(states)){
                returnValue = statesAndTimeZoneMap.get(states);
            }
        }
        return returnValue;
    }
}

    
/*public class AutoPapulateHndler {
    public static void TimezoneInFel(list<Customer__c> Cuslist){
        map<string,string> tzmap = new map<string,string>();
        list<TimezoneData_c> zoneData= [SELECT id,Countryc,Timezonec,Statec FROM TimezoneData_c];
        for(TimezoneData__c tz:zoneData){
            list<string> state = tz.State__c.split(';');
            for(integer i=0;i<state.size();i++){
                tzmap.put(tz.Country_c+state[i],tz.Timezone_c);}
        }
        for(Customer__c cus:Cuslist){
               string zone =tzmap.get(cus.Country_c+cus.state_c);
               cus.Timezone__c= zone;
           }
       }          
   }*/