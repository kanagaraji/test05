trigger validate on Account (before update,before insert) {
for(Account acc:Trigger.New)
{
if(acc.AnnualRevenue>50000)
{
acc.addError('Annual Revenue can not be more than 50000');
}
}
}