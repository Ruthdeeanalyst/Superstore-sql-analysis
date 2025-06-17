create database Superstore_db;
select * from superstore_data_cleaned;

--- TOTAL SALES AND PROFIT
select
	round(sum(Sales), 2) AS Total_Sales,
    round(sum(Profit), 2) as TOtal_Profit
from superstore_data_cleaned;

--- MONTHLY SALES
select
	`Order Month`,
	sum(sales) as Monthly_Sales
from superstore_data_cleaned
	group by `Order Month`
	order by field(`Order Month`, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' );
    
--- TOP 10 PRODUCTS
select 
	`Product Name`,
    sum(Sales) as Total_Sales
from superstore_data_cleaned
group by `Product Name`
Order by Total_Sales desc
limit 10;

--- AVERAGE PROFIT MARGIN BY REGION
select
Region,
round(avg(`Profit Margin`), 4) as Avg_Profit_Margin
from superstore_data_cleaned
group by region;

--- MONTHLY SALES TREND
select concat(`Order Year`, '-', `Order Month`) as Month,
	round (sum(Sales), 2) as Monthly_Sales
from superstore_data_cleaned
group by `Order Year`, `Order Month`
order by `Order Year`,
			field(`Order Month`, 'Jan', 'Feb', 'Mar','Apr', 'May', 'Jun' , 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

--- TOP 5 REGIONS BY PROFIT
select Region, round(sum(profit),2) as Total_Profit
from superstore_data_cleaned
group by region
order by Total_Profit DESC
limit 5;

--- PRODUCTS WITH LOWEST PROFIT MARGINS
select `Product Name`, round(avg(`Profit Margin`), 2) as Avg_Profit_Margin
from superstore_data_cleaned
group by `Product Name`
order by Avg_Profit_margin
limit 10;

--- DISCOUNT IMPACT ON PROFIT
select Discount, round(avg(Profit), 2) as Avg_Profit
from superstore_data_cleaned
group by Discount
order by Discount;