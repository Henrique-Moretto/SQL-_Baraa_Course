-- CASE STATEMENT
-- Evaluates a list of conditions and returns a value when the first condition is met

/* SYNTAX

CASE
	WHEN condition1 THEN result1
	WHEN condition2 THEN result2
	...
	ELSE result (optional)
END

*/

-- create a report showing total sales for each of the following categories:
-- high > 50, 20 < medium <= 50, low <= 20. Sort from highest to lowest

use SalesDB;

select OrderID, Sales,
case
	when Sales >  50 then 'High'
	when Sales > 20 then 'Medium'
	else 'Low'
end Category
from Sales.Orders
order by Sales desc;

select
Category, sum(Sales) as TotalSales
from(
	select OrderID, Sales,
	case
		when Sales >  50 then 'High'
		when Sales > 20 then 'Medium'
		else 'Low'
	end Category
	from Sales.Orders
) as t
group by Category
order by TotalSales desc;

-- Retrieve employee details with gender displayed as full text

select EmployeeID, FirstName, LastName, Gender,
case 
	when Gender = 'M' then 'Male'
	when Gender = 'F' then 'Female' 
	else 'Not Avaiable' end as GenderFullText
from Sales.Employees;

-- Retrive customers details with abbreviated country code

select distinct Country from Sales.Customers

select *,
case 
	when Country = 'Germany' then 'DE'
	when Country = 'USA' then 'US'
	else 'n/a'
end CountryAbbr,
case Country
	when 'Germany' then 'DE'
	when 'USA' then 'US'
	else 'n/a'
end CountryAbbr2
from Sales.customers;

-- Find the average scores of customers and treat NULLS as 0
-- Additionally provide details such as CustomerID and LatName

select CustomerID, FirstName, LastName, Score,
	avg(Score) over() Avg_Score,
	avg(case when Score is null then 0 else Score end) over () Avg_ClenScore,
	avg(isnull(Score,0)) over () Avg_INScore
from Sales.Customers;

-- Count how many times each customer has made an order with sales greater than 30

select CustomerID,
sum(case
	when Sales > 30 then 1
	else 0
end) HighOrders,
count(*) TotalOrders
from Sales.Orders
group by CustomerID;