trigger updatee on Contact(before update)
{
for(Contact c:trigger.new)
{
Account ac=[select id from Account Where name='raj'];
if(c.LeadSource=='web'&&c.Level__c=='primary')
c.AccountID=ac.id;
}
}