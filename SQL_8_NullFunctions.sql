use SalesDB;

-- NULL FUNCTIONS

-- ISNULL( value, replacement_value ): replace a NULL with a specific value

-- COALESCE( value1, value2, value3, ... ): returns the first non-null value from a list

-- find the average scores of the customers

select 
--CustomerID, Score
avg(isnull(Score, 0)) as avg_score
from Sales.Customers;

select 
CustomerID, Score,
coalesce(Score, 0) Score2,
avg(isnull(Score, 0)) over() as avg_score
from Sales.Customers;

-- display the full name of customers in a single field 
-- and add 10 bonus points to each customers score

select CustomerID, FirstName, LastName, Score,
		FirstName + ' ' + isnull(LastName,'') as FullName,
		isnull(Score,0)+10 as BonusScore
from Sales.Customers;

-- sort the customers from lowest to highest scores
-- with nulls appearing last

select CustomerID, FirstName, Score
from Sales.Customers
order by Score asc;

select CustomerID, FirstName, Score
		--, case when score is null then 1 else 0 end Flag
from Sales.Customers
order by case when score is null then 1 else 0 end, Score ;

select CustomerID, FirstName, Score, Score+50 ,isnull(Score,0)+50 as AddScore2
from Sales.Customers;

-- NULLIF( value1, value2 ): compare two expressions return (NULL if equal, FirstValue if not equal)

-- find the sales price for each order by divinding sales by quantity

select o.OrderID, o.ProductID, o.Sales, o.Quantity, o.Sales/nullif(quantity,0) as PrieceDiv, p.Price
from Sales.Orders as o
join Sales.Products as p
on o.ProductID = p.ProductID;

-- IS NULL: return true if the value is null
-- IS NOT NULL: returns true if the value is not null

-- identify the customers who have no scores

select * from Sales.Customers
where score is null;

-- list all csutomers who have score

select * from Sales.Customers
where Score is not null;

-- list all details for customers who have not placed any orders

select c.*, o.OrderID from Sales.Customers as c
left join Sales.Orders as o
on c.CustomerID = o.CustomerID
where OrderID is null;

-- data policies

with Orders as (
select 1 Id, 'A' Category union
select 2, null union
select 3, '' union
select 4, ' ')
select *, datalength(Category) from Orders;

with Orders as (
select 1 Id, 'A' Category union
select 2, null union
select 3, '' union
select 4, ' ')
select *, trim(Category) Policy1, 
		datalength(Category) as CategotyLen, 
		datalength(trim(Category)) Policy1Len 
from Orders;

with Orders as (
select 1 Id, 'A' Category union
select 2, null union
select 3, '' union
select 4, ' ')
select *, trim(Category) Policy1, 
		datalength(Category) as CategotyLen, 
		datalength(trim(Category)) Policy1Len 
from Orders;

with Orders as (
select 1 Id, 'A' Category union
select 2, null union
select 3, '' union
select 4, ' ')
select *, trim(Category) Policy1, nullif(trim(Category),'') Policy2,
		datalength(Category) as CategotyLen, 
		datalength(trim(Category)) Policy1Len,
		datalength(nullif(trim(Category),'')) Policy2Len
from Orders;

-- using only default value 'unknown' and avoid null, empty strings and blanks

with Orders as (
select 1 Id, 'A' Category union
select 2, null union
select 3, '' union
select 4, ' ')
select *, trim(Category) Policy1, nullif(trim(Category),'') Policy2,
		coalesce(nullif(trim(Category),''), 'Unknown') Policy3
		--datalength(Category) as CategotyLen, 
		--datalength(trim(Category)) Policy1Len,
		--datalength(nullif(trim(Category),'')) Policy2Len
from Orders;