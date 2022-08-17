IF OBJECT_ID ('salaryorash.UpdateSalaryInfo') IS NOT NULL  
	DROP PROCEDURE [salaryorash].[UpdateSalaryInfo]
GO
CREATE PROCEDURE [salaryorash].[UpdateSalaryInfo] 
							 ---> از این پارامترها جهت جست و جوی سطرهایی که می خواهیم تغییر دهیم استفاده می کنیم .
	@OldNationalCode				NVARCHAR(20) , 
	@OldMonth					INT	     , 
	@OldYear					INT          , 
	@OldTafsiliCode					BIGINT	     , 
	@OldRowNo					BIGINT       , 
	---------------------------------------------- ---> از این پارامترها جهت مقادیر جدیدی که می خواهیم درج کنیم استفاده می کنیم 
	@NewRowNo					BIGINT	     , 
	@NewTafsiliCode					BIGINT	     , 
	@NewFirstName					NVARCHAR(150), 
	@NewLastName					NVARCHAR(150), 
	@NewNationalCode				NVARCHAR(20) , 
	@NewInsuranceName				NVARCHAR(250), 
	@NewInsuranceCode				NVARCHAR(250), 
	@NewTimeAttendancePersonalCode			NVARCHAR(250), 
	@NewJobPosition					NVARCHAR(250), 
	@NewWorkshopCode				NVARCHAR(250), 
	@NewWorkshopName				NVARCHAR(250), 
	@NewPersonalGroupCode				BIGINT	     , 
	@NewPersonalGroupName				NVARCHAR(250), 
	@NewTafsiliCode2				BIGINT	     , 
	@NewTafsiliName2				NVARCHAR(250), 
	@NewAddTitle					NVARCHAR(250), 
	@NewAddAmount					DECIMAL(18,8), 
	@NewAddPrice					DECIMAL(18,8), 
	@NewMinTitle					NVARCHAR(250), 
	@NewMinAmount					DECIMAL(18,8), 
	@NewMinPrice					DECIMAL(18,8), 
	@NewSumMinPrice					DECIMAL(18,8), 
	@NewYear					INT	     , 
	@NewMonth					INT			   
WITH ENCRYPTION
AS
BEGIN
	IF((ISNULL(@OldNationalCode,'') <> '') AND (ISNULL(@OldMonth,0) <> 0) AND (ISNULL(@OldYear,0) <> 0) AND (ISNULL(@OldTafsiliCode,0) <> 0) AND (ISNULL(@OldRowNo,0) <> 0))
		UPDATE [salaryorash].[SalaryInfo] 
			SET RowNo                          = CASE WHEN @NewRowNo				  IS NOT NULL THEN @NewRowNo					  ELSE RowNo                       END ,
				TafsiliCode                = CASE WHEN @NewTafsiliCode				  IS NOT NULL THEN @NewTafsiliCode				  ELSE TafsiliCode                 END ,
				FirstName                  = CASE WHEN @NewFirstName				  IS NOT NULL THEN @NewFirstName				  ELSE FirstName                   END ,
				LastName	           = CASE WHEN @NewLastName				  IS NOT NULL THEN @NewLastName					  ELSE LastName	                   END ,
				NationalCode               = CASE WHEN @NewNationalCode				  IS NOT NULL THEN @NewNationalCode				  ELSE NationalCode                END ,
				InsuranceName              = CASE WHEN @NewInsuranceName			  IS NOT NULL THEN @NewInsuranceName			  	  ELSE InsuranceName               END ,
				InsuranceCode              = CASE WHEN @NewInsuranceCode			  IS NOT NULL THEN @NewInsuranceCode			  	  ELSE InsuranceCode               END ,
				TimeAttendancePersonalCode = CASE WHEN @NewTimeAttendancePersonalCode 		  IS NOT NULL THEN @NewTimeAttendancePersonalCode		  ELSE TimeAttendancePersonalCode  END ,
				JobPosition		   = CASE WHEN @NewJobPosition				  IS NOT NULL THEN @NewJobPosition				  ELSE JobPosition		   END ,
				WorkshopCode		   = CASE WHEN @NewWorkshopCode				  IS NOT NULL THEN @NewWorkshopCode				  ELSE WorkshopCode	           END ,
				WorkshopName		   = CASE WHEN @NewWorkshopName				  IS NOT NULL THEN @NewWorkshopName				  ELSE WorkshopName	           END ,
				PersonalGroupCode          = CASE WHEN @NewPersonalGroupCode		          IS NOT NULL THEN @NewPersonalGroupCode		 	  ELSE PersonalGroupCode	   END ,
				PersonalGroupName          = CASE WHEN @NewPersonalGroupName		          IS NOT NULL THEN @NewPersonalGroupName		 	  ELSE PersonalGroupName	   END ,
				TafsiliCode2		   = CASE WHEN @NewTafsiliCode2				  IS NOT NULL THEN @NewTafsiliCode2				  ELSE TafsiliCode2	           END ,
				TafsiliName2		   = CASE WHEN @NewTafsiliName2				  IS NOT NULL THEN @NewTafsiliName2				  ELSE TafsiliName2	           END ,
				AddTitle		   = CASE WHEN @NewAddTitle			          IS NOT NULL THEN @NewAddTitle					  ELSE AddTitle		           END ,
				AddAmount		   = CASE WHEN @NewAddAmount				  IS NOT NULL THEN @NewAddAmount				  ELSE AddAmount	           END ,
				AddPrice		   = CASE WHEN @NewAddPrice				  IS NOT NULL THEN @NewAddPrice					  ELSE AddPrice		           END ,
				MinTitle		   = CASE WHEN @NewMinTitle				  IS NOT NULL THEN @NewMinTitle					  ELSE MinTitle		           END ,
				MinAmount		   = CASE WHEN @NewMinAmount				  IS NOT NULL THEN @NewMinAmount				  ELSE MinAmount	           END ,
				MinPrice		   = CASE WHEN @NewMinPrice				  IS NOT NULL THEN @NewMinPrice					  ELSE MinPrice		           END ,
				SumMinPrice		   = CASE WHEN @NewSumMinPrice				  IS NOT NULL THEN @NewSumMinPrice				  ELSE SumMinPrice                 END ,
				[Year]		           = CASE WHEN @NewYear					  IS NOT NULL THEN @NewYear				          ELSE [Year]	                   END ,
				[Month]	                   = CASE WHEN @NewMonth				  IS NOT NULL THEN @NewMonth					  ELSE [Month]	                   END
		WHERE   NationalCode = @OldNationalCode
			AND [Month]      = @OldMonth
			AND [Year]      = @OldYear
			AND TafsiliCode  = @OldTafsiliCode
			AND RowNo        = @OldRowNo
END
