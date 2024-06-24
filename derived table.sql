

select * from orders;
select * from orderdetails;


#find top 5 product name with sales in 2003;

select productCode,productName,round(total) from products p
inner join 
(select productCode,sum(priceEach*quantityOrdered) as total from orders o
inner join orderdetails od
using (orderNumber)
where year(shippedDate)=2003
group by productCode
order by total desc
limit 5) as product_sales
using (productCode);


#classify the customers who bought products in 2003 into 3 groups: platinum, gold, and silver

select customerNumber,sum(priceEach*quantityOrdered) as total,
(case
	when sum(priceEach*quantityOrdered)<10000 then 'Silver' 
    when sum(priceEach*quantityOrdered) between 10000 and 100000 then 'Gold'
    when sum(priceEach*quantityOrdered)>100000 then 'Platinum'
end
)
 as customerGroup
 from orders
inner join orderdetails
using (orderNumber)
where year(shippedDate)=2003
group by customerNumber;


#classify the customers who bought products in 2003 into 3 groups: platinum, gold, and silver and then find the customers in each group

select customerGroup,count(*) from customers
inner join
(select customerNumber,sum(priceEach*quantityOrdered) as total,
(case
	when sum(priceEach*quantityOrdered)<10000 then 'Silver' 
    when sum(priceEach*quantityOrdered) between 10000 and 100000 then 'Gold'
    when sum(priceEach*quantityOrdered)>100000 then 'Platinum'
end
)
 as customerGroup
 from orders
inner join orderdetails
using (orderNumber)
where year(shippedDate)=2003
group by customerNumber
) as cg_data
using (customerNumber)
group by customerGroup;
