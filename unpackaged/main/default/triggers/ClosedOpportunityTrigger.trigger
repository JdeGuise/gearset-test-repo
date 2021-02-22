trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
	
    List<Task> taskList = new List<Task>();
    for(Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Closed Won') {
            Task oppTask = new Task(
            	Subject = 'Follow Up Test Task'
            );
            oppTask.WhatId = opp.Id;
            taskList.add(oppTask);
        }
    }
    if (taskList.size() > 0) {
    	insert taskList;    
    }
}