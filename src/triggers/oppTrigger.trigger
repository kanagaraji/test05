trigger oppTrigger on Opportunity(before Insert, before Update) 
{    
    
    if(Trigger.isinsert && Trigger.isBefore)
    {
    
        for(Opportunity opp: Trigger.New)
        {
            if(opp.StageName!=null && opp.Country__c==null){
                
                opp.Country__c = 'africa';
              
            }  
                 
        }            
    }
    
    if(Trigger.isUpdate && Trigger.isbefore)
    {
        
         for(Opportunity opp: Trigger.New)
         {
            
             if(String.isBlank(opp.StageName) && !String.isBlank(opp.Country__c))
             {

              
       // opp.Country__c ='';
            
}
}
}
}