public class QueuableIterfaceDemo11 implements queueable{
    Public void execute (QueueableContext qx){
        system.debug('i am in QueuableIterfaceDemo11 Class');
        list <Contact> con2 =new list <Contact>();
        for(integer i=0;i<=5;i++){
            Contact Con = new Contact();
            Con.lastName ='QueuableIterfaceDemo11 Contact'+i;
            con2.Add(Con);
        }
        Insert Con2;
        system.debug('Contact inserted == '+Con2);
        Id JobId =system.enqueueJob(new QueuableIterfaceDemo22());
        system.debug('JobId of QueuableIterfaceDemo22=== '+JobId);
    }
}