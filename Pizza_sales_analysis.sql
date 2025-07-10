Select * from pizza_sales;

select Sum(total_price) as Total_revenue
from pizza_sales;

select sum(total_price) / count(distinct order_id) as Total_average_sales
from pizza_sales;

Select distinct Count(order_id) as Total_orders
from pizza_sales;

Select Sum(quantity) as Total_pizza_sold
from pizza_sales;

select cast(sum(quantity)/ count(distinct order_id) as decimal(10,2)) as Average_pizza_per_order
from pizza_sales;


update pizza_sales
set order_date = str_to_date (order_date, '%d-%m-%Y');

select dayname(order_date) as Day, sum(quantity) Orders
from pizza_sales
group by dayname(order_date)
order by sum(quantity) asc;

select monthname(order_date) as month, sum(quantity) Orders
from pizza_sales
group by monthname(order_date)
order by sum(quantity);

select pizza_category, sum(quantity)
from pizza_sales
group by pizza_category
order by sum(quantity);

select 
pizza_category, sum(total_price) *100/ 
(
select sum(total_price) 
from pizza_sales) as percentage_of_sales
from pizza_sales
group by pizza_category;
;

with total_category_price as (
	select 
		pizza_category, 
		sum(total_price) as Sales
	from pizza_sales
	group by pizza_category
),
percentage_of_sales_by_category as(
	select 
        pizza_category,
        sales,
		cast(sales *100/ (select sum(sales) from total_category_price) as decimal(10,2)) as PCT
	from total_category_price)
select*
from percentage_of_sales_by_category ;


Select pizza_size, sum(total_price) as total_sales, sum(total_price) * 100/
(select sum(total_price) from pizza_sales) as PCT from pizza_sales
group by pizza_size;

select pizza_category, sum(total_price) as total_sales
from pizza_sales
group by pizza_category;

select pizza_name,cast(sum(total_price)as decimal(10,2)) as revenue, 
Sum(quantity) as total_quantity, 
Count(distinct order_id) as total_order
from pizza_sales
group by pizza_name
order by revenue desc
limit 5
;

select pizza_name,cast(sum(total_price)as decimal(10,2)) as revenue, 
Sum(quantity) as total_quantity, 
Count(distinct order_id) as total_order
from pizza_sales
group by pizza_name
order by revenue asc
limit 5;




