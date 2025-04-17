--creating table
CREATE TABLE retail (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(50),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price_per_unit NUMERIC(10,2),
    cogs NUMERIC(10,2),
    total_sale NUMERIC(10,2)
);
--Retrieve all the records from the sales table
select * from retail;


--filtering  age column with null values
select * from retail
where age is null ;


-- filtering out  age column with null values
delete from retail where age is null;


select count(*) from retail;


--Calculate the total sales amount made between  01-07-2022 and 2022-07-15
SELECT *
FROM retail
WHERE sale_date BETWEEN DATE '2022-07-01' AND DATE '2022-07-15'
order by sale_date asc;


--Count the total number of transactions in the dataset.
select count(*) as total_transaction from retail;


--List all the unique product categories available in the sales data.
select  category from retail group by category; 


--Calculate the total sales amount made on 01-07-2022.
select (total_sale) from retail where
sale_date = '2022-07-01';


--Retrieve all sales records where the customer is female
select * from retail 
where gender = 'Female';


--Find the average age of customers, grouped by gender.
select avg(age) from retail group by gender;


--Identify the top 3 product categories with the highest total sales amount.
select category, sum(total_sale) as sum_sale from retail group by category order by sum_sale desc ;


--Show the total quantity of products sold for each category.
select  category,sum(quantiy) as total_quantity from retail group by  category


--Find the number of transactions that occurred on each sale date.
select  sale_date,count(*) as number_of_transaction
from retail group by sale_date order by sale_date asc;


--Convert the sale_date in the retail table to DD-MM-YYYY format and display it as formatted_date."
SELECT TO_CHAR(sale_date, 'DD-MM-YYYY') AS formatted_date FROM retail;


--For each transaction, calculate the profit assuming profit = total_sale - cogs.
select transactions_id, (total_sale-cogs) as profit from retail;


--Show the top 5 transactions with the highest total sale value.
select * from retail order by total_sale desc limit 5;


--Find all transactions with missing quantity, price per unit, cost of goods sold, or total sale."
select * from retail where quantiy is null or price_per_unit is null or cogs is null or total_sale is null;


--Delete all rows from the retail table where quantity, price per unit, cost of goods sold, or total sale is missing
delete from retail where quantiy is null or price_per_unit is null or cogs is null or total_sale is null;


--Display the top 5 transactions with the highest total sale from the retail table."
select * from retail order by total_sale desc limit 5;


--Find the top 5 product categories with the highest average price per unit, and display them in descending order of average price."
select category , avg(price_per_unit) as average_price from retail group by category order by average_price desc limit 5;










