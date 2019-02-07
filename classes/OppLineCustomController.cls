public class OppLineCustomController {

    public List<Opportunity> opptyList;
    public Account acc;
    
    public OppLineCustomController(ApexPages.StandardController controller) {
        
   Account acc = (account)controller.getRecord();
   opptyList = [SELECT Id,(SELECT Quantity, UnitPrice, TotalPrice,PricebookEntry.Name, Opportunity.Name FROM OpportunityLineItems ) 
                        FROM Opportunity WHERE Account.Id =: acc.ID ORDER BY Name];
    }
   
    public List<Opportunity> getopptyList() {
        return opptyList;
    }
    
}