trigger controlrole  on Opportunity (before update) {

    List<Opportunity> updOpp = new List<Opportunity>();
    
    for(Opportunity opp : trigger.new){
    
        List<OpportunityContactRole> oppCon = [SELECT id,ContactId,isPrimary from Opportunitycontactrole where opportunityid =: opp.id];
        if(oppcon.size() >0){
        
            for(OpportunityContactRole conRole: oppCon){
                
                if(conRole.isPrimary == true){
                
                    opp.Conmaster__c = conRole.contactId;
                    updOpp.add(opp);
                }
            }
        } 
    }
    //update updOpp;
}