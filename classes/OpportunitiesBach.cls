global class OpportunitiesBach implements    Database.Batchable<Sobject> 
{
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator([Select ID From Account WHERE Name = 'Test']);
    }

    global void execute(Database.BatchableContext bc, List<Account> scope)
    {
               for (Account Accounts : scope) 
            {
                AccountOpportunitiesProductsCooperation AccoountsIDList = new AccountOpportunitiesProductsCooperation();
				AccoountsIDList.recalculateProductsNumber(scope);
            }
        update scope;
    }    

    global void finish(Database.BatchableContext bc){   }    
}