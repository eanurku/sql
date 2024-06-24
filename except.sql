# find all employee not in customers
select firstName  from employees
except
select  contactFirstName  from customers
order by firstName;

