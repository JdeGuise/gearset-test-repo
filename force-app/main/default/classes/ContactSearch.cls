public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName, String postalCode) {
        return [
            SELECT
            	Id,
            	LastName,
            	Name,
            	MailingPostalCode
            FROM
            	Contact
            WHERE
            	LastName = :lastName
            AND
            	MailingPostalCode = :postalCode
        ];
    }
    
}