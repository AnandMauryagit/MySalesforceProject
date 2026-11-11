public class GeneratePDF {
    public static void getPDF(){
        
        //clearwater--full.sandbox.my.salesforce.com/secur/frontdoor.jsp?sid=00DcX000004CeYr!AQEAQCoJOtazaNzKu0JK2L0VU89OxxMPNV3bGfqfD0b6ldg.oOXf7RBqGtUqde0tBK7m5JWYd.vYieOk9fNXxo4DX62SpOui
        Contact con = [SELECT Id, Profile_Information__c  FROM Contact WHERE Id = '0035i00009Pcoe2AAB'];
        Blob pdfObj = Blob.toPDF (con.Profile_Information__c);
        // Create ContentVersion record
        ContentVersion contentVersion  = new ContentVersion();
        contentVersion.Title = 'Profile .pdf' ;
        contentVersion.PathOnClient = 'Profile .pdf' ;
        contentVersion.VersionData = pdfObj;
        contentVersion.IsMajorVersion = true;
        contentVersion.FirstPublishLocationId =con.id;
        insert contentVersion;
    }
}