public class NonStaticTrain {
public string trainName;
    public string driverName;
    public integer trainNo;
    public string timeSlot;
    public string day;
    string allresult(){
        return trainName+driverName+timeSlot+day;
    }
    integer allresults(){
        return trainNo;
    }
    
    
}