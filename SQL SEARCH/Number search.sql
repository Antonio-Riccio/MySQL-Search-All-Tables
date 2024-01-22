# =================
# NUMBER SEARCH
# =================

SELECT 
    CONCAT(
        'SELECT "', A.TABLE_SCHEMA, '.', A.TABLE_NAME, '.', A.COLUMN_NAME, '" AS source, ', A.COLUMN_NAME, 
        ' FROM ', A.TABLE_SCHEMA, '.', A.TABLE_NAME, 
        ' WHERE ', A.COLUMN_NAME, ' LIKE (\'%1234567890%\') UNION '
    ) 
FROM INFORMATION_SCHEMA.COLUMNS A
WHERE 
    A.TABLE_SCHEMA NOT IN ('mysql', 'innodb', 'performance_schema', 'information_schema')
    AND A.DATA_TYPE IN ('bigint', 'int', 'smallint', 'tinyint', 'decimal', 'double');