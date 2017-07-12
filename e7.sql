-- List all possible domain name values for ElectronicMail (email@domain.name)
SELECT SUBSTRING_INDEX(ElectronicMail.content, '@', -1) AS domain_names FROM ElectronicMail 
    GROUP BY domain_names ORDER BY domain_names ASC;