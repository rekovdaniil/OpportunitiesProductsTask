Solution contains sourcecode of 6 classes: 

1.AccountOpportunitiesProductsCooperation  - Main logic class, performs queries to generate Aggregates for Account custom fields 
2. OpportunitiesTest - Tests  for this class (2 tests( 1 -  for creation and insert of new OpportunityLineItem, 2nd - for insertion just Opportunity)
Assertion of Account custom Fields.   

3.Opportunity Trigger  (after insert, update, delete) Activates logic 
4.OpportunityLineItem Trigger (after insert, update, delete) Activates logic 

5.Batch class - inserts numerous new objects Accounts, Opportunities   
6.Batch test class 

________________________________________________
05.02.18 Updates:
1. Triggers improvement
2. Added Visualforce page to display Account's cunstom fields  
________________________________________________
07.02.18 Updates: 
1. Addded VF Page for Account Layout (OppLineVF.vfp) Preview at Screenshot #7
2. Custom Controller class for this page (OppLineCustomController.cls) extension for Account standard controller 
