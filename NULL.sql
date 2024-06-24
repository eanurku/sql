

select ifnull(state,'USA') from customers;

select * from employees;

# NULL check using is
select count(*) from customers 
left join orders
using (customerNumber)
where orderNumber is NULL;