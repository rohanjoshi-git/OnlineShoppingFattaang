CREATE PROCEDURE SP_SaveCustomerProducts
(
@CustomerId int,
@ProductId int,
@TotalProducts int
)
AS
	BEGIN
		BEGIN TRY	

			INSERT INTO [dbo].[CustomerProducts]
					   ([CustomerID]
					   ,[ProductID]
					   ,[TotalProducts])
				 VALUES
					   (@CustomerId,
						@ProductId,
						@TotalProducts)

		END TRY
		
		BEGIN CATCH

			--INSERT INTO dbo.ErrorLog
			--VALUES (ERROR_MESSAGE(), 'SP_SaveCustomerDetails')
			print('Error Occured')

		END CATCH
	END