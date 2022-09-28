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

FULL JOIN
---------

INNER JOINS
-----------

OUTER JOINS
-----------

LEFT OUTER JOIN
---------------

RIGHT OUTER JOIN
----------------

INVERSE OUTER JOIN
------------------

JOINS WITH MORE THAN 2 TABLES
-----------------------------
- Check for similar field values.
- Connect 2 tables using a bridging table.
- Ex. PLAYERS, TEAMS, FIELDS. 
- Connect PLAYERS and FIELDS usings TEAMS.
SELECT firstname, lastname, address
FROM players JOIN teams USING (teamID)
    JOIN fields ON teams.homefield = fields.fieldname;

JOIN USING VS. JOIN ON
----------------------

VIEWS
-----

VIEWS VS. TABLES
----------------

CREATE VIEW
-----------


*/