-- create a new table called 'persons' with id, person_name, birth_date and phone

create table persons (
	id int not null,
	person_name varchar(50) not null,
	birth_date date,
	phone varchar(15) not null,
	constraint pk_persons primary key (id)
) 

select * from persons

-- add a new column called email to the persons table

alter table persons
add email varchar(50) not null

select * from persons

-- remove the column phone from the persons table

alter table persons
drop column phone

select * from persons

-- delete the table persons from database

drop table persons

