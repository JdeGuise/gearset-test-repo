@isTest
public class AccountManagerTest {

    @isTest
    public static void AccountManager_getAccount() {
    
    
    
    
    
        System.debug('test3');
        RestRequest request = new RestRequest();
        insert new Account(
            Name='TestAcc'
        );
        Account retrievedAccount = [SELECT Id, Name FROM Account];
        insert new Contact(
            AccountId = retrievedAccount.Id,
            FirstName='Test',
            LastName='Testing'
        );
        System.debug(retrievedAccount);
        request.requestUri =
            'https://test.salesforce.com/services/apexrest/Accounts/'
            + retrievedAccount.Id;
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Test.startTest();
            Account actualAccount = AccountManager.getAccount();
        Test.stopTest();
        
        System.assertEquals(
            retrievedAccount,
            actualAccount,
            'When retrieving an account from a rest context, the returned account should be in the database'
        );
    }
}
