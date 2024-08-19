
show databases;

create database xyz;

drop database xyz;



show databases;
show tables from information_schema;


#show all views in a schema 
select * from information_schema.views where table_schema='classicmodels';

#show all constraint
select * from information_schema.KEY_COLUMN_USAGE where table_schema='classicmodels' and table_name='customers';

#show all indexes
select * from information_schema.STATISTICS  where table_schema='classicmodels' and table_name='customers';

#show table structure
show create table orders;
show create table orderdetails;

#show indexes
show indexes from customers;

