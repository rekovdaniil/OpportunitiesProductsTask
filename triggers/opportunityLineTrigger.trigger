trigger opportunityLineTrigger on OpportunityLineItem (after insert,after update,after delete) {  
    
    
    if(trigger.isUpdate || trigger.isInsert){
    List<Account> AccountList = new List<Account>();

	for (OpportunityLineItem opL : Trigger.new) {
 	 AccountList.add(new Account(ID = opL.Opportunity.AccountId));
	}
    
	AccountOpportunitiesProductsCooperation AccoountsIDList = new AccountOpportunitiesProductsCooperation();
	AccoountsIDList.recalculateProductsNumber(AccountList); 
    }

 	if(trigger.isAfter && trigger.isDelete ){
    List<Account> AccountList = [Select ID From Account] ;
	AccountOpportunitiesProductsCooperation AccoountsIDList = new AccountOpportunitiesProductsCooperation();
	AccoountsIDList.recalculateProductsNumber(AccountList); 
    }

    
}