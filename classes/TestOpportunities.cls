@isTest
public class TestOpportunities {
    
        @testSetup static void Commonsetup() {
            Date closeDt = Date.Today();              
            Id pricebookId = Test.getStandardPricebookId();
                
			//Create new account
			Account TestAcC = new Account(Name ='icrm testing acc');
			insert TestAcC;
			//Create new opportunity
			Opportunity opp = new opportunity(Name='testing OPP' ,  AccountId= TestACC.Id,StageName = 'Prospecting', CloseDate = closeDt);
			insert opp;      
                  //Create new product
			Product2 prod = new Product2(
 		    Name = 'Super product',
  		    ProductCode = 'S-X',
  		    isActive = true
			);
			insert prod;

			//Create  pricebook entry
			PricebookEntry pbEntry = new PricebookEntry(
  		    Pricebook2Id = pricebookId,
   		    Product2Id = prod.Id,
   		    UnitPrice = 100.00,
   		    IsActive = true
			);
			insert pbEntry;
                               
           	//create opportunity line item
	     	OpportunityLineItem oli = new OpportunityLineItem(
  	        OpportunityId = opp.Id,
            PricebookEntryId = pbEntry.Id,
            Quantity = 5,
            TotalPrice = 5 * pbEntry.UnitPrice
            );
		    insert oli;
			            
    }
    
            @isTest static void newOpportunityLine() {                     
                         
             Account TestAcC = [Select Product__c,Quantity__c, Prices__c From Account Where Name = 'icrm testing acc' ];
             System.debug('Orders = ' + Integer.valueOf(TestAcC.get('Product__c')));
             System.debug('Total Quantity = ' + Integer.valueOf(TestAcC.get('Quantity__c')));
             System.debug('Total Prices = ' + Integer.valueOf(TestAcC.get('Prices__c')));

             System.assertEquals(1,Integer.valueOf(TestAcC.get('Product__c')));
             System.assertEquals(5,Integer.valueOf(TestAcC.get('Quantity__c')));
      	     System.assertEquals(500,Integer.valueOf(TestAcC.get('Prices__c')));                    
            
        }
    
        @isTest static void justNewOpportunity() {
                Date closeDt = Date.Today();              
            	//Create new account
				Account TestAcc2 = new Account(Name ='Acc2');
				insert TestAcc2;
				//Create new opportunity
				Opportunity opp = new opportunity(Name='testing OPP' ,  AccountId= TestAcc2.Id,StageName = 'Prospecting', CloseDate = closeDt);
				insert opp;  
          
              	Account TestAcC = [Select Product__c,Quantity__c, Prices__c From Account Where Name = 'Acc2' ];
                System.debug('Orders = ' + Integer.valueOf(TestAcC.get('Product__c')));
                System.debug('Total Quantity = ' + Integer.valueOf(TestAcC.get('Quantity__c')));
                System.debug('Total Prices = ' + Integer.valueOf(TestAcC.get('Prices__c')));

                System.assertEquals(1,Integer.valueOf(TestAcC.get('Product__c')));
                      
            
        }
    
 }