@isTest
public class WarehouseSyncScheduleTest {

    @isTest
    public static void WarehouseSyncSchedule_execute() {
        String cronString = '0 0 23 * * ?';
        //WarehouseSyncSchedule classToSchedule = new WarehouseSyncSchedule();
        Test.startTest();
            //System.schedule('TestRun', cronString, classToSchedule);
        Test.stopTest();
    }
}