public class TestMapMethod {
    public static void testing(){
    List<Account> accts = new List<Account>();
    accts.add(new Account(Name='Account1'));
    accts.add(new Account(Name='Account2'));
    // Insert accounts so their IDs are populated.
    insert accts;
    Map<Id, Account> m = new Map<Id, Account>();
    // Add all the records to the map.
    m.putAll(accts);
    System.assertEquals(2, m.size());
    }
}