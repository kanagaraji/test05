trigger TestTrigger on Lead (before update)
 {

for(Lead l:trigger.new)
{
if(l.Industry=='Agriculture')
   l.Rating='Warm';
   else if(l.Industry=='Energy')
   l.Rating='hot';
  
   }
   
   }