SELECT name AS country, 
    regions_count, 
    users_count, 
    wines_count
FROM countries
ORDER BY users_count DESC;
-- The USA have the most users. The ad campaign 
-- would impact more people there.