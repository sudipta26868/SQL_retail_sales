# Retail Sales Analysis SQL Project 
## Project OverView 

### Project Title : Retail Sales Analysis

Here, I have created this SQL project to demonstrate SQL skills and techniques. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. 

## Objectives
1) **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2) **Data Cleaning**: Identify and remove any records with missing or null values.
3) **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4) **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure
1. ### Database Setup
   - **Database Creation**: At first I create a database named 
       p1_retail_db.
   - **Table Creation**: After the database creation I cretaed a table named retail_sale to store the sales data . The table structure includes columns 
       for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), 
       and total sale amount.

```sql
CREATE DATABASE p1_retail_db;
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
```
  2. ### Data Exploration & cleaning
      - **Record Count**: Determine the total number of records in 
        the dataset.
      - **Customer Count**: Find out how many unique customers are 
        in the dataset.
      - **Category Count**: Identify all unique product categories 
        in the dataset.
      - **Null Value Check**: Check for any null values in the 
        dataset and delete records with missing data.


```sql
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

-- need to delete null values --
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
```

3. ### Data Analysis & Findings
   **1) Write a query to retrieve all columns for sales made on '2022-11-05'**
   ```sql
        SELECT * FROM RETAIL_SALE
        WHERE sale_date = '2022-11-05';
   ```
   **2) write a query to find all transactions where category is 'clothing' & the quantity sold is more than 4 in nov - 2022'**
```sql
        select * from retail_sale
        where category = 'Clothing' and TO_CHAR(sale_date, 'yyyy-mm') = '2022-11' and quantiy >= 4;
```
   **3) Calculate the total sales for each category**
```sql	
        select category,sum(total_sale) from retail_sale
        group by category;
```
  **4) write a query to find the avg. age of customers who purchased items from the 'Beauty' category**
  ```sql
	select category ,round(avg(age)) from retail_sale
	where  category = 'Beauty'
	group by category ;
```
  **5) write a sql query to find all transactions where total_sale is greater than 1000** 
```sql
	select * from retail_sale
	where total_sale >=1000;
```
  **6) write a sql query to find the total number of transactions (transaction_id) made by each gender in each category**
```sql
	select category , gender , count(transactions_id) from retail_sale
	group by gender , category
	order by 1;
```
  **7) Calulate the avg sale for each month . find out best selling month in each year** 
```sql
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

```
  **8) write a sql query to find the top 5 customers based on the highest total sale**
```sql
	select customer_id,sum(total_sale) as highest_sale from retail_sale
	group by customer_id 
	order by highest_sale desc
	limit 5;
```
  **9) write a sql query to find the number of unique customers who purchased items from each category**
```sql
	select count(distinct customer_id) , category from retail_sale
	group by category
```
  **10) Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):**
```sql
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

```

4) ### Reports
   -**Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
   -**Trend Analysis**: Insights into sales trends across different months and shifts.
   -**Customer Insights**: Reports on top customers and unique customer counts per category.


