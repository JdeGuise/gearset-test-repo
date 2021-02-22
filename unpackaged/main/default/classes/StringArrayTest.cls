public class StringArrayTest {
    public static List<String> generateStringArray(Integer numberOfStrings) {
        List<String> newStrings = new List<String>();
        for (Integer i = 0 ; i < numberOfStrings; i++) {
            String newString = 'Test ' + i;
            newStrings.add(newString);
        }
        return newStrings;
    }
}