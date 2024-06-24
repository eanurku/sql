use test;

select * from members;
select * from test.committees;

#inner join
#find all memebrs in committe

select m.member_id,m.name,c.committee_id,c.name from test.members m
inner join
test.committees c
ON m.member_id=c.committee_id;

select m.member_id,m.name,c.committee_id,c.name from test.members m
inner join
test.committees c
using (name);



#left join
#find all members not in committee
select m.member_id,m.name,c.committee_id,c.name from test.members m
left join 
test.committees  c
ON c.name=m.name
where c.committee_id is NULL;

select  m.member_id,m.name,c.committee_id,c.name from test.members m
left join 
test.committees  c
using (name);


#right join
#find all committee members not in members table

select * from test.members m
right join
test.committees c
on m.name=c.name
where m.member_id is NULL;

select * from test.members m
right join
test.committees c
using (name)
where m.member_id is NULL;



select * from test.members
cross join 
test.members;

