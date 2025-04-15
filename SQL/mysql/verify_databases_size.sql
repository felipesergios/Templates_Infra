SELECT 
    table_schema AS 'Database',
    ROUND(SUM(data_length + index_length) / 1024 / 1024 / 1024, 2) AS 'Size (GB)'
FROM 
    information_schema.tables
GROUP BY 
    table_schema
ORDER BY 
    `Size (GB)` DESC;
