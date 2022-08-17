IF OBJECT_ID ('salaryorash.AddSalaryInfo') IS NOT NULL  
	DROP PROCEDURE [salaryorash].[AddSalaryInfo]
GO
CREATE PROCEDURE [salaryorash].[AddSalaryInfo] 
	@RowNo						BIGINT ,
	@TafsiliCode				BIGINT ,
	@FirstName					NVARCHAR(150),
	@LastName					NVARCHAR(150),
	@NationalCode				NVARCHAR(20),
	@InsuranceName				NVARCHAR(250),
	@InsuranceCode				NVARCHAR(250),
	@TimeAttendancePersonalCode	NVARCHAR(250),
	@JobPosition				NVARCHAR(250),
	@WorkshopCode				NVARCHAR(250),
	@WorkshopName				NVARCHAR(250),
	@PersonalGroupCode			BIGINT,
	@PersonalGroupName			NVARCHAR(250),
	@TafsiliCode2				BIGINT,
	@TafsiliName2				NVARCHAR(250),
	@AddTitle					NVARCHAR(250),
	@AddAmount					DECIMAL(18,8),
	@AddPrice					DECIMAL(18,8),
	@MinTitle					NVARCHAR(250),
	@MinAmount					DECIMAL(18,8),
	@MinPrice					DECIMAL(18,8),
	@SumMinPrice				DECIMAL(18,8),
	@Year						INT,
	@Month						INT	
			
WITH ENCRYPTION
AS
BEGIN
	BEGIN TRY
		INSERT INTO [salaryorash].[SalaryInfo]
					(	RowNo , TafsiliCode , FirstName ,	LastName , NationalCode	, InsuranceName , InsuranceCode , TimeAttendancePersonalCode , JobPosition	, WorkshopCode , WorkshopName ,
						PersonalGroupCode , PersonalGroupName ,TafsiliCode2 , TafsiliName2 , AddTitle, AddAmount , AddPrice , MinTitle , MinAmount , MinPrice , SumMinPrice , Year , Month)
		
		VALUES (	@RowNo , @TafsiliCode ,	@FirstName , @LastName , @NationalCode , @InsuranceName , @InsuranceCode , @TimeAttendancePersonalCode	, @JobPosition , @WorkshopCode , @WorkshopName ,
					@PersonalGroupCode , @PersonalGroupName , @TafsiliCode2 , @TafsiliName2 , @AddTitle ,@AddAmount , @AddPrice , @MinTitle , @MinAmount , @MinPrice , @SumMinPrice , @Year , @Month)
	END TRY
	BEGIN CATCH
		ROLLBACK
		DECLARE @ErrorMessage	NVARCHAR(4000)	,
				@ErrorSeverity  INT				,
				@ErrorState     INT
		SELECT 
			@ErrorMessage  = CAST(ERROR_NUMBER() As VARCHAR(10)) + '$' +ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState    = ERROR_STATE();
		RAISERROR (@ErrorMessage , /* Message text.*/
				   @ErrorSeverity, /* Severity.    */
				   @ErrorState     /* State.       */
				   );
		SELECT 1 AS ErrorCode , 'خطا ناشتاخته : ' + @ErrorMessage AS ErrorMessage
	END CATCH
END 