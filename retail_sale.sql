create table retail_sale
(
		transactions_id	INT,
		sale_date	date,
		sale_time	time,
		customer_id	 int,
		gender	varchar(10),
		age	int,
		category varchar(20),	
		quantiy	int,
		price_per_unit	float,
		cogs	float,
		total_sale float

)
-- see the total data --
SELECT * FROM retail_sale ;

-- count the total number of rows --
select count(*) from retail_sale ;

-- need to check if there is any null values present --
select * from retail_sale 
where transactions_id is null 
      or sale_date is null
	  or sale_time is null
	  or gender is null
	  or category is null
	  or quantiy is null
	  or cogs is null
	  or total_sale is null;

delete from retail_sale 
where transactions_id is null 
      or sale_date is null
	  or sale_time is null
	  or gender is null
	  or category is null
	  or quantiy is null
	  or cogs is null
	  or total_sale is null;

-- how many unique costomers we have --
select count(distinct customer_id) from retail_sale

-- how many unique category we have --
select count(distinct customer_id) as total_sale from retail_sale

-- DATA ANALYSIS & BUSINESS KEY PROBLEMS --
-- 1) WRITE A QUERY TO RETRIEVE ALL COLUMNS FOR SALES MADE ON '2022-11-05'--
SELECT * FROM RETAIL_SALE
WHERE sale_date = '2022-11-05'
;

-- write a query to find all transactions where category is 'clothing' & 
-- the quantity sold is more than 4 in nov - 2022'

select * from retail_sale
where 
   category = 'Clothing' 
   and TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
   and quantiy >= 4;

-- Calculate the total sales for each category --
select category,sum(total_sale)
from retail_sale
group by category;

--write a query to find the avg. age of customers who purchased items from the 'Beauty' category
select category ,round(avg(age)) from retail_sale
where  category = 'Beauty'
group by category ;

-- write a sql query to find all transactions where total_sale 
-- is greater than 1000
select * from retail_sale
where total_sale >=1000;

-- write a sql query to find the total number of transactions (transaction_id)
-- made by each gender in each category

select category , gender , count(transactions_id) from retail_sale
group by gender , category
order by 1;

-- Calulate the avg sale for each month . find out best selling month in each year 

select avg(total_sale),extract(year from sale_date) as year from retail_sale
group by year;

select avg(total_sale),to_char(sale_date,'mm') as month from retail_sale
group by month

select year,month,avg_sale from 
	(select avg(total_sale) as avg_sale, extract (month from sale_date) as month ,
	extract(year from sale_date) as year ,
	rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rank
	from retail_sale
	group by month , year) as t1
where rank = 1 ; 


--write a sql query to find the top 5 customers based on the highest total sale

-- write a sql query to find the top 5 customers based on the highest total sale
select customer_id,sum(total_sale) as highest_sale from retail_sale
group by customer_id 
order by highest_sale desc
limit 5;

-- write a sql query to find the number of unique customers 
-- who purchased items from each category

select count(distinct customer_id) , category from retail_sale
group by category

-- Write a SQL query to create each shift and number of orders 
-- (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

with hourly_sale
as (
select * ,
case 
  when extract(hour from sale_time)<=12 then 'Morning'
  when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
  else 'Evening'
  end as shift
from retail_Sale 
) 
select shift,count(*) as total_orders
from hourly_sale
group by shift 





