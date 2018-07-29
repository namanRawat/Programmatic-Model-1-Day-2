/**************************************************************************************************
 * Class : ProgrammaticModel
 * Created By : Naman Rawat
 --------------------------------------------------------------------------------------------------
 * Description : Class contains all questions of Programmatic Model 1 Day 2 Assignment
 --------------------------------------------------------------------------------------------------
 * Version History:
 * Version    Developer Name    	Date         	 Detail Features
   1.0        Naman Rawat	   		22/07/2018	     Initial Development
   
 **************************************************************************************************/


public class ProgrammaticModel {
	
 /* Method to will query account records using traditional for loop 
 *
 * @param: NA 
 *
 * @return: List of Account
 *
 */


	public static void traditionalLoop() {
		List<Account> listAccount = [SELECT ID,Name FROM Account WHERE Industry = 'Media'];
			for(Integer i=0; i<listAccount.size(); i++) {
				System.debug(listAccount[i].Name+ ' ' + listAccount[i].ID);
			}
	   }

/* Method to will query account records using advance for loop 
 *
 * @param: NA 
 *
 * @return: List of Account
 *
 */

	public static void advanceLoop() {
		List<Account> listAccount = [SELECT ID, Name FROM Account WHERE Industry ='Media'];
		for(Account account : listAccount ) {
			System.debug(account.Name + ' ' + account.ID);
		}

	}

/* Method to will query account records using while for loop 
 *
 * @param: NA 
 *
 * @return: List of Account
 *
 */


	public static void whileLoop() {
		List<Account> listAccount = [SELECT ID, Name FROM Account WHERE Industry = 'Media']];
			Integer i=0;
				while(i<listAccount.size()) {
					System.debug(listAccount[i].Name+ ' ' + listAccount[i].ID);
					i++;
				}
	}


/* Method to add ID to lead record  
 *
 * @param: NA 
 *
 * @return: Set of Lead ID
 *
 */

	public static Set<String> leadRecord() {
		List<Lead> listLead = [SELECT ID, Name FROM Lead WHERE RecordType = 'Web'];
		Set<String> leadSet = new Set<String>();


		for(Lead lead : listLead) {
			leadSet.add(lead.ID);
		}
		return leadSet;
	}

/* Method to createAccount record and associated contact record
 *
 * @param: NA 
 *
 * @return: NA
 *
 */

	public static void accountRecord() {
		Account account = new Account();
		account.Name='Eternus';
		insert account;

		Contact contact = new Contact();
		contact.LastName = 'Eternus Contact';
		contact.AccountId = account.Id;

		insert contact;

	}

/* Method to insert number of account in Account Object
 *
 * @param: Integer numberOfAccounts
 *
 * @return: List<Account>
 *
 */

	public static void insertAccount(Integer numberOfAccount) {
		List<Account> listAccount = new List<Account>();
		for(Integer i=0 ; i < numberOfAccount ; i++ )
		{
			Account record = new Account(Name = 'ESPL' + i);
			listAccount .add(record);
		}
			insert listAccount;
	}

/* Method to update account record
 *
 * @param: NA 
 *
 * @return: NA
 *
 */

	public static void updateAccount() {
		List<Account> listAccount = [SELECT Id, Name FROM Account WHERE Industry = 'Media'];
		
		for(Account account : listAccount){
			account.Name = 'Eternus';
		}
		update listAccount;
	}

/* Method to delete Contact record
 *
 * @param: NA 
 *
 * @return: NA
 *
 */

	public static void deleteRecord() {
		List<Contact> contact = [SELECT Id FROM Contact WHERE LastName = '' ];
		Database.delete(contact , false);
	}

/* Method to show use of Map
 *
 * @param: NA 
 *
 * @return: NA
 *
 */

	public static void useOfMap() {
		Map<Integer,String> mapUse = new Map<Integer,String>();
		
		mapUse.put(1,'David');
		mapUse.put(2,'Miller');
		mapUse.put(3,'John');
		
		System.debug(mapUse.get(1));

		System.debug(mapUse.containsKey(2));

		mapUse.remove(3);
		System.debug(mapUse.containsKey(3));

		Set<Integer> useKeySet = mapUse.keyset();
		for(Integer useKey : useKeySet ){
			System.debug(useKey);
		}

		List<String> listKey = mapUse.values();
		for(String useString : listKey) {
			System.debug(useString);
		}
	}

/* Method to query on contact record and get account Id and object
 *
 * @param: NA 
 *
 * @return: Map<String,Account>
 *
 */

	public static Map<String,Account> fetchContactMap() {
		List<Contact> contact = [SELECT Id, AccountId FROM Contact WHERE LastName = ''];
		
		Map<String,Account> contactMap = new Map<String,Account>();

		for(Contact contactRecord : contact)
		{
			Account account = new Account(Id= contactRecord.AccountId);
			contactMap.put (contactRecord.Id, account);
		}
		return contactMap;
	}
}
