
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

#table constraints
--     NOT NULL - Ensures that a column cannot have a NULL value
--     UNIQUE - Ensures that all values in a column are different
--     PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
--     FOREIGN KEY - Prevents actions that would destroy links between tables
--     CHECK - Ensures that the values in a column satisfies a specific condition
--     DEFAULT - Sets a default value for a column if no value is specified
--     CREATE INDEX - Used to create and retrieve data from the database very quickly

#NOT NULL

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

drop table Persons;

desc persons;

#change to NOT NULL
alter table Persons
modify column age int not null;

#remove NOT NULL
alter table Persons
modify column age int ;

#unique

create table persons(
	id int NOT NULL unique,
    email varchar(100) not null
);
desc persons; 
drop table persons;  

create table persons(
	id int NOT NULL ,
    email varchar(100) not null,
    unique (id)
);
desc persons; 
drop table persons;

create table persons(
	id int NOT NULL ,
    email varchar(100) not null,
    unique (id,email)
);
desc persons; 
drop table persons;

create table persons(
	id int NOT NULL unique ,
    email varchar(100) not null,
    name int,
    unique (name,email)
);
desc persons; 
drop table persons;


create table persons(
	id int NOT NULL unique ,
    email varchar(100) not null unique,
    name varchar(100),
    constraint uniq_email unique (email,name)
); 
desc persons; 
drop table persons;

create table persons(
	id int NOT NULL unique ,
    email varchar(100) not null unique,
    name varchar(100),
    constraint uniq_email unique (name,email)
); 
desc persons; 
drop table persons; 

create table persons(
	id int NOT NULL unique ,
    email varchar(100) ,
    name varchar(100),
    job int
);     

desc persons; 
drop table persons;

alter table persons
add dept int unique;

alter table persons
add unique(job);

alter table persons
add constraint uniq_name unique(name,email);

#show constraints on table
show create table persons;
desc persons;
show indexes in persons;


#drop index/constraint
alter table persons
drop constraint uniq_email;

alter table persons
drop index uniq_email;



#primary key

create table persons(
	id int primary key,
    email int,
    name int
);
desc persons;
drop table persons;

create table persons(
	id int ,
    email int,
    name int,
    primary key(id)
);
desc persons;
drop table persons;

create table persons(
	id int ,
    email int,
    name int,
    primary key(id,email)
);
desc persons;
drop table persons;

create table persons(
	id int not null,
    email int,
    name int,
    constraint pk_persons primary key(id)
);
desc persons;
drop table persons;

create table persons(
	id int not null,
    email int,
    name int
);
desc persons;
drop table persons;

#add primary key
alter table persons
add primary key (id);

alter table persons
add primary key (id,email);

#add primary key constraint
alter table persons
add constraint pk_persons primary key(id);

#drop primary key
alter table persons
drop primary key;

alter table persons
drop constraint pk_persons;
  
#show constraints on table
show create table persons;
desc persons;
show indexes in persons;    



#foreign key constraint
#avoid inserting invalid value in foreign key ,it should be parent table primary key values onlyordersorders

create table person(
	person_id int,
    person_name varchar(100),
    primary key(person_id)

);
desc person;
drop table person;


create table myorder(
		order_id int,
        order_name varchar(100),
        personId int,
        primary key(order_id),
        foreign key (personId) references person(person_id)
);
desc myorder;
drop table myorder;
show create table myorder;

create table myorder(
		order_id int,
        order_name varchar(100),
        personId int,
        primary key(order_id),
        constraint fk_personid foreign key (personId) references person(person_id)
);
desc myorder;
drop table myorder;
show create table myorder;

insert into person values
(12,'gonu'),
(14,'sonu'),
(15,'monu');

select * from person;
#this will cause failure as value 11 for personId is invalid
insert into myorder values
(33,'pizza',11);

#personId of 12 is valid 
insert into myorder values
(33,'pizza',12);
select * from myorder;



#check constaint

create table persons(
	id int primary key,
    email varchar(100),
    name varchar(100),
    check ( id<20 && name ='anu')
);
desc persons;
drop table persons;
show create table persons;


create table persons(
	id int primary key,
    email varchar(100),
    name varchar(100),
    constraint ck_persons check ( id<20 and name ='anu')
);
desc persons;
drop table persons;
show create table persons;

create table persons(
	id int primary key,
    email varchar(100),
    name varchar(100),
    constraint ck_persons check ( id<20 and name ='anu')
);
desc persons;
drop table persons;
show create table persons;



alter table persons
add check (id>15);

alter table persons
add constraint ck_123 check (id>16);

# check constaint  will be violated so insert query will fail
insert into persons values 
(15,'a@email.com','wnu');

# check constaint id<20 will be violated so insert query will fail
insert into persons values 
(22,'a@email.com','anu');


select * from persons;

#drop check constraint
ALTER TABLE Persons
drop  constraint ck_123;

ALTER TABLE Persons
drop  check  persons_chk_1;



#default values
create table persons(
	id int not null unique,
    name varchar(100),
    email varchar(100) default 'abc@email.com'
    
);
desc persons;
drop table persons;

insert into persons (id,name) values(12,'anu');
select * from persons;

alter table persons
alter name set default 'aks';

alter table persons
add column dob date default '2016-12-12'; 

alter table persons
alter dob drop default;


#index
create table persons(
	id int not null unique,
    name varchar(100),
    email varchar(100) 
    
);
desc persons;
drop table persons;

create index email_idx
on persons (email,name);

create unique index name_idx
on persons (name);

alter table persons
drop index email_idx;

show indexes from persons;

#auto increment

create table persons(
	id int not null unique  auto_increment,
	name varchar(100)
);
desc persons;
drop table persons;

alter table persons auto_increment=22;

insert into persons(name) values
('abb'),
('dsc');

select * from persons;

#views
select * from orders ;
select * from orders where customerNumber='363';

create view myorderview as
select orderDate from orders where customerNumber='123';

drop view myorder;

show full tables where table_type like 'view';


show databases;
show tables from information_schema;

#show all views in a schema 
select * from information_schema.views where table_schema='classicmodels';






