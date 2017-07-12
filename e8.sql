-- List how many phones were landlines, cellular and fax 
-- for entries with birthdates between October 1950 and October 1960

SELECT Phone.subtype, COUNT(*) AS occurances
FROM Entry JOIN Phone ON Entry.id = Phone.entryId
    WHERE Entry.birthday >= '1950-10-01' AND Entry.birthday <= '1960-10-31'
    GROUP BY Phone.subtype ORDER BY occurances DESC;