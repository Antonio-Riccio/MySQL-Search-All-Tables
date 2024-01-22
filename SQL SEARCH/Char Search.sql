# =================
# VAR/CHAR SEARCH
# =================

SELECT 
    CONCAT(
        'SELECT "', A.TABLE_SCHEMA, '.', A.TABLE_NAME, '.', A.COLUMN_NAME, '" AS source, ', A.COLUMN_NAME, 
        ' FROM ', A.TABLE_SCHEMA, '.', A.TABLE_NAME, 
        ' WHERE ', A.COLUMN_NAME, ' LIKE \'%Valore%\' UNION '
    ) 
FROM INFORMATION_SCHEMA.COLUMNS A
WHERE 
    A.TABLE_SCHEMA NOT IN ('mysql', 'innodb', 'performance_schema', 'information_schema')
    AND (
        A.DATA_TYPE LIKE '%text%'
        OR  
        A.DATA_TYPE LIKE '%char%'
    );