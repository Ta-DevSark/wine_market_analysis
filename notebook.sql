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

SELECT ROUND(AVG(vintages.ratings_average), 1) AS new_vintage_rating_avg,
       wines.id AS wines_id,
       wineries.id AS winery_id,
       wineries.name AS winery_name,
       wines.name AS wines_name,
       vintages.name AS vintage_name,
       COUNT(wines.name) AS count_wines
FROM vintages
JOIN wines ON vintages.wine_id = wines.id
JOIN wineries ON wines.winery_id = wineries.id
GROUP BY wines.name
HAVING count_wines > 10
ORDER BY new_vintage_rating_avg DESC
LIMIT 10;

SELECT COUNT(name)
FROM wines
WHERE name = 'Toscana';

/*markdown
    We have detected that a big cluster of 
    customers like a specific combination of tastes. 
    We have identified few primary keywords that matches this 
    and we would like you to find all the wines that have those keywords. 
    To ensure accuracy of our selection, ensure that more than 10 users 
    confirmed those keywords. Also, identify the flavor_groups related to 
    those keywords.
        Coffee
        Toast
        Green apple
        cream
        citrus
        
*/

  SELECT name
  FROM keywords
  WHERE name IN(lower('Coffee'),
        lower('Toast'),
        lower('Green apple'),
        'cream',
        'citrus'
        );

/*markdown
    We would like to do a selection of wines that are easy to find all over the world. 
    
    Find the top 3 most common grape all over the world and for each grape, give us the the 5 best rated wines.
*/



/*markdown
    We would like to create a country leaderboard, give us a visual that shows the average wine rating for each country. Do the same for the vintages.
*/



/*markdown
    Give us any other useful insights you found in our data. Be creative!
*/



/*markdown
    Optimise your solution to have the result as fast as possible.
    Better visualisation.

*/

/*markdown
    One of our VIP client like Cabernet Sauvignon, he would like a top 5 recommandation, which wines would you recommend to him?

*/



/*markdown
    Do any recommandation on ways to improve the data, the database schema or typing.
*/


