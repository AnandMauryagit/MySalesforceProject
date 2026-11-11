public class UserBasisPermissionSet {
    @AuraEnabled(Cacheable=true)
    public static list<PermissionSetAssignment> getPermissionSetId (){ 
        list<Id>idOfPermissionSet = new list<Id>();
        list<PermissionSetAssignment>permissionSets = [Select PermissionSetId From PermissionSetAssignment];
        return permissionSets; 
    }
}