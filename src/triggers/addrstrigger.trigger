trigger addrstrigger on Address__c (after insert,after update,after delete) {
    list<Address__c>conlist=new List<Address__c>();
    list<Contact>clist=new List<Contact>();
    List<Address__c>consec=new List<Address__c>();
   if(Trigger.isinsert || trigger.isupdate){
       for(Address__c adds:trigger.new)
       {
if(adds.primary__c == true){
for(Address__c old:[select id,Primary__c from Address__c where primary__c=true AND master__c =: adds.master__c AND id!=:adds.id])
{
old.Primary__c=false;
            contact con = new contact(); 
            con.id=adds.master__c; 
            con.MailingStreet = adds.Street__c;
            con.MailingCity = adds.City__c;
            con.MailingPostalCode= adds.Pincode__c;
            //con.LastName = adds.name;
            
            clist.add(con);       
            conlist.add(old);
         }}
     }
          if(conlist.size()>0)
          update conlist;
          if(clist.size()>0)
          update Clist;
}
   if(trigger.isDelete && trigger.isafter){
       for(Address__c ac:trigger.old)
      {
       contact ct=new contact();
      //ct.id=null;
      ct.id=ac.master__c;
      ct.MailingStreet = null;
       ct.MailingCity = null;
      ct.MailingPostalCode=null;
     clist.add(ct);
    
}
if(clist.size()>0)
          update clist;
}


}