trigger rollup on Members__c(after insert,after update) {

        List<Team__c> tList = new List<Team__c>();
        
       if(trigger.isinsert){ 
       for(Members__c mem : Trigger.New){
          
            for(Team__c team:[select id,name,TotalTeamMembers__c from Team__c where id = : mem.TeamName__c]){
            
                
        if(team.TotalTeamMembers__c == null)
        
        team.TotalTeamMembers__c =0;
        
        
        team.TotalTeamMembers__c= team.TotalTeamMembers__c +1;
        tList.add(team);
            }
            
        }
        update tList;
        }
        if(trigger.isupdate){
        
            List<Team__c> updTeam = new List<Team__c>();
            Set<Id> tmId = new Set<Id>();
            for(Members__c mem : Trigger.New){
                
                for(Members__c oldMem : trigger.old){
                    if(mem.TeamName__c != oldMem.TeamName__c){
                        Team__c tm = [select id,name,TotalTeamMembers__c from Team__c where id =: mem.TeamName__c];
                       
                        tm.TotalTeamMembers__c = tm.TotalTeamMembers__c +1;
                        
                        Team__c oldtm = [select  id,name,TotalTeamMembers__c from Team__c where id = : oldMem.TeamName__c];
                        oldtm.TotalTeamMembers__c= oldtm.TotalTeamMembers__c  -1; 
                        
                        updTeam.add(oldtm);
                        updTeam.add(tm);
                    } 
                    
                    
                }
                
            }update updTeam;
            
        }
        }