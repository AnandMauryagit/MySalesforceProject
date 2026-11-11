public class Productofferprimanag2 {
    public static void DiscounManage(list<Product__c>newList){
        list <Product__c> toupdate = new  list <Product__c>();
        Set <String> availOffer = new Set <String>();
        for(Product__c  pronam: newList){
            if(pronam.Product_Offer__c != Null ){
                availOffer.add(pronam.Product_Offer__c);
                
            }       
        }
        map<Id,Product_Offer__c> mapOfProduOffer = new map<Id,Product_Offer__c>( [Select id,Discount__c,Expired__c,Flat_Discount__c,Type__c from Product_Offer__c Where id IN :availOffer]);
        for(Product__c prd :  newList){
            prd.Offer_Price__c = mapOfProduOffer.get(prd.Product_Offer__c).Type__c =='Flat'? prd.List_Price__c-  mapOfProduOffer.get(prd.Product_Offer__c).Flat_Discount__c:mapOfProduOffer.get(prd.Product_Offer__c).Type__c =='Percentage'?prd.List_Price__c-(prd.List_Price__c*mapOfProduOffer.get(prd.Product_Offer__c).Discount__c)/100: prd.List_Price__c;            
          toupdate.Add(prd);  
        } 
      
            
        
    }        
}