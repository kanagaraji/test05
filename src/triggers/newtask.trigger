trigger newtask on Opportunity (before insert,before update) {
List<task> nt=New List<task>();

for(opportunity opp:trigger.new)
{
if(opp.Notificate__c==system.today())
{
opp.Notificate__c=system.today()+1;
}
if(opp.StageName=='Stage 1')
{
  task t=new task(
   whatid=opp.id,
   Status = 'Completed',
    Subject = 'call' );
  nt.add(t);
}
}
insert nt;
}