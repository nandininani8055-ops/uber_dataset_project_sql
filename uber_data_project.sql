-- =========================================================
--             UBER TRIP DATA ANALYSIS PROJECT
-- =========================================================

-- =========================================================
-- DATABASE SETUP
-- =========================================================

-- create a new database for storing uber trip data
create database uber;

-- display all available databases
show databases;

-- view all tables in the current database
show tables;

-- display complete uber dataset
select * from `uberdataset (1)`;

-- =========================================================
-- DATA CLEANING
-- =========================================================

-- summary:
-- before analysis, check the dataset for missing values
-- and ensure the data is clean and consistent.

-- view dataset
select * from `uberdataset (1)`;

-- total number of records
-- insight: shows the total trips available for analysis
select count(*) as totaltrips from `uberdataset (1)`;

-- =========================================================
-- NULL VALUE ANALYSIS
-- =========================================================

-- summary:
-- identify missing values in every column before cleaning.

select
count(*) as total_rows,
count(start_date) as nonnull_start_date,
count(*)-count(start_date) as null_start_date,
count(end_date) as nonnull_end_date,
count(*)-count(end_date) as null_end_date,
count(category) as nonnull_category,
count(*)-count(category) as null_category,
count(start) as nonnull_start,
count(*)-count(start) as null_start,
count(stop) as nonnull_stop,
count(*)-count(stop) as null_stop,
count(miles) as nonnull_miles,
count(*)-count(miles) as null_miles,
count(purpose) as nonnull_purpose,
count(*)-count(purpose) as null_purpose
from `uberdataset (1)`;

-- check null values individually
select count(*) from `uberdataset (1)` where purpose is null or purpose='';
select count(*) from `uberdataset (1)` where start_date is null or start_date='';
select count(*) from `uberdataset (1)` where end_date is null or end_date='';
select count(*) from `uberdataset (1)` where category is null or category='';
select count(*) from `uberdataset (1)` where start is null or start='';
select count(*) from `uberdataset (1)` where stop is null or stop='';
select count(*) from `uberdataset (1)` where miles is null or miles='';

-- =========================================================
-- HANDLE MISSING VALUES
-- =========================================================

-- summary:
-- replace null values with meaningful defaults
-- to improve data quality.

set sql_safe_updates=0;

update `uberdataset (1)` set purpose='not specified' where purpose is null or purpose='';
update `uberdataset (1)` set end_date=current_timestamp() where end_date is null or end_date='';
update `uberdataset (1)` set category='not specified' where category is null or category='';
update `uberdataset (1)` set stop='not specified' where stop is null or stop='';
update `uberdataset (1)` set start='not specified' where start is null or start='';

select * from `uberdataset (1)`;

-- =========================================================
-- EXPLORATORY DATA ANALYSIS (EDA)
-- =========================================================

-- summary:
-- analyze travel patterns, trip distances,
-- destinations and business insights.

-- total uber trips
-- insight: shows the overall number of trips.
select count(*) as totaltrips from `uberdataset (1)`;

-- total miles travelled
-- insight: calculates the cumulative travel distance.
select sum(miles) as total_miles from `uberdataset (1)`;

-- average trip distance
-- insight: finds the typical distance travelled per trip.
select avg(miles) as avg_miles from `uberdataset (1)`;

-- longest trip
-- insight: identifies the maximum trip distance.
select max(miles) as longest_trip from `uberdataset (1)`;

-- shortest trip
-- insight: identifies the minimum trip distance.
select min(miles) as shortest_trip from `uberdataset (1)`;

-- business vs personal trips
-- insight: compares trip categories.
select category,count(*) as total from `uberdataset (1)` group by category;

-- categories with more than one trip
-- insight: filters frequently occurring categories.
select category,count(*) as total from `uberdataset (1)` group by category having count(*)>1;

-- most common trip purpose
-- insight: identifies the most frequent travel reason.
select purpose,count(*) as total from `uberdataset (1)` group by purpose order by total desc limit 2;

-- top 10 trip purposes by total distance
-- insight: shows which purposes cover the highest miles.
select purpose,sum(miles) as total_miles from `uberdataset (1)` group by purpose order by total_miles desc limit 10;

-- top 5 most visited destinations
-- insight: identifies the most popular drop locations.
select stop,count(*) as total from `uberdataset (1)` group by stop order by total desc limit 5;

-- most frequent pickup locations
-- insight: identifies the busiest pickup points.
select start,count(*) as total from `uberdataset (1)` group by start order by total desc limit 5;

-- average distance by purpose
-- insight: compares average trip distance across purposes.
select purpose,avg(miles) as avg_distance from `uberdataset (1)` group by purpose order by avg_distance;

-- trips longer than average
-- insight: highlights trips above the overall average distance.
select purpose from `uberdataset (1)` where miles>(select avg(miles) from `uberdataset (1)`);

-- =========================================================
-- WINDOW FUNCTIONS
-- =========================================================

-- summary:
-- use window functions to analyze trends,
-- rankings and sequential trip patterns.

-- running total of miles
-- insight: shows cumulative distance over time.
select start_date,miles,sum(miles) over(order by start_date) as running_total from `uberdataset (1)`;

-- rank trips by distance
-- insight: ranks trips from longest to shortest.
select start_date,miles,rank() over(order by miles desc) as trip_rank from `uberdataset (1)`;

-- compare current trip with next trip
-- insight: compares each trip distance with the following trip.
select start_date,miles,lead(miles) over(order by start_date) as next_trip from `uberdataset (1)`;

-- compare current trip with previous trip
-- insight: compares each trip distance with the previous trip.
select start_date,miles,lag(miles) over(order by start_date) as previous_trip from `uberdataset (1)`;

-- divide trips into four distance groups
-- insight: classifies trips into quartiles from longest to shortest.
select miles,ntile(4) over(order by miles desc) as distance_quartile from `uberdataset (1)`;

-- =========================================================
-- CASE STATEMENTS
-- =========================================================

-- summary:
-- classify data into meaningful groups.

-- categorize trips based on distance
-- insight: classifies trips as short, medium or long.
select miles,
case
when miles<5 then 'short trip'
when miles between 5 and 20 then 'medium trip'
else 'long trip'
end as trip_category
from `uberdataset (1)`;

-- replace null purpose while displaying results
-- insight: displays readable values without changing original data.
select purpose,case when purpose is null then 'not specified' else purpose end as updated_purpose from `uberdataset (1)`;

-- =========================================================
-- CORRELATED SUBQUERY
-- =========================================================

-- summary:
-- compare each trip with the average of its own category.

-- trips above category average
-- insight: identifies trips that exceed the average distance within their category.
select * from `uberdataset (1)` u1 where miles>(select avg(miles) from `uberdataset (1)` u2 where u1.category=u2.category);

-- =========================================================
-- PROJECT SUMMARY
-- =========================================================
-- ✔ cleaned missing values
-- ✔ analyzed trip distance and travel patterns
-- ✔ identified popular pickup and drop locations
-- ✔ compared business and personal travel
-- ✔ used aggregate functions, case statements,
--   subqueries and window functions
-- ✔ generated meaningful business insights from uber trip data
-- =========================================================