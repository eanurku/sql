
show databases;

create database xyz;

drop database xyz;



show databases;
show tables from information_schema;


#show all views in a schema 
select * from information_schema.views where table_schema='classicmodels';