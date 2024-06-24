#group by

desc orders;
desc orderdetails;

show create table orders;
show create table orderdetails;


select status,count(*) 
from orders 
group by status;


# find total sales by status
select status,sum(quantityOrdered*priceEach) as sum  from orders o 
inner join orderdetails od
ON o.orderNumber=od.orderNumber
group by status;

#find total sales by year
select year(orderDate) as year,sum(quantityOrdered*priceEach) as total from orders o
inner join orderdetails od
using(orderNumber)
group by year(orderDate);


#find total sales by year after 2003
select year(orderDate) as year,sum(quantityOrdered*priceEach) as total from orders o
inner join orderdetails od
using(orderNumber)
group by year
having year>2003;

#find sales by year and status ,sort it by status
select year(orderDate) as year,status,sum(quantityOrdered*priceEach) as total from orders o
inner join orderdetails od
using(orderNumber)
group by year,status
order by status;



