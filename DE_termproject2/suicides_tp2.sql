-- DE Term project 2
-- Suicide rates 

-- create schema suicides
create schema suicides;
use suicides;

-- create table suicides
drop table if exists suicides;
create table suicides (
country varchar(40) not null,
year int not null,
sex varchar(10) not null,
age varchar(20),
suicides_no int,
population int);

 
-- load data into table suicides
load data infile '/tmp/who_suicide_statistics.csv'
into table suicides
fields terminated by ','
lines terminated by '\n'
ignore 1 lines
(country,
year,
sex,
age,
@suicides_no,
@population)
SET
suicides_no = nullif(@suicides_no,''),
population = nullif(@population,'');

-- check table suicides
select * from suicides; 

-- create view with table where year = 2015 and age group
DROP VIEW IF EXISTS suicides_2015_ages;
CREATE VIEW suicides_2015_ages AS
SELECT country, 
	   year, 
       age,
       suicides_no as number_of_suicides
       FROM suicides
	   WHERE (year = 2015)
       ORDER BY country;
       
select * from suicides_2015_ages;

-- create view with table where year = 2015 and no age group
drop view if exists suicides_2015;
create view suicides_2015 as
select country, 
	   year,
       sum(suicides_no) as number_of_suicides
       from suicides
	   where (year = 2015)
       group by country
       order by country;
       
select * from suicides_2015;



