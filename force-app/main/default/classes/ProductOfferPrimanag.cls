public class ProductOfferPrimanag {
    public static void DiscounManage(list<Product__c>newList){
        Set <String> availOffer = new Set <String>();
        for(Product__c  pronam: newList){
            if(pronam.Product_Offer__c != Null ){
                // availOffer.add(pronam.Id);
                availOffer.add(pronam.Product_Offer__c);
            }
        }
        List<Product__c> UpdatReady = New List<Product__c>();
        map<Id,Product_Offer__c> mapOfProduOffer = new map<Id,Product_Offer__c>( [Select id,Discount__c,Expired__c,Flat_Discount__c,Type__c from Product_Offer__c Where id IN :availOffer]);
        Product__c productIs =New Product__c();
        for(Product__c productOfferPrice :  newList){
            
            if( mapOfProduOffer.get(productOfferPrice.Product_Offer__c).Type__c == 'Flat'){
                productOfferPrice.Offer_Price__c= productOfferPrice.List_Price__c-   mapOfProduOffer.get(productOfferPrice.Product_Offer__c).Flat_Discount__c;
            }
            else {
                productOfferPrice.Offer_Price__c= productOfferPrice.List_Price__c- (productOfferPrice.List_Price__c*mapOfProduOffer.get(productOfferPrice.Product_Offer__c).Discount__c)/100 ;
            }
        
            if(productOfferPrice.Offer_Available__c == false){
                productOfferPrice.Offer_Price__c = productOfferPrice.List_Price__c ;
            } 
        } 
        
        for(Product__c  CheckActiveStage: newList){
            if(CheckActiveStage.Remainig_Quantity__c <= 0){
             CheckActiveStage.Active__c = False;
            }
        }
        for(Product__c  InventryEqualsRemaining: newList){
        InventryEqualsRemaining.Inventory__c=InventryEqualsRemaining.Remainig_Quantity__c;
        }
    }
}