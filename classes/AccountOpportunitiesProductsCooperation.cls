public class AccountOpportunitiesProductsCooperation {

    public void recalculateProductsNumber(List<Account> AccountsID)
    {
		//Sum of Ammounts ordered for account
        List<AggregateResult> TotalPriceList= [Select Sum(TotalPrice) total, OpportunityLineItem.Opportunity.Account.ID ident From OpportunityLineItem GROUP BY  OpportunityLineItem.Opportunity.Account.ID];
        //Sum of Products Quantity for account 
        List<AggregateResult> TotalQuantityList= [Select Sum(Quantity) total, OpportunityLineItem.Opportunity.Account.ID ident From OpportunityLineItem GROUP BY  OpportunityLineItem.Opportunity.Account.ID];
		//Number of orders(opportunities) per Account 
        List<AggregateResult> OpportunitiesNumbersList= [Select Account.ID ident, Count(ID) total From Opportunity GROUP BY  Account.ID];
   
        //Debug Output values
        for(Integer j=0;j<TotalPriceList.size();j++)
   		 System.debug('Price list values='+ TotalPriceList[j]);
        
          for(Integer j=0;j<TotalQuantityList.size();j++)
   		 System.debug('Q list values='+ TotalQuantityList[j]);
        
          for(Integer j=0;j<OpportunitiesNumbersList.size();j++)
   		 System.debug('ON # '+ j +' list values='+ OpportunitiesNumbersList[j] +' ');
     
       // Update  
       	 this.updateOpportunities(OpportunitiesNumbersList);
   		 this.updateOpportunityLinePriceAndQuantity(TotalPriceList, TotalQuantityList);   
      
    }
    
      public void updateOpportunityLinePriceAndQuantity(List<AggregateResult>ResultPrice, List<AggregateResult>ResultQuantity)
    {
        //parsing of obtained result 
        for(Integer j=0;j<ResultPrice.size();j++){
              try {
        Integer RezPrice = Integer.valueOf(ResultPrice[j].get('total'));
        Integer RezQuantity = Integer.valueOf(ResultQuantity[j].get('total'));

        ID AccountIDToUpdate = (ID) ResultPrice[j].get('ident');
        Account AccountToUpdate = new Account(ID = AccountIDToUpdate);
        AccountToUpdate.Prices__c = RezPrice;
        AccountToUpdate.Quantity__c = RezQuantity;

        update AccountToUpdate;
        System.debug('Record Changed');
		} catch(DmlException e) {
   		 System.debug('An unexpected error has occurred: ' + e.getMessage());
		}
        }
        
    }
    
      public void updateOpportunities( List<AggregateResult> ResultProducts)
    {
        //parsing of obtained result 
        for(Integer j=0;j<ResultProducts.size();j++){
              try {
        Integer RezProduct = Integer.valueOf(ResultProducts[j].get('total'));
        ID AccountIDToUpdate = (ID) ResultProducts[j].get('ident');
        System.debug('++++' + AccountIDToUpdate);
        Account AccountToUpdate = new Account(ID = AccountIDToUpdate);
        AccountToUpdate.Product__c = RezProduct;

        update AccountToUpdate;
        System.debug('Record Changed');
		} catch(DmlException e) {
   		 System.debug('An unexpected error has occurred: ' + e.getMessage());
		}
        }
        
    }
    
    
  }