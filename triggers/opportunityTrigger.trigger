trigger opportunityTrigger on Opportunity(after insert,after update,after delete){
      
     if(trigger.isUpdate || trigger.isInsert){
    //pick the related list of accounts 
   List<Account> AccountList = new List<Account>();
	for (Opportunity op : Trigger.new) {
 	 AccountList.add(new Account(ID = op.AccountId));
	}
	AccountOpportunitiesProductsCooperation AccoountsIDList = new AccountOpportunitiesProductsCooperation();
	AccoountsIDList.recalculateProductsNumber(AccountList);  
     }
    
   	if( trigger.isDelete ){
    List<Account> AccountList = new List<Account>();
    for (Opportunity op : Trigger.old) {
 	 AccountList.add(new Account(ID = op.AccountId));
	}
    AccountOpportunitiesProductsCooperation AccoountsIDList = new AccountOpportunitiesProductsCooperation();
	AccoountsIDList.recalculateProductsNumber(AccountList);  
  }
}