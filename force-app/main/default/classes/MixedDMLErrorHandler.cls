public class MixedDMLErrorHandler {
   // @future
    public static void updateUser(){
        List<User> users = [SELECT Id, IsActive FROM User ];
        for(User u : users){
            u.IsActive = false;
        }
        update users;
    }
}