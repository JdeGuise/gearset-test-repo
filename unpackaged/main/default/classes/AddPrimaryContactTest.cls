@isTest
public class AddPrimaryContactTest {
	@testSetup
    public static void setup() {
        List<Account> NYAccounts = new List<Account>();
        List<Account> CAAccounts = new List<Account>();
        for(Integer i = 0; i < 50; i++) {
            NYAccounts.add(
            	new Account(
                	BillingState='NY',
                    Name='Test' + i
                )
            );
        }
        insert NYAccounts;
        
		for(Integer i = 0; i < 50; i++) {
            CAAccounts.add(
            	new Account(
                	BillingState='CA',
                    Name='Test' + i
                )
            );
        }
        insert CAAccounts;        
    }
    
    
    @isTest
    public static void testExecute() {
		Contact testContact = new Contact(LastName='Testingson');
        String testStateAbbreviation = 'CA';
        
        AddPrimaryContact apc = new AddPrimaryContact(
            testContact,
            testStateAbbreviation
        );
        
        Test.startTest();
    		System.enqueueJob(apc);
        Test.stopTest();
        
		List<Account> accounts = [
            SELECT
            	Id, OwnerId
            FROM
            	Account
            WHERE
            	BillingState = :testStateAbbreviation
            LIMIT 200
        ];

		List<Id> ownerIds = new List<Id>();
        for(Account account : accounts) {
            ownerIds.add(account.OwnerId);
        }        
        
        
        List<Contact> actualContacts = [
            SELECT
            	Id
            FROM
            	Contact
            WHERE
            	Id IN :ownerIds
        ];
        
        System.debug(actualContacts);
        System.assert(false, 'Test not implemented.');
    }
}