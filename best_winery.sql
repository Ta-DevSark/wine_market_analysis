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