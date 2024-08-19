

select customerName,count(*) ,
case 
when count(*)>10 then 'Gold'
when count(*)<10 then 'silver'
end type
 from customers c
inner join orders o
ON c.customerNumber=o.customerNumber
group by customerName;
