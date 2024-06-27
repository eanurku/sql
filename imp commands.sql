-- #important sql commands
--     SELECT - extracts data from a database
--     UPDATE - updates data in a database
--     DELETE - deletes data from a database
--     INSERT INTO - inserts new data into a database
--     CREATE DATABASE - creates a new database
--     ALTER DATABASE - modifies a database
--     CREATE TABLE - creates a new table
--     ALTER TABLE - modifies a table
--     DROP TABLE - deletes a table
--     CREATE INDEX - creates an index (search key)
--     DROP INDEX - deletes an index

-- The most commonly used SQL aggregate functions are:

--     MIN() - returns the smallest value within the selected column
--     MAX() - returns the largest value within the selected column
--     COUNT() - returns the number of rows in a set
--     SUM() - returns the total sum of a numerical column
--     AVG() - returns the average value of a numerical column

-- Aggregate functions ignore null values (except for COUNT()).

#insert multiples 
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');


INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

INSERT INTO Customers 
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

#order by
select * from customers
order by customerName desc,contactFirstName asc;

#count over distinct
select count(distinct customerName) from customers;

select count(*) from 
(select distinct customerName from customers) customerNames;

#limit 
select * from customers limit 3;

#find names starting with vowels
select * from customers
where customerName regexp "^[aeiou]+";

# betweeen text values
select * from customers
where customerName between 'a' and 'c';

#between dates
select * from orders
where orderDate between '2003-01-06' and '2004-01-01';

#alias
select customerName as "name of customer" from customers;

#concat
select concat(customerNumber," |",customerName) from customers;

#cartesian join and where clause for filtering rows
select c.customerName,o.orderNumber
from customers c ,orders o
where  c.customerNumber=o.customerNumber and  c.customerName like "%signal%";




