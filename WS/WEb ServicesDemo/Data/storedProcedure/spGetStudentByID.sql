CREATE PROCEDURE [dbo].[spGetStudentByID]
	@ID int	
AS
Begin
	SELECT Id,Name,Gender,TotalMarks
	from tblStudents Where id=@ID
End
