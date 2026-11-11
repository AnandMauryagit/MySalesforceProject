public class WorkListSetMap {
    public static void listcls(){
        list <string> rollNo = new list<string>();
         set<string> kram =new set<string>();
        rollNo.add('74683739288');
        rollNo.add('7468373892');
        rollNo.add('746837398');
        rollNo.add('746837837');
        rollNo.add('746837833');
        rollNo.add('746837833');
        rollNo.add('7468378oo');
        rollNo.add('746837833');
        kram.add('5464657');
        kram.add('5555');
        kram.add('5555');                  
        kram.add('646474766');
        kram.add('646474766');   
        system.debug('rollno is=='+rollNo);
        system.debug('index value=='+rollNo.get(3));
        system.debug('list size is--'+rollNo.size());
        system.debug('list size is--'+rollNo.isempty());
        system.debug('kram   ==='+kram);
    
       system.debug('index value=='+kram.size());
      }  
}