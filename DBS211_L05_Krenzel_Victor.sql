-- DBS211 Assignment 1
-- Victor Krenzel
-- 102446176
-- 10/12/2022

SET AUTOCOMMIT ON;

-- Part A (DDL) :

-- 1. Create table the following tables and their given constraints:
--    L5_MOVIES (movieid:int, title:varchar(35), year:int, director:int,score:decimal(3,2))
--    L5_ACTORS (actorid:int, name:varchar(20), lastname:varchar(30))
--    L5_CASTINGS (movieid:int, actorid:int)
--    L5_DIRECTORS(id:int, name:varchar(20), lastname:varchar(30))

-- 2. Modify the movies table to create a foreign key constraint that refers to table directors.

-- 3. Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed.

-- 4. Write insert statements to add the following data to table directors and movies.

-- 5. Write SQL statements to remove all above tables. Is the order of tables important when removing? Why?

-- Part B (More DML):

-- 6. Create a new empty table employee2 the same as table employees. Use a single statement to create the table and insert the data at the same time.

-- 7. Modify table employee2 and add a new column username to this table. The value of this column is not required and does not have to be unique.

-- 8. Delete all the data in the employee2 table.

-- 9. Re-insert all data from the employees table into your new table employee2 using a single statement. 

-- 10. In table employee2, write a SQL statement to change the first name and the last name of employee with ID 1002 to your name.

-- 11. In table employee2, generate the email address for column username for each student by concatenating the first character of employee’s first name and the employee’s last name. 
--     For instance, the username of employee Peter Stone will be pstone. 
--     NOTE: the username is in all lower case letters. 

-- 12. In table employee2, remove all employees with office code 4. 

-- 13. Drop table employee2
