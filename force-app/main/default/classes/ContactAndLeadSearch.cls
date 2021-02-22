public class ContactAndLeadSearch {
	
    public static List<List<SObject>> searchContactsAndLeads(String name) {
        insert new Contact(LastName='Smith');
        insert new Lead(LastName='Smith', Company='Test');
        
        
        return [
            FIND :name IN ALL FIELDS 
            RETURNING Lead(name), Contact(FirstName, LastName)
        ];
	}
}