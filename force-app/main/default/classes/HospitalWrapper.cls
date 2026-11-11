public class HospitalWrapper {
public string hospitalAddress ;
  public string hospitalName ;
    public string hospitalBranch ;
    
    list<Doctor>docList =new list<Doctor>();
    public void addListDoc (string name,integer age,double salary){
        Doctor doc =new Doctor();
       doc.name=name;
      doc.age=age;
        doc.salary=salary;
        docList.add(doc);
        system.debug(docList);
    }
    
    public class Doctor{
       public string name ;
        public integer age ;
        public double  salary;
        
    }

  
}