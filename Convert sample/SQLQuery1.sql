Insert Into Salaryorash.SalaryInfo (RowNo, TafsiliCode, FirstName, LastName, NationalCode, InsuranceName, InsuranceCode, TimeAttendancePersonalCode, JobPosition, 
WorkshopCode, WorkshopName, PersonalGroupCode, PersonalGroupName, TafsiliCode2, TafsiliName2, AddTitle, AddAmount, AddPrice, MinTitle, MinAmount, MinPrice, SumMinPrice, 
Year, Month)

Select RowNo, TafsiliCode, FirstName, Lastname, Cast(Cast(NationalCode As Numeric(35,0)) As Nvarchar(150)), InsuranceName, InsuranceCode, TimeAttendancePersonalCode,[ JobPosition], WorkshopCode,[WorkshopName ], ISNull(PersonalGroupCode,0),
PersonalGroupName, IsNull(TafsiliCode2,0), TafsiliName2, AddTitle, IsNull(AddAmount,0), IsNull(AddPrice,0), MinTitle, IsNull(MinAmount,0), ISNull(MinPrice,0), IsNull(SumMinPrice,0), Year, Month
from ExcelSalaryFish


delete Salaryorash.SalaryInfo