#find all common name in employee and customers
(select firstName from employees)
intersect
(select contactFirstName from customers)
order by firstName;