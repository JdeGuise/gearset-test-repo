@isTest
public class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 13 * ?';
    @testSetup
    public static void setup() {
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            leads.add(
            	new Lead(
            		LastName = 'Test' + i,
                    Company = 'TestCompany'
            	)
            );
        }
        insert leads;
    }
    
    @isTest
    public static void testExecute() {        
        Test.startTest();
        	String jobId = System.schedule(
                'ScheduledApexTest',
                CRON_EXP,
                new DailyLeadProcessor()
            );
        Test.stopTest();
        
        System.assert(false, 'Test not implemented.');
    }
}