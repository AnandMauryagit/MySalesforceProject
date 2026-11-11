public class CreateSequenceOfJson {
    public static void reorderJSON() {
        String xmlString = '<Poa co="S/O: Thiyagarajn" country="" dist="Thanjavur" house="44/2 28/2" lm="MATHULAMPETTAI" loc="KUMBAKONAM" pc="612001" po="Kumbakonam" state="Tamil Nadu" street="MCSR STREET" subdist="Kumbakonam" vtc="Kumbakonam"/>';
        String cleanedString = xmlString.replaceAll('<Poa', '').replaceAll('</Poa>', '').replaceAll('<', '').replaceAll('>', '');
        Map<String, String> attributeMap = new Map<String, String>();
        Pattern pattern = Pattern.compile('(\\w+)="([^"]+)"');
        Matcher matcher = pattern.matcher(cleanedString);
        while (matcher.find()) {
            String key = matcher.group(1);   // Attribute name (key)
            String value = matcher.group(2); // Attribute value
            attributeMap.put(key, value);
        }
        System.debug(attributeMap);
        List<String> customOrder = new List<String>{'co','house','street','lm','loc','vtc','subdist','po','dist','state','pc','country'};
            // Create a new map to store the reordered key-value pairs
            Map<String, Object> reorderedPoaData = new Map<String, Object>();
        String finalData = 'Poa';
        for (String key : customOrder) {
            if (attributeMap.containsKey(key)) {
                reorderedPoaData.put(key, attributeMap.get(key));
                finalData += ',' + key +'=' +'"'+ attributeMap.get(key)+ '"';
            }
        }
        String OutComeData= finalData.replaceAll('Poa,', 'Poa ');
        System.debug('OutComeData'+OutComeData); 
    }    
}