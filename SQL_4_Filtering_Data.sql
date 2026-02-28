-- retrieve all customers from germany

select * from customers where country = 'Germany'

-- retrive all customers not from germany

select * from customers where country != 'Germany'

-- retrive all customers with a score greater than 500

select * from customers where score > 500

select * from customers
where not score <= 500

-- retrive all customers with score 500 or more

select * from customers where score >= 500

select * from customers
where not score < 500

-- retrive all customers with a score less than 500

select * from customers where score < 500

select * from customers
where not score >= 500

-- retrive all customers with score 500 or less

select * from customers where score <= 500

select * from customers
where not score > 500

-- retrieve all customers who are from USA and have a score greater than 500

select * from customers
where country = 'USA' and score > 500

-- retrieve all customers who are either from USA or have a score greater than 500

select * from customers
where country = 'USA' or score > 500

-- retrive all customers whose score falls in the range between 100 and 500

select * from customers
where score >= 100 and score <= 500

select * from customers
where score between 100 and 500

-- retrive all customers from either Germany or USA

select * from customers
where country='Germany' or country='USA'

select * from customers 
where country in ('Germany', 'USA')

-- retrive all customers not from Germany and USA

select * from customers
where country != 'Germany' and country != 'USA'

select * from customers 
where country not in ('Germany', 'USA')

-- Find all customers whose first name stars with 'M'

select * from customers
where first_name like 'M%'


-- Find all customers whose first name ends with 'n'

select * from customers
where first_name like '%n'

-- Find all customers whose first contains 'r'

select * from customers
where first_name like '%r%'

-- Find all customers whose first has 'r' in the 3rd position

select * from customers
where first_name like '__r%'