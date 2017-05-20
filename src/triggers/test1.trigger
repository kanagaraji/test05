trigger test1 on Lead (before insert,before update) {
for(lead le:trigger.new)
{
if(le.LeadSource=='web')
le.Rating='Hot';
else 
if(le.LeadSource=='other')
le.Rating='cold';
}
}