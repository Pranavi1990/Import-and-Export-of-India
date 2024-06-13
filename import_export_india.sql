create database import_export_India;

use import_export_India;


create table import_export_data
(country varchar(100), `export` double,`import` double,total_trade double,trade_balance double,year_interval varchar(10));

select *
from import_export_data;


select distinct(country)
from import_export_data;  /*243 distinct country*/

/*Total import for each year*/

select round(sum(import),2) as total_import_each_year,year_interval
from import_export_data
group by year_interval;

/*Total export for each year*/

select Round(sum(export),2) as total_export_each_year,year_interval
from import_export_data
group by year_interval;

/*Import Vs Export yearwise*/

select year_interval, round(sum(import),2) as total_import,round(sum(export),2) as total_export
from import_export_data
group by year_interval;

/*Countries that accounts to largest Total Trade*/

select country,round(sum(total_trade),2) as total_trade
from import_export_data
group by country
order by sum(total_trade) desc;


/*Largest import*/
select country ,rnk
from(select country,round(sum(import),2),rank() over (order by round(sum(import),2) desc) as Rnk
from import_export_data
group by country) as temp_table
where Rnk<=10;

/*Largest export*/

select country ,rnk
from(select country,round(sum(export),2),rank() over (order by round(sum(export),2) desc) as Rnk
from import_export_data
group by country) as temp_table
where Rnk<=10;

/*Highest Trade Balance*/

select country ,total_trade_balance,rnk
from(select country,round(sum(trade_balance),2) as total_trade_balance,rank() over (order by round(sum(trade_balance),2) desc) as Rnk
from import_export_data
group by country) as temp_table
where Rnk<=10;

/*Lowest Trade Balance*/

select country,total_trade_balance,rnk
from(select country,round(sum(trade_balance),2) as total_trade_balance,rank() over (order by round(sum(trade_balance),2) asc) as Rnk
from import_export_data
group by country) as temp_table
where Rnk<=10;

/*Trade Balance for Top 10 Countries with highest total trade*/

select country,round(sum(trade_balance),2) as total_trade_balance,round(sum(total_trade),2) as total_trade
from import_export_data
group by country
order by sum(total_trade) desc
limit 10;

/*Import vs Export for Top 10 Countries with highest total trade*/

select country, round(sum(import),2) as total_import,round(sum(export),2) as total_export,round(sum(total_trade),2) as total_trade
from import_export_data
group by country
order by sum(total_trade) desc
limit 10;






select Round(sum(export),2) as total_export,round(sum(import),2) as total_import,Round(sum(export),2)-round(sum(import),2) 
from import_export_data

select round(sum(total_trade),2) as total_trade
from import_export_data


select country, sum(import)
from import_export_data
