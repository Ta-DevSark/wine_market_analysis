SELECT keywords.name AS key_name,
      COUNT(keywords.name) AS count

FROM keywords
JOIN keywords_wine ON keywords.id = keywords_wine.keyword_id
JOIN wines ON keywords_wine.wine_id = wines.id
WHERE keywords.name IN ('coffee', 'toast', 'green apple', 'cream', 'citrus')
 AND keyword_type = "primary"
 AND keywords_wine.count > 10

GROUP BY key_name

ORDER BY count DESC;