select distinct count (customerName) from customers c
inner join orders o
on c.customerNumber=o.customerNumber;