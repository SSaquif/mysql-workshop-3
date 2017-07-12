-- List all of the first names for AddressBook.name="Pharetra Ut Limited"

-- Note: Kept AddressBook.name in SELECT for testin. Feel free to remove it
SELECT Entry.firstName, AddressBook.name FROM Entry JOIN AddressBook 
    ON Entry.addressBookId = AddressBook.id
    WHERE AddressBook.name="Pharetra Ut Limited";

