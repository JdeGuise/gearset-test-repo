@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        System.debug('ADDING NEW DEBUG');
        RestRequest request = RestContext.request;
        System.debug('AccountId Input Paramter: ');
        System.debug(request.requestURI.substringBetween('Accounts/', '/contacts'));
        System.debug('Request URI: ');
        System.debug(request.requestURI);
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        System.debug('AccountId: ' + accountId);
        return [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE Id = :accountId LIMIT 1];
    }
}