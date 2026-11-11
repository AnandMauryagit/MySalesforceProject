trigger CheckPostalCode on Account (after update ) {
CheckPostalCodeHandl.postalCodCompa(trigger.new ,trigger.oldmap);
   /* if(trigger.isBefore){
        for(Account ac: trigger.new){
            system.debug('line 5'+ac.postal_Code__C+'old value'+trigger.oldMAp.get(ac.Id).postal_Code__C);
        }
    }*/
}