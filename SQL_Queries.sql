select *
from customers

select
	first_name,
	score,
	country
from customers

--customers with score > 500
select *
from customers
where score>500

--customers with score not equal to 0
select *
from customers
where score != 0

-- retrieve customers from Germany
select *
from customers
where country = 'Germany'

-- retrieve customers score ascendent
select *
from customers
order by score asc

-- retrieve customers score descendent
select *
from customers
order by score desc

-- retrive customers from country alfb and score asc/desc
select *
from customers
order by country asc, score desc

-- total score for each contry
select
	country,
	sum(score) as total_score
from customers
group by country

-- total score and total n# of customers for each contry
select
	country,
	sum(score) as total_score,
	count(id) as total_customers
from customers
group by country

-- total score for each contry with score >800
select
	country,
	sum(score) as total_score
from customers
group by country
having sum(score)>800

--every score for each country with costumers score != 0 and return only countries with an average score >0
select 
	country,
	avg(score) as avg_score
from customers
where score != 0
group by country
having avg(score)>430
order by avg(score) desc

-- unique list of all country
select distinct country
from customers

-- retrive only 3 costumers
select top 3 *
from customers 

-- retrive top 3 costumers with highest scores

select top 3 *
from customers
order by score desc

select top 2 *
from customers
order by score asc

-- 2 msot recent orders
select top 2 *
from orders
order by order_date desc

