trigger Demo on Account (before insert) {
    for(account a :Trigger.new){
      a.Name =a.Name +'AB';
    }
}