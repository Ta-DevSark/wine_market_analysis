SELECT keywords.id AS key_id, 
      keywords.name AS key_name,
      keywords_wine.group_name AS flavor_group,
      wines.name AS w_name,
      keywords_wine.count AS keywine_count
FROM keywords
JOIN keywords_wine ON keywords.id = keywords_wine.keyword_id
JOIN wines ON keywords_wine.wine_id = wines.id
WHERE keywords.name IN ('coffee', 'toast', 'green apple', 'cream', 'citrus')
 AND keyword_type = "primary"
 AND keywords_wine.count > 10

GROUP BY wines.name

ORDER BY keywine_count DESC;