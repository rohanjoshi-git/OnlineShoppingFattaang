CREATE PROCEDURE SP_GetAllProducts
(@CategoryId INT)
AS
BEGIN 
	BEGIN TRY 
		IF (@CategoryId <> 0)
		 BEGIN

			--SELECT * FROM Products
			--WHERE  CategoryID = @CategoryId;

		   SELECT * 
		   FROM
		   (SELECT P.CategoryID,
				   P.ProductID,
				   P.Name,
				   P.Price,
				   P.ImageUrl,
				   C.CategoryName,
				   P.ProductQuantity,
				   ISNULL(SUM(CP.TotalProducts), 0)	AS ProductSold,
				   P.ProductQuantity - ISNULL(SUM(CP.TotalProducts), 0)	AS AvailableStock
		   FROM Products P
		    INNER JOIN Category C ON C.CategoryID = P.CategoryID
			LEFT JOIN CustomerProducts CP on CP.ProductID = P.ProductID

			GROUP BY P.ProductID,
					 P.Name,
					 P.Price,
					 P.ImageUrl,
					 C.CategoryName,
					 P.ProductQuantity,
					 P.CategoryID) StockTable
		WHERE AvailableStock > 0
		AND CategoryID = @CategoryId

		 END
		 
		ELSE
		 BEGIN

		   SELECT * 
		   FROM
		   (SELECT P.CategoryID,
				   P.ProductID,
				   P.Name,
				   P.Price,
				   P.ImageUrl,
				   C.CategoryName,
				   P.ProductQuantity,
				   ISNULL(SUM(CP.TotalProducts), 0)	AS ProductSold,
				   P.ProductQuantity - ISNULL(SUM(CP.TotalProducts), 0)	AS AvailableStock
		   FROM Products P
		    INNER JOIN Category C ON C.CategoryID = P.CategoryID
			LEFT JOIN CustomerProducts CP on CP.ProductID = P.ProductID

			GROUP BY P.ProductID,
					 P.Name,
					 P.Price,
					 P.ImageUrl,
					 C.CategoryName,
					 P.ProductQuantity,
					 P.CategoryID) StockTable
		WHERE AvailableStock > 0

		 END 

	END TRY

	BEGIN CATCH
		--insert into ErrorLog
	 --values (ERROR_MESSAGE(), 'SP_AddNewCategory')

	 print ('Error occured')
	END CATCH
END