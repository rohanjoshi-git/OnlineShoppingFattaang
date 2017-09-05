create PROCEDURE SP_AddNewProduct
(
@ProductName varchar(300),
@ProductPrice int,
@ProductImage varchar(500),
@ProductDescription varchar(1000),
@CategoryID int
)
AS
	BEGIN
		BEGIN TRY

			insert into Products
			values 
			(
			@ProductName,
			@ProductDescription,
			@ProductPrice,
			@ProductImage,
			@CategoryID
			)
		END TRY

		BEGIN CATCH

			--INSERT INTO dbo.ErrorLog
			--VALUES (ERROR_MESSAGE(), 'SP_AddNewProduct')
			print('Error Occured')

		END CATCH
	END