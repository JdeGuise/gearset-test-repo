public with sharing class NewCaseListController {
    public NewCaseListController() {

    }

    public List<Case> getNewCases() {
        return [SELECT Id, Status, CaseNumber FROM Case WHERE Status = 'New'];
    }
}