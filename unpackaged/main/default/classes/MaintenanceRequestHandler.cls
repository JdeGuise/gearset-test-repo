public class MaintenanceRequestHandler {
	public Boolean bypassMaintenanceRequestTriggerHandler = false;
    public void onAfterUpdate(List<Case> newCases){
        List<Case> casesToInsert = new List<Case>();
        for(Case updatedCase : newCases) {
            if((updatedCase.Type == 'Repair' || updatedCase.Type == 'Routine Maintenance') && updatedCase.Status == 'Closed') {
                System.debug('inserting new case:');
                //casesToInsert.add(new Case(
                //    Vehicle__c=updatedCase.Vehicle__c,
                //    Equipment__c=updatedCase.Equipment__c,
                //    Type='Routine Maintenance',
                //    Subject='Notnull',
                //    Date_Reported__c=updatedCase.Date_Reported__c
                //));
            }            
        }
//        insert casesToInsert;
    }
}