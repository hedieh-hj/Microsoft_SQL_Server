IF OBJECT_ID ('salaryorash.GetUserInfo') IS NOT NULL  
	DROP PROCEDURE [salaryorash].[GetUserInfo]
GO
CREATE PROCEDURE [salaryorash].[GetUserInfo] 
	@NationalCode NVARCHAR(20)   ---> کد ملی
WITH ENCRYPTION
AS 
BEGIN 
	SELECT  [FirstName    ] ,
			[LastName     ] ,
			[NationalCode ] ,
			[WorkshopName ] ,
			[WorkshopCode ] ,
			[InsuranceName]	,
			[InsuranceCode]	,
			[JobPosition  ]	

		FROM [salaryorash].[SalaryInfo]
		WHERE   NationalCode = @NationalCode
END