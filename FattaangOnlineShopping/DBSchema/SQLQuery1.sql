CREATE TABLE Products 
(
ProductID INT PRIMARY KEY IDENTITY (1,1),
Name VARCHAR(300),
Description VARCHAR(1000),
Price VARCHAR(50),
ImageUrl VARCHAR(500),
CategoryID INT
)

CREATE TABLE Category
(
CategoryID INT PRIMARY KEY IDENTITY (1,1), 
CategoryName VARCHAR(500)
)

CREATE TABLE CustomerProducts
(
CategoryID INT, 
ProductID INT,
TotalProduct INT
)