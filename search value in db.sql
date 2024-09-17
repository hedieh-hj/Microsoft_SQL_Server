DECLARE @SearchValue NVARCHAR(100) = 'YourSearchValue' -- Your value to search
DECLARE @SQL NVARCHAR(MAX) = ''

SELECT @SQL = @SQL + 'SELECT ''' + s.name + '.' + t.name + ''' AS TableName, ''' 
               + c.name + ''' AS ColumnName, ' + QUOTENAME(c.name) + ' AS ValueFound
               FROM ' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name)
               + ' WHERE ' + QUOTENAME(c.name) + ' LIKE ''%' + @SearchValue + '%'' UNION ALL '
FROM sys.schemas s
JOIN sys.tables t ON s.schema_id = t.schema_id
JOIN sys.columns c ON t.object_id = c.object_id
JOIN sys.types ty ON c.user_type_id = ty.user_type_id
WHERE ty.name IN ('varchar', 'nvarchar', 'char', 'nchar', 'text') -- Only text types

IF LEN(@SQL) > 0
BEGIN
    SET @SQL = LEFT(@SQL, LEN(@SQL) - 10) -- Remove the last 'UNION ALL'
    EXEC sp_executesql @SQL
END