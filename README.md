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
      - ####Record Count: Determine the total number of records in 
        the dataset.
      - ####Customer Count: Find out how many unique customers are 
        in the dataset.
      - ####Category Count: Identify all unique product categories 
        in the dataset.
      - ####Null Value Check: Check for any null values in the 
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







