declare @tmpTable Table (ID BIGINT , Col2 NVARCHAR(10) , Col3 INT)

INSERT INTO @tmpTable 
    (ID , Col2 , Col3)
SELECT   2000 , 'Sara'  , 1
UNION ALL 
SELECT   2001 , 'Kaveh' , 3
UNION ALL
SELECT   2002 , 'Sara'  , 1
UNION ALL
SELECT   2003 , 'Laleh' , 4
UNION ALL
SELECT   2004 , 'Hoda'  , 5
UNION ALL
SELECT   2005 , 'Sara'  , 1
UNION ALL
SELECT   2006 , 'Hoda'  , 5


SELECT * FROM @tmpTable



-----------------------------
sql

SELECT ID
FROM  @tmpTable
WHERE Col2 IN  (  SELECT Col2
          FROM @tmpTable
          GROUP BY Col2 , Col3 
          HAVING COUNT(Col2) > 1 )
-----------------------------

pg

SELECT "ID" , "CellPhone", "Username"
FROM  "User"
WHERE "CellPhone" In ( SELECT "CellPhone"
          FROM "User"
          GROUP BY "CellPhone" --, Col3 
          HAVING COUNT("CellPhone") > 1 )