IF OBJECT_ID ('salaryorash.GetSalaries') IS NOT NULL  
	DROP PROCEDURE [salaryorash].[GetSalaries]
GO
CREATE PROCEDURE [salaryorash].[GetSalaries] 
	@NationalCode NVARCHAR(20) , ---> کد ملی
	@Year	      INT	   , ---> سال
	@Month	      INT            ---> ماه
WITH ENCRYPTION
AS
BEGIN
	IF((ISNULL(@NationalCode,'') <> '') AND (ISNULL(@Year,0) <> 0) AND (ISNULL(@Month,0) <> 0))
	BEGIN
		DECLARE @CompanyTitle NVARCHAR(150) 
		SELECT @CompanyTitle = CompanyTitle FROM Company

		SELECT  ROW_NUMBER() OVER(PARTITION BY [NationalCode] , [Year] , [Month] ORDER BY [NationalCode] ASC) RowID	,
				[Year]						 	       ,
				[Month]						 	       ,
				@CompanyTitle				 CompanyTitle          ,
				[WorkshopName]				 WorkUnitTitle         ,
				SUM([AddPrice]-[MinPrice]-[summinprice]) TotalPureSalaryValue  ,
				SUM([MinPrice]+[summinprice])		 TotalLegalMinValue
	
		FROM [salaryorash].[SalaryInfo]
		WHERE   NationalCode = @NationalCode
			AND [Year]   = @Year        
			AND [Month]  = @Month       
		GROUP BY [TafsiliCode] , [Year] , [Month] , [WorkshopName] , [NationalCode]
	END
END
