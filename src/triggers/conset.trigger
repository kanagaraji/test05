trigger conset on Contact (before insert,after update) 
{
list<contact>setname=new list<contact>();
for(contact co:trigger.new)
{
setname.add(co);
System.debug('xxx'+setname);
}
}