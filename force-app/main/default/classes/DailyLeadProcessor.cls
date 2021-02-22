global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, Company, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 1];
        for(Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}