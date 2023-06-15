/*markdown
A complete market analysis report that answer to these questions:
*/

/*markdown
    We want to highlight 10 wines to increase our sales, which ones should we choose and why?
*/

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

/*markdown
    We have a marketing budget for this year, which country should we prioritise and why?
*/

SELECT name, regions_count, users_count, wines_count
FROM countries
ORDER BY users_count DESC;
-- The USA have the most users. The ad campaign 
-- would impact more people there.

/*markdown
    We would like to give a price to the best winery, which one should we choose and why?
*/

SELECT ROUND(AVG(vintages.ratings_average), 1) AS new_vint_avg,
       wineries.name AS wnry_name,
       wines.name AS w_name,
       vintages.name AS vint_name,
       COUNT(wines.name) AS count_w
FROM vintages
JOIN wines ON vintages.wine_id = wines.id
JOIN wineries ON wines.winery_id = wineries.id
GROUP BY wines.name
HAVING count_w > 10
ORDER BY new_vint_avg DESC
LIMIT 10;
-- The Toscana type has a lot of vintages and the combined
-- average is the highest among the vintages.

/*markdown
    We have detected that a big cluster of 
    customers like a specific combination of tastes. 
    We have identified few primary keywords that matches this and we would like you to find all the wines that have those keywords. 
    
    To ensure accuracy of our selection, ensure that more than 10 users confirmed those keywords. 
    
    Also, identify the flavor_groups related to 
    those keywords.
        Coffee
        Toast
        Green apple
        cream
        citrus
        
*/

SELECT keywords.id AS key_id, 
      keywords.name AS key_name,
      keywords_wine.group_name AS flavor_group,
      wines.name AS w_name,
      keywords_wine.count AS keywine_count
FROM keywords
JOIN keywords_wine ON keywords.id = keywords_wine.keyword_id
JOIN wines ON keywords_wine.wine_id = wines.id
WHERE keywords.name IN ('Coffee', 'Toast', 'Green apple', 'cream', 'citrus')
  AND keywords_wine.count > 10;

/*markdown
    We would like to do a selection of wines that are easy to find all over the world. 
    
    Find the top 3 most common grape all over the world and for each grape, give us the the 5 best rated wines.


*/

SELECT mugpc.wines_count AS mugpc_count,
    grapes.name AS grape_name,
    mugpc.country_code AS mugpc_cntry_code,
    countries.name AS cntry_name,
    mugpc.grape_id AS mugpc_grape_id
FROM most_used_grapes_per_country AS mugpc
JOIN countries ON mugpc_cntry_code = countries.code
JOIN grapes ON mugpc.grape_id = grapes.id
GROUP BY mugpc.wines_count
ORDER BY mugpc_count DESC
LIMIT 3;

/*markdown
We would like to create a country leaderboard, give us a visual that shows the average wine rating for each country. Do the same for the vintages.
*/

SELECT countries.name AS country,
    wines.name AS wine,
    ROUND(AVG(wines.ratings_average),2) AS w_rtng_avg
FROM wines
JOIN regions ON wines.region_id = regions.id
JOIN countries ON countries.code = regions.country_code
GROUP BY country
ORDER BY w_rtng_avg DESC;

SELECT countries.name AS country,
    vintages.name AS vintage,
    wines.name AS wine,
    ROUND(AVG(vintages.ratings_average),2) AS vint_rtng_avg
FROM vintages
JOIN wines ON vintages.wine_id = wines.id
JOIN regions ON wines.region_id = regions.id
JOIN countries ON countries.code = regions.country_code
GROUP BY country
ORDER BY vint_rtng_avg DESC;

/*markdown
    Give us any other useful insights you found in our data. Be creative!


*/




/*markdown
    One of our VIP client like Cabernet Sauvignon, he would like a top 5 recommandation, which wines would you recommend to him?
*/




/*markdown
    Do any recommandation on ways to improve the data, the database schema or typing.
*/