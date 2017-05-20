trigger updateContacts13 on Account(before update) {

    Map<Id, Account> acctsWithNewAddresses = new Map<Id, Account>();

    for (Integer i = 0; i < Trigger.new.size(); i++) {

        if (   (Trigger.old[i].ShippingCity != Trigger.new[i].

                                                 ShippingCity)

            || (Trigger.old[i].ShippingCountry != Trigger.new[i].

                                                 ShippingCountry)

           || (Trigger.old[i].ShippingPostalCode != Trigger.new[i].

                                                ShippingPostalCode)

            || (Trigger.old[i].ShippingState != Trigger.new[i].

                                                 ShippingState)

            || (Trigger.old[i].ShippingStreet != Trigger.new[i].
                                                ShippingStreet))  {

            acctsWithNewAddresses.put(Trigger.old[i].id,

                                      Trigger.new[i]);

        }

    }

 

    List<Contact> updatedContacts = new List<Contact>();

  for (Contact c : [SELECT id, accountId, MailingCity,

                             MailingCountry, MailingPostalCode,

                             MailingState, MailingStreet

                      FROM contact

                      WHERE accountId

                            in :acctsWithNewAddresses.keySet()]) {

        Account parentAccount = acctsWithNewAddresses.get(c.accountId);

        c.MailingCity = parentAccount.ShippingCity;

        c.MailingCountry = parentAccount.ShippingCountry;

        c.MailingPostalCode = parentAccount.ShippingPostalCode;

        c.MailingState = parentAccount.ShippingState;

        c.MailingStreet = parentAccount.ShippingStreet;

 

        
        updatedContacts.add(c);

    }

    update updatedContacts;

}