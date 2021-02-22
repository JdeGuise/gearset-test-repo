trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {

    List<BatchLeadConvertErrors__c> errorEventsToInsert = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent baee : Trigger.New) {
        errorEventsToInsert.add(new BatchLeadConvertErrors__c(
            AsyncApexJobId__c = baee.AsyncApexJobId,
            Records__c = baee.JobScope,
            StackTrace__c = baee.StackTrace
        ));
    }

    if(errorEventsToInsert.size() > 0) {
        insert errorEventsToInsert;
    }
}