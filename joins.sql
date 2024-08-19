use test;

select * from members;
select * from committees;

#inner join
#find all memebrs in committe

select m.member_id,m.name,c.committee_id,c.name from test.members m
inner join
test.committees c
ON m.member_id=c.committee_id;

select m.member_id,m.name,c.committee_id,c.name from members m
inner join
committees c
using (name);



#left join
#find all members not in committee
select m.member_id,m.name,c.committee_id,c.name from members m
left join 
committees  c
ON c.name=m.name
where c.committee_id is NULL;

select  m.member_id,m.name,c.committee_id,c.name from members m
left join 
committees  c
using (name);


#right join
#find all committee members not in members table

select * from members m
right join
committees c
on m.name=c.name
where m.member_id is NULL;

select * from members m
right join
committees c
using (name)
where m.member_id is NULL;


#cross join
select * from members m1
cross join 
members m2;

#inner join with multiple filtering
select * from customers c inner join orders o
ON  c.customerNumber=o.customerNumber and  c.customerName like "%signal%";

#cartesian join and where clause for filtering rows
select c.customerName,o.orderNumber
from customers c ,orders o
where  c.customerNumber=o.customerNumber and  c.customerName like "%signal%";

