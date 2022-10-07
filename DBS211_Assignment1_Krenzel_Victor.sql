-- DBS211 Assignment 1
-- Victor Krenzel
-- 102446176
-- 10/06/2022

-- 1. Display employee number, employee full name, phone, extension, and city for employees who work in NYC, London, and Paris. 
--    Sort the result based on the city and the employee number
SELECT
   e.employeenumber,
   e.lastname || ' ' || e.firstname as "Employee Name",
   o.phone,
   e.extension,
   o.city
FROM
   employees e 
   JOIN
      offices o USING (officecode) 
WHERE
   UPPER(o.city) = 'NYC' 
   OR UPPER(o.city) = 'LONDON' 
   OR UPPER(o.city) = 'PARIS' 
ORDER BY
   o.city,
   e.employeenumber;
   
-- 2. Display employee number, employee full name, phone, extension, city and manager ID for employees who do not report to a manager. (See the following output) 
--    Sort the result based on the city and the employee number.
SELECT
   e.employeenumber,
   e.lastname || ', ' || e.firstname AS "Employee Name",
   o.phone,
   e.extension,
   o.city,
   e.reportsto AS "Manager Id" 
FROM
   employees e 
   JOIN
      offices o USING (officecode) 
WHERE
   e.reportsto IS NULL
ORDER BY
   o.city,
   e.employeenumber;
   
-- 3. Modify the query in Question 2 to display the manager ID and the manager name for the employees returned by the previous query. 
--    Sort the result based on the city and the employee number
SELECT
   e.employeenumber,
   e.lastname || ' ' || e.firstname AS "Employee Name",
   o.phone,
   e.extension,
   o.city,
   e.reportsto AS "Manager Id",
   m.lastname || ', ' || m.firstname AS "Manager Name" 
FROM
   employees e 
   JOIN
      offices o USING (officecode),
      employees m 
WHERE
   (
      UPPER(o.city) = 'NYC' 
      OR UPPER(o.city) = 'LONDON' 
      OR UPPER(o.city) = 'PARIS'
   )
   AND e.reportsto = m.employeenumber 
ORDER BY
   o.city,
   e.employeenumber;
   
-- 4. Select employee name, email, country, and postal code for the employees whose job title is Sales Rep. 
--    Sort the result based on the postal code
SELECT
   e.firstname AS "First Name",
   e.lastname AS "Last Name",
   e.email,
   o.country,
   o.postalcode 
FROM
   employees e 
   JOIN
      offices o USING (officecode) 
ORDER BY
   o.postalcode;
   
-- 5. Select customer name, customer number, phone, city, state, and postal code for all the customers who have not made the payment. 
--    Sort the result based on the customer number
SELECT
   c.customername,
   c.customernumber,
   c.phone,
   c.city,
   c.state,
   c.postalcode 
FROM
   customers c 
   LEFT JOIN
      payments p 
      ON c.customernumber = p.customernumber 
WHERE
   p.amount IS NULL 
ORDER BY
   c.customernumber;
   
-- 6. Find the maximum value of priceeach for the product with productcode = 'S10_1678'.
SELECT
   MAX(o.priceeach) AS "Maximum Price" 
FROM
   products p 
   JOIN
      orderdetails o 
      ON p.productcode = o.productcode 
WHERE
   UPPER(p.productcode) = 'S10_1678';