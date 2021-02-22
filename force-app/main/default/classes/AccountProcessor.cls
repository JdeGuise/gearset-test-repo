public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){        
        List<Contact> relevantContacts = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds];
        
        Map<Id, Integer> numberOfContactsByAccountId = new Map<Id, Integer>();
        
        for (Contact relevantContact : relevantContacts) {
            if (numberOfContactsByAccountId.get(relevantContact.AccountId) == null) {
                numberOfContactsByAccountId.put(relevantContact.AccountId, 1);
            }
        }        
        List<Account> accounts = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id IN :numberOfContactsByAccountId.keySet()];
        for (Account account : accounts) {
            account.Number_of_Contacts__c = numberOfContactsByAccountId.get(account.Id);
        }
        update accounts;
    }
}