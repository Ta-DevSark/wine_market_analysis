-- SQLite
SELECT wine_id, name,
       ratings_average,
       ratings_count
FROM vintages
WHERE ratings_average > 4.5
AND ratings_count > 6000
ORDER BY ratings_average DESC, ratings_count DESC
LIMIT(10);
-- Because wines with a high rating average and 
-- high ratings count indicate an important interest
-- AND important customer satisfaction