-- create new database
-- create database personal_project_1;

-- use personal_project_1;

-- table adidas_us_sales_datasets
-- backup data
drop table if exists adidas_us_sales_datasets_copy;
create table adidas_us_sales_datasets_copy
select * 
from adidas_us_sales_datasets;

-- preprocessing

-- change column name
alter table adidas_us_sales_datasets_copy
rename column Column1 to retailer,
rename column `Adidas Sales Database` to retailer_id,
rename column column3 to invoice_date,
rename column column4 to region,
rename column column5 to state,
rename column column6 to city,
rename column column7 to product,
rename column column8 to price_per_unit,
rename column column9 to units_sold,
rename column column10 to total_sales,
rename column column11 to operating_profit,
rename column column12 to operating_margin,
rename column column13 to sales_method;

-- delete row 1-3
delete 
from adidas_us_sales_datasets_copy
limit 3;

-- remove delimiter '$', '%', ','
update adidas_us_sales_datasets_copy
set price_per_unit = replace(price_per_unit,'$','')
where left(price_per_unit,1) = '$';

update adidas_us_sales_datasets_copy
set total_sales = replace(total_sales,'$','')
where left(total_sales,1) = '$';

update adidas_us_sales_datasets_copy
set operating_profit = replace(operating_profit,'$','')
where left(operating_profit,1) = '$';

update adidas_us_sales_datasets_copy
set operating_margin = replace(operating_margin,'%','')
where right(operating_margin,1) = '%';

update adidas_us_sales_datasets_copy
set units_sold = replace(units_sold,',','')
where units_sold like '%,%';

update adidas_us_sales_datasets_copy
set total_sales = replace(total_sales,',','')
where total_sales like '%,%';

update adidas_us_sales_datasets_copy
set operating_profit = replace(operating_profit,',','')
where operating_profit like '%,%';

update adidas_us_sales_datasets_copy
set invoice_date = str_to_date(invoice_date,'%m/%d/%Y');

-- change datatype
alter table adidas_us_sales_datasets_copy 
modify column retailer_id int,
modify column invoice_date date,
modify column price_per_unit int,
modify column units_sold int,
modify column total_sales int,
modify column operating_profit int,
modify column operating_margin float;

update adidas_us_sales_datasets_copy
set operating_margin = operating_margin/100
where operating_margin <> '';

-- table uspop2021
-- backup data
drop table if exists uspop2021_copy;
create table uspop2021_copy
select *
from uspop2021
where state <> '';

-- rename column
alter table uspop2021_copy 
rename column `2021 Population` to 2021_population;
















