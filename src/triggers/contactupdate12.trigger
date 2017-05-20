trigger contactupdate12 on Account (after update) {
  
    List<Contact> conList = new List<Contact>();
    for(Contact con :[select id,accountid,lastname from contact where accountid in :trigger.new]) {

        account a = trigger.newmap.get(con.accountid);
        con.accountId = a.id;
        con.lastname = a.name;
        conList.add(con);
        }
        update conList;
        
    
   
}