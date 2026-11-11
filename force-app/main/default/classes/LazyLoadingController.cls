/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : LazyLoadingController
 * Author          : <YourName>
 * Created Date    : Apr 23, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Apr 23, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Apr 23, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class LazyLoadingController {

	 @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Integer limitSize, Integer offset){
        List<Contact> contactList = [SELECT Id, Name, Phone
                                     FROM Contact
                                     ORDER BY CreatedDate
                                     LIMIT :limitSize
                                     OFFSET :offset];
        return contactList;
    }
}