public class lwcCSVUploaderController {
    @AuraEnabled
    public static List<Account> saveFile(String base64Data){
        String data    = JSON.deserializeUntyped(base64Data).toString();
        list<Account> lstCCToInsert = new list<Account>();
        list<String> lstCSVLines = data.split('\n');
        for(Integer i = 1; i < lstCSVLines.size(); i++){
            Account acc = new Account();
            String csvLine = lstCSVLines[i];
            String prevLine = csvLine;
            Integer startIndex;
            Integer endIndex;
            List<String> csvRowData = new List<String>();
            for(String column : csvLine.split(',')){
                column = column.replaceAll(':quotes:', '').replaceAll(':comma:', ',');
                csvRowData.add(column);
            }
            acc.Name = csvRowData[0];
            acc.Site = csvRowData[1];
            acc.AccountSource = csvRowData[2];
            lstCCToInsert.add(acc);
        }
        if (lstCCToInsert != null){
            insert lstCCToInsert;
        }
        return lstCCToInsert;
    }
}