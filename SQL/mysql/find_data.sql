SELECT 
    TABLE_SCHEMA AS database_name,
    TABLE_NAME   AS view_name
FROM 
    information_schema.VIEWS
WHERE 
    TABLE_NAME LIKE '%parte_do_nome%';
