CREATE PROCEDURE SP_SaveCustomerDetails
(
@CustomerName varchar(100),
@CustomerEmailId varchar(100),
@CustomerPhoneNo varchar(10),
@CustomerAddress varchar(500),
@TotalProducts int,
@TotalPrice int,
@PaymentMethod varchar(100)
)
AS
	BEGIN
		BEGIN TRY

			INSERT INTO [dbo].[CustomerDetails]
           ([CustomerName]
           ,[CustomerEmailId]
           ,[CustomerPhoneNo]
           ,[CustomerAddress]
           ,[TotalProducts]
           ,[TotalPrice]
           --,[OrderDateTime]
           ,[PaymentMethod])
     VALUES
           (@CustomerName 
			,@CustomerEmailId
			,@CustomerPhoneNo
			,@CustomerAddress
			,@TotalProducts
			,@TotalPrice
			,@PaymentMethod
		   )

		   select @@IDENTITY as CustomerId -- latest (entered) CustomerId will be returned to the DAL through DataTable dt

		END TRY
		
		BEGIN CATCH

			--INSERT INTO dbo.ErrorLog
			--VALUES (ERROR_MESSAGE(), 'SP_SaveCustomerDetails')
			print('Error Occured')

		END CATCH
	END