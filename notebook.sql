/*markdown
Must-have features

A complete market analysis report that answer to these questions:
*/

/*markdown

    We want to highlight 10 wines to increase our sales, which ones should we choose and why?
*/

SELECT name,
       ratings_average,
       ratings_count
FROM wines
WHERE ratings_average > 4.5
AND ratings_count > 40000
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

SELECT name,
       ratings_average,
       ratings_count
FROM wines
WHERE ratings_average > 4.5
AND ratings_count > 100000
ORDER BY ratings_count DESC

-- Cabernet Sauvignon has the 
-- highest ratings with a rating count > 150 000.
-- Strong indicator of high and steady quality.

/*markdown
    We have detected that a big cluster of customers like a specific combination of tastes. We have identified few primary keywords that matches this and we would like you to find all the wines that have those keywords. To ensure accuracy of our selection, ensure that more than 10 users confirmed those keywords. Also, identify the flavor_groups related to those keywords.
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

--   AND (group_name = lower('Coffee')
--         OR group_name = lower('Toast')
--         OR group_name = lower('Green apple')
--         OR group_name = lower('cream'),
--         OR group_name = lower('citrus'));
        

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

Nice-to-have features

    Optimise your solution to have the result as fast as possible.
    Better visualisation.
    One of our VIP client like Cabernet Sauvignon, he would like a top 5 recommandation, which wines would you recommend to him?
    Do any recommandation on ways to improve the data, the database schema or typing.
*/