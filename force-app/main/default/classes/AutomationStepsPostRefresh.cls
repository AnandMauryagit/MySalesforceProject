public with sharing class AutomationStepsPostRefresh {
    public static void removeInvalidSuffixFromEmail(){
        List<User> usersToUpdate = new List<User>();
        List<UserLogin> userlogintoUpdate = new List<UserLogin>();
        List<Id> usersWithId = new List<Id>();
        for (User user : [SELECT Id, Email FROM User WHERE Email LIKE '%.invalid' AND IsActive = true  AND ProfileId IN (SELECT Id FROM Profile WHERE Name = 'System Administrator')]) {
            usersWithId.add(user.Id);
            user.Email = user.Email.replace('.invalid', '');
            usersToUpdate.add(user);
        }
        
        for(UserLogin myUserLogin : [SELECT Id, IsFrozen from UserLogin WHERE UserId IN :usersWithId AND IsFrozen = true]) {
            myUserLogin.IsFrozen = false;
            userlogintoUpdate.add(myUserLogin);
        }
        
        if (!userloginToUpdate.isEmpty()) {
            update userlogintoUpdate;
            System.debug('Updated Userlogin Count: ' + userlogintoUpdate.size());
        } else {
            System.debug('No Userlogin Found with .invalid Suffix');
        } 
        
        if (!usersToUpdate.isEmpty()) {
            update usersToUpdate;
            System.debug('Updated Users Count: ' + usersToUpdate.size());
        } else {
            System.debug('No Users Found with .invalid Suffix');
        }
    }
}