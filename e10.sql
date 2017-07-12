-- Transform all work emails into home emails and vice versa. BE CAREFUL ;)

UPDATE ElectronicMail
SET `type` =
    CASE 
        WHEN `type` = 'home' THEN 'work'
        WHEN `type` = 'work' THEN 'home'
    END
    WHERE `type` = 'home' OR `type`= 'work';