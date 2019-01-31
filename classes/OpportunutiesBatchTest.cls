@isTest 
public class OpportunutiesBatchTest {
   static testMethod void testMethod1() 
    {
     
        List<Account> AccountList = new List<Account>();
        List<Opportunity> OpportunitiesList = new List <Opportunity>();
        List<Product2> ProductList = new List <Product2>();
        List<OpportunityLineItem> OliList = new List<OpportunityLineItem>();
        List <PricebookEntry> PbList = new List<PricebookEntry>();
        Date closeDt = Date.Today();              

           for(Integer i=0 ;i <50;i++)
        {
            Id pricebookId = Test.getStandardPricebookId();
            Account acc = new Account();
            acc.Name ='Test';
            AccountList.add(acc);
            
            //Create new opportunity
			Opportunity opp = new opportunity(Name='TestName'+i ,  AccountID= acc.Id,StageName = 'Prospecting', CloseDate = closeDt);
			OpportunitiesList.add(opp);
                       
			//Create new product
			Product2 prod = new Product2(
  		    Name = 'Super product ' + i,
  		    ProductCode = 'S-X',
  		    isActive = true
			);
			ProductList.add(prod);

			//Create  pricebook entry
			PricebookEntry pbEntry = new PricebookEntry(
  		    Pricebook2Id = pricebookId,
   		    Product2Id = prod.Id,
   		    UnitPrice = 100.00,
   		    IsActive = true
			);
			
			PbList.add(pbEntry);
                               
           	//create opportunity line item
	     	OpportunityLineItem oli = new OpportunityLineItem(
  	        OpportunityId = opp.Id,
            PricebookEntryId = pbEntry.Id,
            Quantity = 5 + i,
            TotalPrice = (5 + i) * pbEntry.UnitPrice
             );
		    OliList.add(oli);
           System.debug('Account+Opportunity Added #'+i);
        }
        
        insert AccountList;
    //    insert OpportunitiesList;
   //     insert ProductList;
  //      insert PbList;
  //      insert OliList;
        
        Test.startTest();

            OpportunitiesBach oppBatch = new OpportunitiesBach();
            DataBase.executeBatch(oppBatch); 
            
        Test.stopTest();
        
    }
}