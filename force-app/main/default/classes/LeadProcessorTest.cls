@isTest
public class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        
        for (Integer i = 0; i < 200; i++) {
            leads.add(
            	new Lead(
                    FirstName='Test',
                    LastName='Smith' + i,
                    Company='Test'
                )
            );
        }
        insert leads;
    }
    @isTest
    public static void testExecute() {
        Test.startTest();
        	LeadProcessor lp = new LeadProcessor();
        	Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(
        	200,
            [SELECT Count() FROM Lead]
        );
    }
}