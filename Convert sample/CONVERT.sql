insert into salaryorash.salaryinfo
select	CAST(RowNo AS BIGINT),
		CAST(TafsiliCode AS BIGINT) ,
		CAST(FirstName AS NVARCHAR(150)) , 
		CAST(Lastname AS NVARCHAR(150)) , 
		CAST(NationalCode AS NVARCHAR(20)) ,
		CAST(InsuranceName AS NVARCHAR(250)) ,
		CAST(InsuranceCode AS NVARCHAR(250)) ,
		CAST(TimeAttendancePersonalCode AS NVARCHAR(250)) ,
		CAST(JobPosition AS NVARCHAR(250)) ,
		CAST(WorkshopCode AS NVARCHAR(250)) ,
		CAST(WorkshopName AS NVARCHAR(250)) ,
		CASE WHEN ISNULL (PersonalGroupCode ,0)=0 THEN 0 ELSE CAST(PersonalGroupCode AS BIGINT)END PersonalGroupCode,
		CAST(PersonalGroupName AS NVARCHAR(250)),
		CASE WHEN ISNULL (TafsiliCode2 ,0)=0 THEN 0 ELSE CAST(TafsiliCode2 AS BIGINT) END TafsiliCode2,
		CAST(TafsiliName2 AS NVARCHAR(250)),
		CAST(AddTitle AS NVARCHAR(250)),
		CASE WHEN ISNULL (AddAmount ,0)=0 THEN 0 ELSE CAST(AddAmount As Decimal(18,8))END AddAmount,
		CASE WHEN ISNULL (AddPrice ,0)=0 THEN 0 ELSE CAST(AddPrice As Decimal(18,8))END AddPrice ,
		CAST(MinTitle AS NVARCHAR(250)),
		CASE WHEN ISNULL (MinAmount ,'')='' THEN 0 ELSE CAST(MinAmount As Decimal(18,8))END MinAmount,
		CASE WHEN ISNULL (MinPrice ,'')='' THEN 0 ELSE CAST(MinPrice As Decimal(18,8))END MinPrice,
		CASE WHEN ISNULL (SumMinPrice ,'')='' THEN 0 ELSE CAST(SumMinPrice As Decimal(18,8))END SumMinPrice,
		CASE WHEN ISNULL ([YEAR] ,0)=0 THEN 0 ELSE  CAST(Year AS INT)END [YEAR],
		CASE WHEN ISNULL ([MONTH] ,0)=0 THEN 0 ELSE  CAST(Month AS INT)END [MONTH]
from dbo.temp