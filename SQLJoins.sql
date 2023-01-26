/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name AS 'Product', C.Name AS 'Category'
FROM products AS P
INNER JOIN categories AS C ON P.CategoryID = C.CategoryID
WHERE C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT P.Name, P.Price, R.Rating 
FROM products AS P
INNER JOIN reviews AS R ON P.ProductID = R.ProductID
WHERE R.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT E.FirstName, E.LastName, Sum(S.quantity) AS Total
FROM employees AS E
INNER JOIN sales AS S ON E.EmployeeID = S.EmployeeID
Group By E.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT D.Name AS 'Department Name', C.Name AS 'Category Name'
FROM categories AS C
INNER JOIN departments AS D ON C.DepartmentID = D. DepartmentID
Where C.Name = 'Appliances' OR C.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT P.Name, Sum(S.Quantity) AS 'Total # Sold', Sum(S.Quantity * S.PricePerUnit) AS 'Total Price Sold'
 FROM products AS P
 INNER JOIN sales AS S ON P.ProductID = S.ProductID
 WHERE P.ProductID = 97;
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.Name, R.Reviewer, R.Rating, R.Comment
FROM products AS P
INNER JOIN reviews AS R ON P.ProductID = R.ProductID
WHERE P.ProductID = 857
ORDER BY R.Rating 
LIMIT 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT E.EmployeeID, E.FirstName, E.LastName, P.Name AS ProductName, Sum(S.Quantity) AS TotalSold
FROM sales AS S
INNER JOIN employees AS E ON E.EmployeeID = S.EmployeeID
INNER JOIN products AS P ON S.ProductID = P.ProductID
GROUP BY E.EmployeeID, P.ProductID
ORDER BY E.FirstName;
