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
--Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
CategoryID INT, 
ProductID INT,
TotalProduct INT
)

CREATE TABLE CustomerDetails
(
Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
CustomerName varchar(100) NULL,
CustomerEmailId varchar(100) NULL,
CustomerPhoneNo varchar(10) NULL,
CustomerAddress varchar(500) NULL,
TotalProducts int NULL,
TotalPrice int NULL,
OrderDateTime datetime NULL default getdate(),
PaymentMethod varchar(100) NULL
)