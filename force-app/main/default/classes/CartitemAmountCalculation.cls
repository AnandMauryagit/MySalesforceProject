public class CartitemAmountCalculation {
   
    public static void Amount_utopopulate_on_amount_and_Quantity(list <Cart_Item__c> newCartList ){
        set <id> ids = new set <id> ();
        for(Cart_Item__c getid :newCartList){
            if(getid.Product__c != null){
                ids.add(getid.Product__c);
            }
        }
        map <id ,Product__c> getAmountAndQuntity=new  map <id ,Product__c>([select id , List_Price__c , Inventory__c from Product__c where id =:ids ]);
        if(getAmountAndQuntity != null){
            for(Cart_Item__c create : newCartList){
                if(getAmountAndQuntity.get(create.Product__c) != null){
                create.Amount__c = getAmountAndQuntity.get(create.Product__c).List_Price__c;
                
                
            }
        }
    }
}
}