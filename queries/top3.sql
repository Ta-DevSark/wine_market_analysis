SELECT most_used_grapes_per_country.wines_count AS most_used_grapes_per_country_count,
    grapes.name AS grape_name,
    most_used_grapes_per_country.country_code AS cntry_code,
    countries.name AS cntry_name,
    most_used_grapes_per_country.grape_id AS grape_id
FROM most_used_grapes_per_country AS most_used_grapes_per_country
JOIN countries ON cntry_code = countries.code
JOIN grapes ON most_used_grapes_per_country.grape_id = grapes.id
GROUP BY most_used_grapes_per_country.wines_count
ORDER BY most_used_grapes_per_country_count DESC
LIMIT 3;