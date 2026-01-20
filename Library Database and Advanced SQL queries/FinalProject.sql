CREATE DATABASE Library;
USE Library;


CREATE TABLE [Library]
(
LibraryNo VARCHAR(10) PRIMARY KEY,
LibraryAddress VARCHAR(150),
LibraryPhone VARCHAR(30)
);

CREATE TABLE Customer
(
CustomerId VARCHAR(10) PRIMARY KEY,
CustomerName VARCHAR(30),
CustomerAddress VARCHAR(150),
RegisterDate DATE,
LibraryNo VARCHAR(10),
FOREIGN KEY (LibraryNo) REFERENCES [Library](LibraryNo) ON DELETE CASCADE,
);

CREATE TABLE Books
(
ISBN VARCHAR(20) PRIMARY KEY,
Booktitle VARCHAR(150),
Category VARCHAR(30),
RentalPrice DECIMAL(10,2),
Author VARCHAR(130),
Publisher VARCHAR(50)
);

CREATE TABLE IssueStatus
(
IssueId VARCHAR(10) PRIMARY KEY,
IssuedCustomer VARCHAR(10),
IssueDate DATE,
IsbnBook VARCHAR(20),
FOREIGN KEY (IssuedCustomer) REFERENCES Customer(CustomerId) ON DELETE CASCADE,
FOREIGN KEY (IsbnBook) REFERENCES Books(ISBN) ON DELETE CASCADE
);

CREATE TABLE ReturnStatus
(
ReturnId VARCHAR(10) PRIMARY KEY,
ReturnCustomer VARCHAR(10),
ReturnDate DATE,
IsbnBook VARCHAR(20),
FOREIGN KEY (ReturnCustomer) REFERENCES Customer(CustomerId) ON DELETE CASCADE,
FOREIGN KEY (IsbnBook) REFERENCES Books(ISBN) ON DELETE CASCADE
);




-- Insert values into each tables
INSERT INTO [dbo].[Library] VALUES
('L001', '123 Main St', '+919099988676'),
('L002', '456 Elm St', '+919099988677'),
('L003', '789 Oak St', '+919099988678'),
('L004', '567 Pine St', '+919099988679'),
('L005', '890 Maple St', '+919099988680');
SELECT * FROM [Library];

INSERT INTO customer VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15', 'L001'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20', 'L001'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10','L002'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05','L002'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25','L003'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15','L003'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20','L003'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10','L004'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05','L004'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25','L005');
SELECT * FROM customer;

INSERT INTO Books VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50,  'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50,  'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00,  'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50,  'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00,  'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50,  'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00,  'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'Charles C. Mann', 'Vintage Books');
SELECT * FROM Books;

INSERT INTO IssueStatus VALUES
('IS101', 'C101', '2023-05-01', '978-0-553-29698-2'),
('IS102', 'C102', '2023-05-02', '978-0-7432-4722-4'),
('IS103', 'C103','2023-05-03', '978-0-7432-7357-1'),
('IS104', 'C104', '2023-05-04', '978-0-307-58837-1'),
('IS105', 'C105',  '2023-05-05', '978-0-375-41398-8'),
('IS106', 'C101', '2023-06-01', '978-0-525-47535-5'),
('IS107', 'C101', '2023-07-02', '978-0-307-58837-1'),
('IS108', 'C103','2023-06-03', '978-0-393-91257-8'),
('IS109', 'C103', '2023-07-04', '978-0-553-29698-2'),
('IS110', 'C103',  '2023-08-05', '978-0-375-41398-8');
SELECT * FROM IssueStatus;

INSERT INTO ReturnStatus VALUES
('RS101', 'C101',  '2023-06-06', '978-0-553-29698-2'),
('RS102', 'C102',  '2023-06-07', '978-0-7432-4722-4'),
('RS103', 'C105',  '2023-06-08', '978-0-375-41398-8'),
('RS104', 'C108',  '2023-06-09', '978-0-14-044930-3'),
('RS105', 'C110',  '2023-06-10', '978-0-09-957807-9'),
('RS106', 'C103',  '2023-05-23', '978-0-7432-7357-1');
SELECT * FROM ReturnStatus;


/***constraint***/
INSERT INTO IssueStatus VALUES
('IS111', 'C101', '2024-02-01', '978-0-553-29698-0')
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__IssueStat__IsbnB__3E52440B". The conflict occurred in database "Library", table "dbo.Books", column 'ISBN'.



/*Queries*/

