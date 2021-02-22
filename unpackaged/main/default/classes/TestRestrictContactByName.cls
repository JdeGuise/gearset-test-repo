@isTest
public class TestRestrictContactByName {

    @isTest
    public static void RestrictContactByName_insert_invalid() {
        Contact testContact = new Contact(
        	FirstName = 'Joe',
            LastName = 'INVALIDNAME'
        );
        String expectedException = 'Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, The Last Name "INVALIDNAME" is not allowed for DML: []';
        String actualException;
        
        Test.startTest();
        try {
        	insert testContact;            
        } catch (DMLException dmle) {
            actualException = dmle.getMessage();
        }
        Test.stopTest();
        
        System.assertEquals(
            expectedException,
            actualException,
            'When inserting a contact with an invalid last name, the exception should match the FIELD_CUSTOM_VALIDATION_EXCEPTION error message.'
        );        
    }

    @isTest
    public static void RestrictContactByName_update_invalid() {
        Contact testContact = new Contact(
        	FirstName = 'Joe',
            LastName = 'Schmoe'
        );
        insert testContact;
        testContact.LastName = 'INVALIDNAME';
        String expectedException = 'Update failed. First exception on row 0 with id ' + testContact.Id + '; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, The Last Name "INVALIDNAME" is not allowed for DML: []';
        String actualException;
        
        Test.startTest();
        try {
        	update testContact;            
        } catch (DMLException dmle) {
            actualException = dmle.getMessage();
        }
        Test.stopTest();
        
        System.assertEquals(
            expectedException,
            actualException,
            'When updating a contact to use an invalid last name, the exception should match the FIELD_CUSTOM_VALIDATION_EXCEPTION error message.'
        );        
    }    
}