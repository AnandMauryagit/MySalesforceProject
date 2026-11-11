public class WrapperClasPractice {
    public static integer NoOfVacantClass(integer totalclass, integer totalTeacher){
        integer emptyClass =totalclass-totalTeacher;
        return emptyClass;
    }
    public static integer emptyClass;
    public static integer extraTeacher=5;
    public static integer classProcess (){
        integer result =extraTeacher-emptyClass;
        system.debug(result);
        return result ;
    }
}