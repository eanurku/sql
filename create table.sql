
#create table using another table
create table temptable as
select * from customers;

insert into temptable
select * from customers;


select * from temptable;

drop table temptable;


#create table using another table
CREATE TABLE customers_archive 
LIKE customers;

#insert customers who do not have any sales orders into the customers_archive
insert into customers_archive
select * from customers
where not exists(
select * from ocustomers_archivecustomers_archiverders where orders.customerNumber=customers.customerName
);

#describe table structure
desc temptable;

#add
alter table temptable
add email varchar(100);

#drop 
alter table temptable
drop email;

#rename
alter table temptable
rename  column email to emailid;

#change datatype
alter table temptable
modify column emailid int;


