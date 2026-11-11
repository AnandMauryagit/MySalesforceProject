trigger ProductmanageOfferPri on Product__c (Before insert,before Update) {
      ProductOfferPrimanag.DiscounManage(trigger.new);  
    
      

}