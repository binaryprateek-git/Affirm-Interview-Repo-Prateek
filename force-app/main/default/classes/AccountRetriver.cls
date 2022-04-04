public with sharing class AccountRetriver {
    public AccountRetriver() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
       return [Select id, Name FROM Account LIMIT 5];
    }

    @AuraEnabled
    public static List<Account> getSelectedAccDetails(id accid){
        return [Select id, Name, Industry, Type FROM Account where id=:accid];
        
    }
}
