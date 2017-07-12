-- List all of the emails associated to AddressBook.id = 100

SELECT Account.email FROM Account JOIN AddressBook 
    ON Account.id = AddressBook.accountId
    WHERE AddressBook.id = 100;