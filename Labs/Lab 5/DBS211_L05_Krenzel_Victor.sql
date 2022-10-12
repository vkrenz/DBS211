-- DBS211 Lab 05
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
DROP TABLE L5_movies;
DROP TABLE L5_actors;
DROP TABLE L5_castings;
DROP TABLE L5_directors;

CREATE TABLE L5_movies (
mID         INT           PRIMARY KEY,
title       VARCHAR(35)   NOT NULL,
releaseYear INT           NOT NULL,
director    INT           NOT NULL,
score       DECIMAL(3, 2)
);

CREATE TABLE L5_actors (
aID       INT           PRIMARY KEY,
firstname VARCHAR(20)   NOT NULL,
lastname  VARCHAR(30)   NOT NULL
);

CREATE TABLE L5_castings (
movieID   INT           PRIMARY KEY,
actorID   INT           PRIMARY KEY
);

CREATE TABLE L5_directors (
directorID INT           PRIMARY KEY,
firstname  VARCHAR(20)   NOT NULL,
lastname   VARCHAR(30)   NOT NULL
);

-- 2. Modify the movies table to create a foreign key constraint that refers to table directors.
ALTER TABLE L5_movies
    ADD CONSTRAINT movies_directors_fk FOREIGN KEY (director) REFERENCES L5_directors(id);

-- 3. Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed.
ALTER TABLE L5_movies
    ADD CONSTRAINT title_unique UNIQUE (title);
    
-- 4. Write insert statements to add the following data to table directors and movies.
INSERT ALL
    INTO directors VALUES (1010, 'Rob', 'Minkoff', '200 Young St. N., NULL, 'ON', 'Canada', 'M4A3A1', 'NA')
    INTO directors VALUES (9, 'Oshawa', '+1 905 555 2222', '155 Simcoe. S., NULL, 'ON', 'Canada', 'N2L3G4', 'NA')
    INTO directors VALUES (10, 'Montreal', '+1 268 555 3333', '1245 Rue Lavac, NULL, 'QC', 'Canada', 'K3S2H4', 'NA')
    SELECT * FROM dual;

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
