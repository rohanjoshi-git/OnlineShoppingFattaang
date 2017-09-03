CREATE PROCEDURE [dbo].[SP_GetAllCategories]

AS
BEGIN

BEGIN TRY

	select * from Category

	END TRY

	BEGIN CATCH
	 --insert into ErrorLog
	 --values (ERROR_MESSAGE(), 'SP_AddNewCategory')
	 print ('Error occured')
		
	END CATCH

END