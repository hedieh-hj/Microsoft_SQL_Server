IF OBJECT_ID ('salaryorash.GetSalaries') IS NOT NULL  
	DROP PROCEDURE [salaryorash].[GetSalaries]
GO
CREATE PROCEDURE [salaryorash].[GetSalaries] 
	@NationalCode NVARCHAR(20) ,  ---> کد ملی
	@Year	      INT	       ,  ---> سال
	@Month	      INT             ---> ماه
WITH ENCRYPTION
AS
BEGIN
		DECLARE @CompanyTitle NVARCHAR(150) 
		SELECT @CompanyTitle = CompanyTitle FROM Company

		SELECT  ROW_NUMBER() OVER(PARTITION BY [NationalCode] , [Year] , [Month] ORDER BY [NationalCode] ASC) RowID	,
				[Year]						 											 ,
				[Month]						 											 ,
				@CompanyTitle							           CompanyTitle          ,
				[WorkshopName]							           WorkUnitTitle         ,
				SUM([AddPrice])-SUM([MinPrice])-SUM([summinprice]) TotalPureSalaryValue  ,
				SUM([MinPrice])+SUM([summinprice])	               TotalLegalMinValue	   
	
		FROM [salaryorash].[SalaryInfo]
		WHERE   NationalCode = @NationalCode
			AND ((@year  IS NULL) OR ((@Year  IS NOT NULL) AND ([Year]  = @Year )))
			AND ((@Month IS NULL) OR ((@Month IS NOT NULL) AND ([Month] = @Month)))
		GROUP BY [NationalCode] , [Year] , [Month] , [WorkshopName] , [TafsiliCode]
END