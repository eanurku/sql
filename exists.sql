#find the customer who has at least one order

select  count(*) from customers
where  customerNumber IN (select (customerNumber)  from orders);

#using subquery with exists
select distinct count(*) from customers
where exists(
select 1 from orders where orders.customerNumber=orders.customerNumber
);

select * from orders o
inner join orderdetails od
on o.orderNumber=od.orderNumber
where comments is NULL


#exist vs IN query performance



