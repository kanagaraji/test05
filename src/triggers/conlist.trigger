trigger conlist on Contact (before insert,after update) 
{
List<contact>listname=new List<contact>();
for(contact co:trigger.new)
{
listname.add(co);
System.debug('rajjj'+listname);
}
}