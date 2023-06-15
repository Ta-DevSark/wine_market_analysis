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