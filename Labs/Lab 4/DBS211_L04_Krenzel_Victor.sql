-- DBS211 Lab 04
-- Victor Krenzel
-- 102446176
-- 10/05/2022

SET AUTOCOMMIT ON;

-- 1. Create a query that shows employee number, first name, last name, city, phone number and postal code for all employees in France.
--      a. Answer this question using an ANSI-89 Join
--      b. Answer this question using an ANSI-92 Join
-- ANSI-89 
SELECT employeenumber, firstname, lastname, city, phone, postalcode
FROM employees, offices
WHERE employees.officecode = offices.officecode
AND UPPER(country) = 'FRANCE';
-- ANSI-92
SELECT employeenumber, firstname, lastname, city, phone, postalcode
FROM employees INNER JOIN offices ON employees.officecode = offices.officecode
WHERE UPPER(country) = 'FRANCE';
-- OR
SELECT employeenumber, firstname, lastname, city, phone, postalcode
FROM employees INNER JOIN offices USING (officecode)
WHERE UPPER(country) = 'FRANCE';

-- 2. Create a query that displays all payments made by customers from Canada.
--      a. Sort the output by Customer Number.
--      b. Only display the Customer Number, Customer Name, Payment Date and Amount.
--      c. Make sure the date is displayed clearly to know what date it is. (i.e. what date is 02-04-19??? ? Feb 4, 2019, April 2, 2019, April 19, 2002, ?.)
SELECT customernumber, customername, TO_CHAR (paymentdate, 'MON DD, YYYY') as paymentdate, amount
FROM customers INNER JOIN payments USING (customernumber)
WHERE UPPER(country) = 'CANADA'
ORDER BY customernumber;

-- 3. Create a query that shows all USA customers who have not made a payment. 
--    Display only the customer number and customer name sorted by customer number
SELECT customernumber, customername
FROM customers LEFT JOIN payments USING (customernumber)
WHERE payments.amount IS NULL
AND UPPER(country) = 'USA'
ORDER BY customernumber;

-- 4. a) Create a view (vwCustomerOrder) to list all orders with the following data for all customers:
--       Customer Number, Order number, order date, product name, quantity ordered, and price for each product in every order.
--    b) Write a statement to view the results of the view just created
CREATE VIEW vwCustomerOrder AS
    SELECT o.customernumber, od.ordernumber, o.orderdate, p.productname, od.quantityordered, od.priceeach
    FROM orderdetails od JOIN products p ON od.productcode = p.productcode
    JOIN orders o ON od.ordernumber = o.ordernumber
    ORDER BY ordernumber;
    
SELECT * FROM vwCustomerOrder;

-- 5. Using the vwCustomerOrder view, display the order information for customer number 124. 
--    Sort the output based on order number and then order line number. (Yes, I know orderLineNumber is not in the view)
SELECT vwCustomerOrder.*
FROM vwCustomerOrder
LEFT JOIN orderdetails ON vwCustomerOrder.ordernumber = orderdetails.ordernumber
WHERE customernumber = 124
ORDER BY vwCustomerOrder.ordernumber, orderdetails.orderlinenumber;

-- 6. Create a query that displays the customer number, first name, last name, phone, and credit limits for all customers who do not have any orders.
SELECT customers.customernumber, contactfirstname, contactlastname, phone, creditlimit
FROM customers LEFT JOIN orders ON customers.customernumber = orders.customernumber
WHERE orders.customernumber IS NULL;

-- 7. Create a view (vwEmployeeManager) to display all information of all employees and the name and the last name of their managers if there is any manager that the employee
--    reports to. Include all employees, including those who do not report to anyone.
CREATE VIEW vwEmployeeManager AS
    SELECT e.*, m.firstname || ' ' || m.lastname AS manager
    FROM employees e, employees m
    WHERE e.reportsto = m.employeenumber(+);

-- 8. Modify the employee_manager view so the view returns only employee information for employees who have a manager. 
--    Do not DROP and recreate the view ? modify it. (Google is your friend).
CREATE OR REPLACE VIEW vwEmployeeManager AS
    SELECT e.*, m.firstname || ' ' || m.lastname AS manager
    FROM employees e, employees m
    WHERE e.reportsto = m.employeenumber;

-- 9. Drop both customer_order and employee_manager views.
DROP VIEW vwCustomerOrder;
DROP VIEW vwEmployeeManager;


