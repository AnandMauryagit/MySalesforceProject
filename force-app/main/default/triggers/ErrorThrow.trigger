trigger ErrorThrow on Account (before insert) {
    for(Account phoneNumber:Trigger.New){
    if(phoneNumber.Phone==null){
     phoneNumber.AddError('First Fill Your phone number');
    }       
    }
}