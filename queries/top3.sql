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