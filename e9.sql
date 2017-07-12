-- List all of the cities within the countries of Canada, Austria, Isle of Man, Ireland and Japan.
SELECT city, country FROM Address
    WHERE country = 'Canada' OR country = 'Austria' OR country = 'Isle of Man' 
        OR country = 'Ireland' OR country = 'Japan'
    GROUP BY city ORDER BY country ASC;