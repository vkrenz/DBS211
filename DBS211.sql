/** 
SQL NOTES
---------

SELECT, FROM, WHERE
-------------------
SELECT 
customernumber,
contactfirstname || ' ' || contactlastname AS "Full Name",
addressline1 || ' ' || addressline2 || '. ' || city || ', ' || state || ', ' || country AS "Full Address"
FROM customers
WHERE UPPER(contactfirstname) LIKE 'MIKE%';

FILTER
------
SELECT contactfirstname || ' ' || contactlastname AS "Customer Full Name"
FROM customers
ORDER BY contactfirstname DESC;

LIMITING
--------
SELECT contactfirstname || ' ' || contactlastname AS "Customer Full Name"
FROM customers
ORDER BY contactfirstname DESC
OFFSET 20 ROWS
FETCH NEXT 10 ROWS ONLY;

INNER JOINS
-----------

OUTER JOINS
-----------

LEFT OUTER JOIN
---------------

RIGHT OUTER JOIN
----------------


*/