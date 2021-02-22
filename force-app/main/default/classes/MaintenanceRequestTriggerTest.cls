@isTest
public class MaintenanceRequestTriggerTest {

    @isTest
    public static void MaintenanceRequest_afterUpdate() {
        insert new Case(
            Type='Routine Maintenance'
        );
        List<Case> expectedTestCases = [SELECT Id, Status, Type FROM Case];
        expectedTestCases[0].Status = 'Closed';
        Test.startTest();
            update expectedTestCases; // will result in an insert DML (inserting a new Case) for each updated Case
        Test.stopTest();
        List<Case> actualRetrievedCases = [SELECT Id FROM Case];
        System.debug(actualRetrievedCases.size());
        System.assertEquals(
            expectedTestCases.size(),
            actualRetrievedCases.size(),
            'For each Case updated in the database, an additional Case should be inserted'
        );
    }
}