public class OverloadingClass {
    
    // Method to add two integers
    public Integer add(Integer a, Integer b) {
        return a + b;
    }
    
    // Method to add three integers
    public Integer add(Integer a, Integer b, Integer c) {
        return a + b + c;
    }
    
    // Method to add two doubles
    public Double add(Double a, Double b) {
        return a + b;
    }
    
    // Method to add a list of integers
    public Integer add(List<Integer> numbers) {
        Integer sum = 0;
        for (Integer numberss : numbers) {
            sum += numberss;
        }
        return sum;
    }
}