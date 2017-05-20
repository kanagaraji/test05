trigger updatecon on Contact (before update,before insert) {
contact cu;
if(trigger.isupdate)
{
for(contact con:trigger.new)
{
cu=trigger.oldMap.get(con.id);
if(cu.ProducInterest__c != con.UniqueProductInterst__c)
{
con.ProducInterest__c=con.UniqueProductInterst__c;
}
if(cu.ProductInterestlist__c != con.UniqueProductInterst__c)
{
con.ProductInterestlist__c=cu.ProductInterestlist__c+';'+con.UniqueProductInterst__c;
}
}
}
if(trigger.isinsert)
{
for(contact co:trigger.new)
{
if(co.UniqueProductInterst__c != co.ProducInterest__c)
{
co.ProducInterest__c = co.UniqueProductInterst__c;
}
if(co.UniqueProductInterst__c !=co.ProductInterestlist__c)
{
co.ProductInterestlist__c = co.UniqueProductInterst__c;
}
}
}
}