

select ifnull(state,'USA') from customers;

select * from employees;

# NULL check using is
select count(*) from customers 
left join orders
using (customerNumber)
where orderNumber is NULL;


#find customer who has not placed order
select * from customers c
left join orders o
On c.customerNumber=o.customerNumber
where o.customerNumber is NULL;


select ifnull(addressLine2,"fuck off") from customers;