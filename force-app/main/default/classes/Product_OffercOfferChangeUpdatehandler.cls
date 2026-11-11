public class Product_OffercOfferChangeUpdatehandler {
   /* public static void checkOfferChangeoldToNew (list<Product_Offer__c>updateddata ,map<id,Product_Offer__c>olddata){
        Map<Id,Product_Offer__c>offerIdMap=new  Map<Id,Product_Offer__c>();
        for(Product_Offer__c OfferPric :updateddata){
            if(OfferPric.Type__c!=olddata.get(OfferPric.Id).Type__c ||OfferPric.Flat_Discount__c!=olddata.get(OfferPric.Id).Flat_Discount__c || OfferPric.Discount__c!= olddata.get(OfferPric.Id).Discount__c){  
                offerIdMap.put(OfferPric.Id,OfferPric);
            }
        }
        List<Product__c> product = [Select id, List_Price__c ,Remainig_Quantity__c, Inventory__c from Product__c Where  Product_Offer__r.Id IN:offerIdMap.keyset()];
        List<Product__c> OfferToUpdate =new List<Product__c>();
        for(Product__c  newOffer:product){
            for(Product_Offer__c  newproductOffer:updateddata){
                if(newproductOffer.Type__c=='Flat'){
                    newOffer.Offer_Price__c=  newOffer.List_Price__c-newproductOffer.Flat_Discount__c;                    
                }   
                else{
                    newOffer.Offer_Price__c=newOffer.List_Price__c-(newOffer.List_Price__c*newproductOffer.Discount__c)/100;
                }
                OfferToUpdate.Add(newOffer); 
            }
        }   
        Update OfferToUpdate;    
    }*/
     public static void ProductOfferRecord(list<Product_Offer__c> newProOff,map<id,Product_Offer__c> oldOff){
        set<id> offId = new set<id>(); 
        for(Product_Offer__c proOff:newProOff){
            if(proOff != oldOff.get(proOff.Id)){
                offId.add(proOff.Id);
                system.debug('test'+offId);
            }
        }
        list<Product__c> product = [SELECT id FROM Product__c WHERE Product_Offer__c In: offId];
        update product;
    } 
}