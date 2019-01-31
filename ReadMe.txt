Solution contains sourcecode of 6 classes: 

1.AccountOpportunitiesProductsCooperation  - Main logic class, performs queries to generate Aggregates for Account custom fields 
2. OpportunitiesTest - Tests  for this class (2 tests( 1 -  for creation and insert of new OpportunityLineItem, 2nd - for insertion just Opportunity)
Assertion of Account custom Fields.   

3.Opportunity Trigger  (after insert, update, delete) Activates logic 
4.OpportunityLineItem Trigger (after insert, update, delete) Activates logic 

5.Batch class - inserts numerous new objects Accounts, Opportunities   
6.Batch test class 
