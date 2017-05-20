trigger AccountTrigger on Account (Before Insert, Before Update) {    
    
    if(Trigger.isInsert && Trigger.isBefore){
    
        for(Account acc: Trigger.New){
            
             if(!String.isBlank(acc.Industry) && String.isBlank(acc.Website)){
                
                acc.website = 'www.'+acc.Industry+'.com';
            }  
                 
        }
    }
    
    if(Trigger.isUpdate && Trigger.isBefore){
        
         for(Account acc: Trigger.New){
            
             if(String.isBlank(acc.Industry) && !String.isBlank(acc.Website)){

                acc.website = '';
                "this is added by account name 'github.com/gopinath-geek'
                "this second line is added by account name 'github.com/gopinath-geek' "

}
}
}
}