-- Retrieve the book title, category, and rental price of all available book with RentalPrice > 6.50.
SELECT Booktitle, Category, RentalPrice 
FROM Books 
WHERE RentalPrice > 6.50 
ORDER BY RentalPrice, Category ;




-- Retrieve the books data and the corresponding customers who have issued those books and its status.
SELECT Books.ISBN, Books.Booktitle, customer.CustomerName, IssueDate,
CASE WHEN [ReturnId] IS NULL THEN 'In use' ELSE 'Available' END BookStatus
FROM IssueStatus 
INNER JOIN Customer ON IssueStatus.IssuedCustomer = customer.CustomerId
INNER JOIN Books ON IssueStatus.IsbnBook = Books.ISBN
LEFT JOIN  ReturnStatus ON ReturnStatus.IsbnBook = Books.ISBN AND [IssuedCustomer] = [ReturnCustomer] AND [ReturnDate] > [IssueDate]
ORDER BY IssueDate;


-- Display the total count of books in each category with more than 2 books.
SELECT Category, COUNT(Booktitle) AS TotalBooks 
FROM Books 
GROUP BY Category
HAVING COUNT(Booktitle) > 2;

--- List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT CustomerName 
FROM Customer 
WHERE Registerdate < '2022-01-01' AND CustomerId NOT IN (SELECT [IssuedCustomer] FROM IssueStatus);


----Update a column based on a condition that needs to be met using the WHERE clause
SELECT * FROM Customer WHERE CustomerId = 'C105'
UPDATE [dbo].[Customer] SET [CustomerAddress] = '123 SW 90 St'
WHERE CustomerId = 'C105'
SELECT * FROM [dbo].[Customer] WHERE CustomerId = 'C105'


---- Retrieve data with a query directly into a variable. Ensure that variables are initially declared.
DECLARE @MostExpensive FLOAT, @LeastExpensive FLOAT

SELECT @MostExpensive = MAX([RentalPrice]), @LeastExpensive = MIN([RentalPrice])
FROM [dbo].[Books]

SELECT @MostExpensive [Most Expensive Book] , @LeastExpensive [Least Expensive Book]


---- stored procedures
-- Get book details (if the parameter is empty, return everything
CREATE PROCEDURE SP_GetBookDetails (@ISBN VARCHAR(20))
AS
BEGIN
	SET NOCOUNT ON;

SELECT [ISBN]
      ,[Booktitle]
      ,[Category]
      ,[RentalPrice]
      ,[Author]
      ,[Publisher]
  FROM [dbo].[Books]
  WHERE [ISBN] LIKE CASE WHEN @ISBN = '' THEN '%%' ELSE @ISBN END

END


--- Update customer address (return message about the result
CREATE PROCEDURE [dbo].[SP_UpdateCustomerAddress] 
(@CustomerId varchar(10), @Address Varchar(150), @ResultMessage varchar(150) OUT)

AS
BEGIN
	
	SET NOCOUNT ON;

	SET @ResultMessage = 'OK'

	UPDATE [dbo].[Customer] SET
	   [CustomerAddress] = @Address
	WHERE [CustomerId] = @CustomerId

	IF @@ROWCOUNT = 0
	BEGIN
		SET @ResultMessage = 'Address not updated'
	END
    
END


/***************Executing SP *********************************/

EXEC SP_GetBookDetails ''   ---Getting all books


EXEC SP_GetBookDetails '978-0-14-118776-1' ---Getting specific ISBN book


/*********************Executing the SP - right data********************************/
DECLARE @CustomerId VARCHAR(10) = 'C102'
DECLARE @Address VARCHAR(150) = '1256 NW 68 Ave'
DECLARE @ResultMessage VARCHAR(150)

EXECUTE [dbo].[SP_UpdateCustomerAddress] 
   @CustomerId
  ,@Address
  ,@ResultMessage OUTPUT

  SELECT  @ResultMessage


/*********Ckecking the update ***************************/
SELECT * FROM [dbo].[Customer] WHERE CustomerId = 'C102'


/*****************  Executing the SP - wrong data ****************************/
DECLARE @CustomerId VARCHAR(10) = '1256'
DECLARE @Address VARCHAR(150) = '123456'
DECLARE @ResultMessage VARCHAR(150)

EXECUTE [dbo].[SP_UpdateCustomerAddress] 
   @CustomerId
  ,@Address 
  ,@ResultMessage OUTPUT


  SELECT @ResultMessage

