SELECT countries.name AS country,
    wines.name AS wine,
    ROUND(AVG(wines.ratings_average),2) AS w_rtng_avg
FROM wines
JOIN regions ON wines.region_id = regions.id
JOIN countries ON countries.code = regions.country_code
GROUP BY country
ORDER BY w_rtng_avg DESC;