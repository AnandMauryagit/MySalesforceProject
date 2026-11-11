public class CompoundInterestCalculate {
    static double amount=0;
    public static double procesToCalcilate(double principal,double rate,double times,double noOfRetu){
           double calcu =principal*(1+rate/100*noOfRetu);
        double timesa=noOfRetu*times;
            amount=Math.pow(calcu,timesa);
        return amount;
    }
    
}