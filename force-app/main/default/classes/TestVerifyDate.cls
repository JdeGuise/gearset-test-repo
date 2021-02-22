@isTest
public class TestVerifyDate {

    @isTest
    public static void VerifyDate_CheckDates_DateWithin30Days() {
        Date testDate1 = Date.newInstance(2000, 1, 1);
        Date expectedDate = Date.newInstance(2000, 1, 28);

		Test.startTest();
        Date actualDate = VerifyDate.CheckDates(testDate1, expectedDate);
        Test.stopTest();
        
        System.assertEquals(
        	expectedDate,
            actualDate,
            'When the second date falls within 30 days of the first, the second date should be used'
        );
    }
   
    @isTest
    public static void VerifyDate_CheckDates_DateNotWithin30Days() {
        Date testDate1 = Date.newInstance(2000, 1, 1);
        Date testDate2 = Date.newInstance(1999, 12, 28);
        Date expectedDate = Date.newInstance(2000, 1, 31);
        
        Test.startTest();
        Date actualDate = VerifyDate.CheckDates(testDate1, expectedDate);
        Test.stopTest();
        
        System.assertEquals(
        	expectedDate,
            actualDate,
            'When the second date doesn\'t fall within 30 days of the first, the last day in the month of the second date should be used'
        );        
    }      
}