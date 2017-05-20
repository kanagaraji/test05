trigger rollupdel on Members__c(before delete ) {

        List<Team__c> tList = new List<Team__c>();
        
        for(Members__c mem : Trigger.old){
          
            for(Team__c team:[select id,name,TotalTeamMembers__c from Team__c where id = : mem.TeamName__c]){
            
                
        if(team.TotalTeamMembers__c == null)
        
        team.TotalTeamMembers__c =0;
        
        
        team.TotalTeamMembers__c= team.TotalTeamMembers__c -1;
       
        tList.add(team);
            }
            
        }
        update tList;
        }