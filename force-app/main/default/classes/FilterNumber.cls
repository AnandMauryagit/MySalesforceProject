public class FilterNumber {
    public static String filterSpecialCharacter(String phone) {
        if (phone == null) {
            return '';
        }
        String cleanedPhone = phone.replaceAll('[^0-9]', ' ');
        system.debug('cleanedPhone-------'+cleanedPhone);
        if (cleanedPhone.length() > 10) {
            cleanedPhone = cleanedPhone.substring(cleanedPhone.length() - 10);
        }
        system.debug('cleanedPhone-------'+cleanedPhone);
        return cleanedPhone;
        
    }
    
    
}