public class AccountHandler {
    public static Account insertNewAccount(String accountName) {
        try {
            Account account = new Account(Name = accountName);
            insert account;
            return account;
        } catch (DMLException dml) {
            return null;
        }
    }
}