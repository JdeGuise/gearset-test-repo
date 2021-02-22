@isTest
global class AnimalLocatorTest {
    @isTest
    public static void getAnimalNameById() {
		Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        final String expectedResult = 'chicken';

		Test.startTest();
        	final String actualResult = AnimalLocator.getAnimalNameById(3);
		Test.stopTest();
        
        System.assertEquals(expectedResult, actualResult);
    }
}