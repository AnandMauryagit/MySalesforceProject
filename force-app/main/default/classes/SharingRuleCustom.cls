public class SharingRuleCustom {
    public static void ruleAssignInsert(list <Project__c>newProjects){
        map<String,Project__c>ketToFindRole=new map<String,Project__c>();
        for(Project__c checkDeparStatus :newProjects){            
            ketToFindRole.put(checkDeparStatus.Department__c+' '+checkDeparStatus.Stage__c,checkDeparStatus);           
        }
        list<UserRole>userLst=[Select Id, Name,(Select id from users) from UserRole where Name IN:ketToFindRole.keySet()];
        list<Project__Share> projList =new list<Project__Share>();       
        for(UserRole  assignRole:userLst){
            for(user roleToUser :assignRole.users){
                Project__Share ruleAcces = New Project__Share();
                ruleAcces.ParentId = ketToFindRole.get(assignRole.Name).Id;
                ruleAcces.UserOrGroupId = roleToUser.Id;
                ruleAcces.AccessLevel = 'Read';
                projList.add(ruleAcces);
            }
        }
        insert projList;
    }
    public static void ruleAssignUpdate(List<Project__c>newProject,Map<Id,Project__c>oldProject){
        map<String,Project__c>ketToFindRoleUpdate=new map<String,Project__c>();
        for(Project__c compareRec :newProject){
            if((!String.isEmpty(compareRec.Department__c) && !String.isEmpty(compareRec.Stage__c))&& ((compareRec.Department__c!= oldProject.get(compareRec.Id).Department__c) || (compareRec.Stage__c!=oldProject.get(compareRec.Id).Stage__c ))){
                ketToFindRoleUpdate.put(compareRec.Department__c+' '+compareRec.Stage__c,compareRec);               
            }
        }
        list<UserRole>userLst=[Select Id, Name,(Select id from users) from UserRole where Name IN:ketToFindRoleUpdate.keySet()];
        list<Project__Share> projList =new list<Project__Share>();       
        for(UserRole  assignRole:userLst){
            for(user roleToUser :assignRole.users){
                Project__Share ruleAcces = New Project__Share();
                ruleAcces.ParentId = ketToFindRoleUpdate.get(assignRole.Name).Id;
                ruleAcces.UserOrGroupId = roleToUser.Id;
                ruleAcces.AccessLevel = 'Read';
                projList.add(ruleAcces);
            }
        }
        insert projList;
    }
}