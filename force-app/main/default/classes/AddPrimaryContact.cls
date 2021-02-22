public class AddPrimaryContact implements Queueable {
    Contact contact;
    String stateAbbreviation;
    
    public AddPrimaryContact(Contact contact, String stateAbbreviation) {
        this.contact = contact;
        this.stateAbbreviation = stateAbbreviation;
    }
    
    public void execute(QueueableContext qc) {
		List<Account> accounts = [
            SELECT
            	Id, OwnerId
            FROM
            	Account
            WHERE
            	BillingState = :stateAbbreviation
            LIMIT 200
        ];
        List<Id> contactsToInsert = new List<Id>();
        for (Account account : accounts) {
			contactsToInsert.add(account.OwnerId);            
        }
        
        insert contact;
    }
}