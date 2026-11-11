@isTest
public class TestCartitemAmountCalculation {
   // CartitemAmountCalculation.Amount_utopopulate_on_amount_and_Quantity
    @isTest
    static void testAmount_utopopulate_on_amount_and_Quantity() {
        // Create test data
        Product__c testProduct = new Product__c(
            Name = 'Test Product',
            List_Price__c = 100.0,
            Inventory__c = 50
        );
        insert testProduct;

        Cart_Item__c testCartItem = new Cart_Item__c(
            Product__c = testProduct.Id
        );
        List<Cart_Item__c> testCartList = new List<Cart_Item__c>{ testCartItem };

        // Call the method to be tested
        Test.startTest();
        CartitemAmountCalculation.Amount_utopopulate_on_amount_and_Quantity(testCartList);
        Test.stopTest();

        // Verify the results
        System.assertEquals(testProduct.List_Price__c, testCartList[0].Amount__c);
    }

    @isTest
    static void testAmount_utopopulate_on_amount_and_Quantity_NullProduct() {
        Cart_Item__c testCartItem = new Cart_Item__c();
        List<Cart_Item__c> testCartList = new List<Cart_Item__c>{ testCartItem };

        // Call the method to be tested
        Test.startTest();
        CartitemAmountCalculation.Amount_utopopulate_on_amount_and_Quantity(testCartList);
        Test.stopTest();

        // Verify the results
        System.assertEquals(null, testCartList[0].Amount__c);
    }

    @isTest
    static void testAmount_utopopulate_on_amount_and_Quantity_NoProducts() {
        Cart_Item__c testCartItem = new Cart_Item__c(
            Product__c = null
        );
        List<Cart_Item__c> testCartList = new List<Cart_Item__c>{ testCartItem };

        // Call the method to be tested
        Test.startTest();
        CartitemAmountCalculation.Amount_utopopulate_on_amount_and_Quantity(testCartList);
        Test.stopTest();

        // Verify the results
        System.assertEquals(null, testCartList[0].Amount__c);
    }
}