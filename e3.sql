-- List all of the countries with respective occurence totals in DESC order
-- Country names should all appear lowercase
SELECT LCASE(country), COUNT(*) AS occurances 
FROM Address GROUP BY country ORDER BY occurances DESC;