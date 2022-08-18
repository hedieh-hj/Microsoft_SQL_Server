IF OBJECT_ID ('salaryorash.GetSalaryInfo') IS NOT NULL  
	DROP PROCEDURE [salaryorash].[GetSalaryInfo]
GO
CREATE PROCEDURE [salaryorash].[GetSalaryInfo] 
	@NationalCode NVARCHAR(20) ,  ---> کد ملی
	@Year	      INT	       ,  ---> سال
	@Month	      INT             ---> ماه
WITH ENCRYPTION
AS 
BEGIN 
	BEGIN
		SELECT  1 AS Type   ,
				ROW_NUMBER() OVER(PARTITION BY [NationalCode] , [Year] , [Month] ORDER BY [NationalCode] ASC) RowID ,
				AddTitle    ,
				AddAmount   ,
				AddPrice    ,
				MinTitle    ,
				MinAmount   ,
				MinPrice    ,
				SumMinPrice ,
				NULL TotalPureSalaryValue 

		FROM [salaryorash].[SalaryInfo]
		WHERE   NationalCode = @NationalCode		
			AND [Year]       = @Year       
			AND [Month]      = @Month
		----------------------------------------------------
		UNION ALL ------------------------------------------
		----------------------------------------------------
		SELECT  2 AS                           Type        ,
				NULL                           RowID       ,
				NULL                           AddTitle    ,
				NULL                           AddAmount   ,
				SUM(AddPrice)                  AddPrice    ,
				NULL                           MinTitle    ,
				NULL                           MinAmount   ,
				SUM(MinPrice)+SUM(SumMinPrice) MinPrice    ,
				NULL SumMinPrice						   ,
				SUM(AddPrice)-(SUM(MinPrice)+SUM(SumMinPrice)) TotalPureSalaryValue

		FROM [salaryorash].[SalaryInfo]
		WHERE   NationalCode = @NationalCode		
			AND [Year]       = @Year       
			AND [Month]      = @Month
		GROUP BY NationalCode , [Year] , [Month]
	
	END
END