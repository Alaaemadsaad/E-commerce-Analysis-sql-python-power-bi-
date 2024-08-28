
----Total number of invoices =99067 assuming invoices = no of items per order 
select  sum(quantityordered) as Total_no_of_invoices 
from sales_data_sample
----Total number of invoices/ assuming invoices = 307 no of orders (bills)
select  count(DISTINCT ordernumber) as Total_no_of_invoices 
from sales_data_sample

-----unique customers =92 
select  count(DISTINCT customername)
from sales_data_sample 
---unique product category =7
select count( Distinct productline)uniqueproductcategory 
from sales_data_sample 
---/////  Basic summary statistics ////----
-----Total sales amount = 10032628.85
select  SUM(sales)  Totalsales 
from sales_data_sample

---average order value =32679.57280130293
select  (sum(sales)/COUNT(DISTINCT ordernumber)) Averageordervalue 
from sales_data_sample


----the most frequant purchased items -------
select productline, count(ordernumber) 
from sales_data_sample
group by productline
order by 2 DESC

-----Exploring purchased pattern by country (demographic info)-----

---BY country 
select country , sum(sales)  total_sales 
from sales_data_sample
group by country 
order by 2 desc
limit 5
----by territory 

select territory, sum(sales)  total_sales 
from sales_data_sample
group by territory
order by 2 desc
----by city for the 5 highest sales country 
select city, sum(sales)  total_sales 
from sales_data_sample
where country in  (  'USA' ,'Spain','France','Australia','UK'  )     
group by city
order by 2 desc 
------------------------------------------------------------------------------------------------------
-----customer purchased pattern ---------
------------top 5 customer purchased contact names and numbers 
select customername ,contactfirstname||' '|| contactlastname  contact_name ,replace(phone, '-','') ,sum(sales) total_sales 
from sales_data_sample
group by customername
order by 2 Desc 
limit 5

-------------------order status for orders --------
select status  ,count (DISTINCT ordernumber) number_of_orders 
from sales_data_sample
group by status 
order by 2 Desc 
----------Data time distribution --------------------------------------------------------------
----------which year had the most sales = 2004 then 2003 then 2005 ------
select year_id , sum(sales) total_sales 
from sales_data_sample
group by year_id
order by 2 DESC


---------which month had most sales = november ------------
select month_id , sum(sales) total_sales 
from sales_data_sample
group by month_id
order by 2 DESC
-------Which Product Was More Demandable in 2004 ?  classic cars ---
select productline , count (productcode)
from sales_data_sample
where year_id = 2004 
GROUP by 1
order by 2 DESC

-------Which Product Was More Demandable in 2003 ? classic cars  ----
select productline , count(productcode)
from sales_data_sample
where year_id = 2003
GROUP by 1
order by 2 DESC

----------Dealsize    , Medium size deals have the highiest sales amount ---------------
select dealsize ,COUNT(distinct customername) NO_customers ,COUNT(distinct ordernumber) ,sum(sales)
from sales_data_sample
group by dealsize
order by 4 desc







