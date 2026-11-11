public class OrderLineItemAmountAhandler {
public static void Amount_utopopulate_on_amount_and_Quantity(list <OrderLineitem__c> newCartList ){
        set <id> ids = new set <id> ();
        for(OrderLineitem__c getid :newCartList){
            if(getid.Product__c != null){
                ids.add(getid.Product__c);
            }
        }
        map <id ,Product__c> getAmountAndQuntity=new  map <id ,Product__c>([select id , List_Price__c ,Remainig_Quantity__c, Inventory__c from Product__c where id =:ids ]);
        if(getAmountAndQuntity != null){
            for(OrderLineitem__c create : newCartList){
                if(getAmountAndQuntity.get(create.Product__c) != null){
                create.Unit_Price__c = getAmountAndQuntity.get(create.Product__c).List_Price__c;
                }
                Product__c newProduct = new Product__c();
               // for(Product__c  prodQuant :newProduct){
//prodQuant.Remainig_Quantity__c = prodQuant.Remainig_Quantity__c - create.Quantity__c ;   
                    
                }
                }
                
                
        }
    }