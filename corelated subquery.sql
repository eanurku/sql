
#find 5th max value

select customerName,creditLimit from customers cout
where 4=(select count(*) from customers cin where cin.creditLimit>cout.creditLimit);

select customerName,creditLimit  from customers 
order by creditLimit desc
limit 4,1;

#find order whose value >60k

select o.orderNumber,sum(priceEach*quantityOrdered) as total from orders o
inner join orderdetails od
using (orderNumber)
group by o.orderNumber
having total>60000;

#find customers for which their order value >60k
#using Nested Query
select customerName,customerNumber from customers
where exists 
(select o.orderNumber,sum(priceEach*quantityOrdered) as total from orders o
inner join orderdetails od
using (orderNumber)
where customers.customerNumber=o.customerNumber
group by o.orderNumber
having total>60000);

#using join
select customerName,customerNumber from customers
inner join 
(select o.customerNumber,sum(priceEach*quantityOrdered) as total from orders o
inner join orderdetails od
using (orderNumber)
group by o.orderNumber
having total>60000) as output
using (customerNumber);


