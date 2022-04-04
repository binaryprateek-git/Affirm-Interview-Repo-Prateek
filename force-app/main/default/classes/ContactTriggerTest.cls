@IsTest
private with sharing class ContactTriggerTest {
    @IsTest
    static void testContactTriggerViaDML()
    {
            Account testAccount = new Account( Name = 'Test Account', Industry='testIndustry' );
            insert testAccount;
            Contact testContact = new Contact( LastName = 'Test Contact', AccountId= testAccount.Id);
            insert testContact;
            testContact = [select Id, Name, Account_Industry__c from Contact where Id = :testContact.Id];
            System.assertEquals(testContact.Account_Industry__c, 'testIndustry');  
    }
    
}