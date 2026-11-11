trigger Product_OffercOfferChangeUpdate on Product_Offer__c ( after update) {
  Product_OffercOfferChangeUpdatehandler.ProductOfferRecord(trigger.new,trigger.oldMap);

}