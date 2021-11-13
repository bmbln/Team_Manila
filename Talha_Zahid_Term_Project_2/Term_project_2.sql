drop schema if exists DE_term_project2;
create schema DE_term_project2;
use DE_term_project2;

drop table if exists suicide;
create table suicide
(Indicator_code varchar(50),
Indicator varchar(50),
Value_type varchar(50),
Region_code varchar(50),
Region_name varchar(50),
Location_type varchar(50),
Country_code varchar(50),
Country_name varchar(500),
period_type varchar(500),
Year integer,
is_latest_year varchar(500),
Dim1_type varchar(500),
Gender varchar(10),
Dim1_value_code varchar(500),
Dim2 varchar(500),
Age_group varchar(50),
Dim2_value_code varchar(500),
Dim3_type varchar(500),
Dim3 varchar(500),
Dim3_value_code varchar(500),
Data_source_dim varchar(500),
Data_source varchar(500),
Fact_value_prefix varchar(500),
suicide_rate_per_100k_people varchar(50),
Fact_value_uom varchar(500),
Fact_value_numeric_low_prefix varchar(500),
lower_bound varchar(50),
Fact_value_numeric_high_prefix varchar(500),
upper_bound varchar(50),
value varchar(500),
Fact_value_transaction_id varchar(500),
Fact_comments varchar(500),
Language varchar(500),
Date_recorded varchar(50));

load data infile 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/suicide.csv'
into table suicide
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines 
(@Indicator_code, @Indicator, @Value_type, Region_code, Region_name, @Location_type,
Country_code, Country_name, @period_type, Year, @is_latest_year, @Dim1_type, Gender,
@Dim1_value_code, @Dim2, Age_group, @Dim2_value_code, @Dim3_type, @Dim3,
@Dim3_value_code, @Data_source_dim, @Data_source, @Fact_value_prefix,
suicide_rate_per_100k_people, @Fact_value_uom, @Fact_value_numeric_low_prefix, 
lower_bound, @Fact_value_numeric_high_prefix,upper_bound, @value,
@Fact_value_transaction_id, @Fact_comments, @Language, Date_recorded);

select * from suicide;


alter table suicide
	drop column indicator_code, drop column indicator,
    drop column value_type, drop column location_type, drop column period_type,
    drop column is_latest_year, drop column dim1_type, drop column dim1_value_code, drop column dim2,
    drop column dim2_value_code, drop column dim3_type, drop column dim3, drop column dim3_value_code, 
    drop column data_source_dim, drop column data_source, drop column fact_value_prefix,
    drop column fact_value_uom, drop column fact_value_numeric_low_prefix,
    drop column fact_value_numeric_high_prefix, drop column value,
    drop column fact_value_transaction_id, drop column fact_comments, drop column language;

select * from suicide;