public class O2rderLineItemAmountAhandler {
    public static void Amount_utopopulate_on_amount_and_Quantity(list <OrderLineitem__c> newCartList,map<id,OrderLineitem__c>oldMapData ){
        list< Product__c> updateready = new list< Product__c>();  
        set <id> ids = new set <id> ();
        for(OrderLineitem__c getid :newCartList){
            if(getid.Product__c != null){
                ids.add(getid.Product__c);
            }
        }
        list<Product__c> getAmountAndQuntity =[select id , List_Price__c ,Offer_Price__c,Remainig_Quantity__c, Inventory__c from Product__c where id =:ids];          
        for(Product__c  prodQuant :getAmountAndQuntity){
            if(getAmountAndQuntity != null){
                for(OrderLineitem__c create : newCartList){
                    if(create.Product__c != null){
                        create.Unit_Price__c = prodQuant.Offer_Price__c;
                    }
                    if(create.Quantity__c<oldMapData.get(create.Id).Quantity__c){
                        prodQuant.Remainig_Quantity__c  = prodQuant.Remainig_Quantity__c +(oldMapData.get(create.Id).Quantity__c- create.Quantity__c); 
                    }
                    else{
                        prodQuant.Remainig_Quantity__c  = prodQuant.Remainig_Quantity__c -(create.Quantity__c - oldMapData.get(create.Id).Quantity__c);  
                    }               
                }
                updateready.add(prodQuant);                  
            }
        }
        update updateready;        
    }   
}