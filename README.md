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
1. #### Database Setup
   - **Database Creation**: At first I create a database named 
       p1_retail_db.
   - **Table Creation**: After the database creation I cretaed a table named retail_sale to store the sales data . The table structure includes columns 
       for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), 
       and total sale amount.

...sql
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
