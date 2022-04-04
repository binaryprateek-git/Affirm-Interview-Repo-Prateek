trigger contactTrigger on Contact (before insert, before update) {
    Set<Id> setOfAccountId = new Set<Id>();
    for(Contact c: Trigger.new){
        if(c.Account_Industry__c!=null){
            setOfAccountId.add(c.AccountId);
        }

    }
    List<Account> lstofAccount=[Select id,Name, Industry from Account where id IN:setOfAccountId];
    Map<Id,String> mapOfAccidtoIndustry = new Map<Id,String>();
    if(lstofAccount.size()>0){
        for(Account a:lstofAccount){
            mapOfAccidtoIndustry.put(a.id, a.Industry);
        }
    }
    if(mapOfAccidtoIndustry.size()>0){
        for(Contact c: Trigger.new){
            if(c.Account_Industry__c!=mapOfAccidtoIndustry.get(c.AccountId)){
                c.Account_Industry__c=mapOfAccidtoIndustry.get(c.AccountId);
            }
        }

    }


}