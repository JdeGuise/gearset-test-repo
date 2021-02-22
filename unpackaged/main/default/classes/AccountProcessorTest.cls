@isTest
public class AccountProcessorTest {

    @isTest
    public static void AccountProcessor_countContacts() {
        List<Account> testAccounts = new List<Account>();
        List<Contact> testContacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();
        
        for (Integer i = 0; i < 10; i++) {
            testAccounts.add(new Account(Name = 'Test ' + i));
        }        
        insert testAccounts;

        for (Integer j = 0; j < 10; j++) {
            testContacts.add(
                new Contact(
                    LastName = 'Test ' + j, 
                    AccountId = testAccounts[j].Id
                )
            );
            accountIds.add(testAccounts[j].Id);
        }
        insert testContacts;
        
        Test.startTest();
        	AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        List<Account> accounts = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id IN :testAccounts];
        for (Account account : accounts) {
            System.assertEquals(
                1,
            	account.Number_of_Contacts__c,
                'Number of connected contacts to each account should be 10'
            );
        }
    }    
}