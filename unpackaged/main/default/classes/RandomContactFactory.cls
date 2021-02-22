public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer contactsToGenerate, String sharedLastName) {
        List<Contact> newContactList = new List<Contact>();
        for (Integer i = 0; i < contactsToGenerate; i++) {
            Contact contactToAdd = new Contact(
				FirstName = 'Test ' + i,
                LastName = sharedLastName
            );
            newContactList.add(contactToAdd);
        }
        
        return newContactList;
    }
}