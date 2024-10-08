﻿IF OBJECT_ID ('salaryorash.DeleteSalaryInfo') IS NOT NULL  
	DROP PROCEDURE [salaryorash].[DeleteSalaryInfo]
GO
CREATE PROCEDURE [salaryorash].[DeleteSalaryInfo] 
	@NationalCode NVARCHAR(20) , ---> کد ملی
	@Year	      INT	   , ---> سال
	@Month	      INT            ---> ماه
WITH ENCRYPTION
AS
BEGIN
	IF((ISNULL(@NationalCode,'') <> '') AND (ISNULL(@Year,0) <> 0) AND (ISNULL(@Month,0) <> 0))
		DELETE FROM [salaryorash].[SalaryInfo]
		WHERE   NationalCode = @NationalCode
			AND [Year]       = @Year        
			AND [Month]      = @Month       
END
