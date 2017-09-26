select * from Category


select * from Products


select DATALENGTH('The Slim Straight Jeans from Calvin Klein Jeans will fast become your go-to choice. Designed with a relaxed leg which is slightly tapered for a sleek finish, the jeans are perfect for both smart-casual events or dressed-down days.')

select C.CategoryName, SUM(P.ProductQuantity)
from Products P, Category C
where P.CategoryID = C.CategoryID
Group by C.CategoryName
having SUM(P.ProductQuantity) > 0


-- Get all products for which AvailableStock > 0 and specific CategoryID
SELECT * 
		   FROM
		   (SELECT P.CategoryID,
				   P.ProductID,
				   P.Name,
				   P.Price,
				   P.ImageUrl,
				   C.CategoryName,
				   P.ProductQuantity,
				   ISNULL(SUM(CP.TotalProduct), 0)	AS ProductSold,
				   P.ProductQuantity - ISNULL(SUM(CP.TotalProduct), 0)	AS AvailableStock
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
		AND CategoryID = 4 --@CategoryId