trigger convert on Lead (before insert) {
List<Lead> llist=new List<Lead>();
List<Contact>conlist=new List<Contact>();
List<Opportunity> opplist=new List<Opportunity>();
for(lead d:trigger.new)
{
     contact co=new contact();
     co.LastName=d.LastName;
     co.Email=d.Email;
     co.Phone=d.Phone;
     conlist.add(co);
if(d.Budget__c!=Null || d.Intent__c!=Null || d.PurchasingTime__c!=Null)
{
opportunity opp=new opportunity();
opp.Name=d.LastName;
opp.StageName=d.Stage__c;
opp.CloseDate=d.CloseDate__c;
opp.Budget__c=d.Budget__c;
opp.Intent__c=d.Intent__c;
opp.PurchasingTime__c=d.PurchasingTime__c;
opplist.add(opp);
}
}
if(conlist.size()>0)
insert conlist;
if(opplist.size()>0)
insert opplist;
}