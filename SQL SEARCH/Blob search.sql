# =================
# BLOB SEARCH
# =================

SELECT 
    CONCAT(
        'SELECT "', A.TABLE_SCHEMA, '.', A.TABLE_NAME, '.', A.COLUMN_NAME, '" AS source, CONVERT(', A.COLUMN_NAME, ' USING utf8) AS ', A.COLUMN_NAME, 
        ' FROM ', A.TABLE_SCHEMA, '.', A.TABLE_NAME, 
        ' WHERE CONVERT(', A.COLUMN_NAME, ' USING utf8) LIKE \'%someText%\' UNION '
    ) 
FROM INFORMATION_SCHEMA.COLUMNS A
WHERE 
    A.TABLE_SCHEMA NOT IN ('mysql', 'innodb', 'performance_schema', 'information_schema')
    AND A.DATA_TYPE LIKE '%blob%';
