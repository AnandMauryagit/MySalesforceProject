public class AvoidDmlErrorAssignPermissionToCreateAcc {
    Public static string storeIdToDelete ;
   // @future 
    public static void assignPermissionSet (){
        string permSetId = [Select Id from PermissionSet Where Label = 'AccountEditAnd CreateAccess' Limit 1].Id;
        string  UserIds = [Select Id from user where Name ='smanager Maurya' Limit 1].Id ;
        PermissionSetAssignment psa = new PermissionSetAssignment
            (PermissionSetId = permSetId, AssigneeId = UserIds);
        insert psa;
        storeIdToDelete = psa.Id;
    }
   // @future
    public Static void deleteAssignSet(){
       delete [SELECT Id from PermissionSetAssignment WHERE id = : storeIdToDelete]; 
    }
}