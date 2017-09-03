CREATE PROCEDURE [dbo].[SP_AddNewCategory]
(
@CategoryName varchar(200)
)
AS
BEGIN

BEGIN TRY 
	insert into Category
	values (@CategoryName)

	END TRY

	BEGIN CATCH
	 --insert into ErrorLog
	 --values (ERROR_MESSAGE(), 'SP_AddNewCategory')

	 print ('Error occured')
	END CATCH


END