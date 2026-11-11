public class listset {
    public static void testingMap(){
        List<Account> ls = [select Name from Account];
Map<Id, Account> m = new Map<Id, Account>{'as' => new Account(Name='anand')};
        Map<String, String> MyStrings = new Map<String, String>{'a' => 'b', 'c' => 'd'};
        system.debug(m.keyset());
                system.debug(m.values());

    }
}