-- MySQL comes with the following data types for storing a date or a date/time value in the database:

--     DATE - format YYYY-MM-DD
--     DATETIME - format: YYYY-MM-DD HH:MI:SS
--     TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
--     YEAR - format YYYY or YY


select * from orders;
select orderDate,requiredDate from orders where orderDate>'2005-01-01';
