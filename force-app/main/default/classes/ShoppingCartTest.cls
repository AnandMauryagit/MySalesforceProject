public class ShoppingCartTest {
    private Map<String, Decimal> itemPrices;
    public ShoppingCartTest() {
        itemPrices = new Map<String, Decimal>();
    }
    public void addItem(String itemName, Decimal price) {
        itemPrices.put(itemName, price);
    }
    public Decimal getTotalPrice() {
        Decimal totalPrice = 0;
        for (Decimal price : itemPrices.values()) {
            totalPrice += price;
        }
        system.debug(totalPrice);
        return totalPrice;
        
    }
    public List<String> getItemNames() {
        return new List<String>(itemPrices.keySet());
    }
    /*ShoppingCartTest enter = new ShoppingCartTest();
enter.addItem('Bidscuit',50);
enter.addItem('chocolate',70);
enter.addItem('Biscuit',30);
decimal calls = enter.getTotalPrice();
system.debug(calls);
list<string>asd=enter.getItemNames();
system.debug(asd);
*/
}