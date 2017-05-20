trigger ContactUpdate on Account (after insert){

    List<Contact> ct = new List <Contact>();
    for(Account acc : trigger.new){
    
        contact con = new contact(lastname = acc.name, AccountId = acc.Id);
        ct.add(con);
    }
    
    if(ct.size() > 0){
    
        insert ct;
           }
}