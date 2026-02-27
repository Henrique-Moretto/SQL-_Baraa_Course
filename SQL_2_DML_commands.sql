select * from customers

insert into customers (id, first_name, country, score)
values 
	(6, 'Anna', 'USA', null),
	(7, 'Sam', Null, 100)

insert into customers
values (8, 'Andreas', 'Germany', null)

insert into customers (id, first_name)
values (10, 'Sahra')

-- insert data fro the table 'customers' into 'persons'

create table persons (
	id int not null,
	person_name varchar(50) not null,
	birth_date date,
	phone varchar(15) not null,
	constraint pk_persons primary key (id)
) 

insert into persons (id, person_name, birth_date, phone)
select
	id,
	first_name,
	null,
	'Unknown'
from customers

select * from persons

-- change score of custumer with id 6 to 0

select * from customers

update customers
set score=0
where id=6

select * from customers where id=6

update customers
set id=9
where id=10

-- change score of customer 9 to 0 and update the country to UK

update customers
set score=0, country='UK' 
where id=9

-- update all customer with null score by setting to 0

insert into customers 
values (10, 'Max', 'USA', null)

update customers
set score=0
where score is null

select * from customers where score is null

-- delete all customers with id > 5

delete from customers
where id>5

select * from customers where id >5

-- delete all data frm table persons

-- dele from persons ( SLOW )
truncate table persons

select * from persons
