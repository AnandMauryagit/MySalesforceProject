public class SortApexNumber {
public static void sortNumbersAsc() {
    List<Integer> sortedNums = new List<Integer>{2,5,3,8,7,6};
    Integer n = sortedNums.size();
    for (Integer i = 0; i < n - 1; i++) {
        for (Integer j = 0; j < n - i - 1; j++) {
            if (sortedNums[j] > sortedNums[j + 1]) {
                Integer temp = sortedNums[j];
                sortedNums[j] = sortedNums[j + 1];
                sortedNums[j + 1] = temp;
            }
        }
    }

 system.debug('list --'+sortedNums);
}

}