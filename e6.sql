-- List all of the phone numbers for Jenkins, Charlotte
SELECT Entry.firstName, Entry.lastName, Phone.content 
FROM Entry JOIN Phone ON Entry.id = Phone.entryId
    WHERE Entry.firstName = "Charlotte" AND Entry.lastName = "Jenkins";