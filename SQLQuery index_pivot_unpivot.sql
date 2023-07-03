use DB_TESTING
--index
--indexes is used to retrive the data from database more quickely or faster than anything.
--user can not see the indexes but they are used to speed up the searches.

--syntax
create index IX_Index_name
on table_name(col1,col2,....coln)

create table INDEX_TEST(IID int,NAME varchar(20))

--how to find out indexes on wich column of table.
sp_helpindex INDEX_TEST

select * from INDEX_TEST

--how to drop indexes
--syntax: 
drop index table_name.IX_Index_name

drop index index_test.IX_INDEX

drop table INDEX_TEST

--two types of indexes
--1.unique, clustered index
--2.non-unique, non-clustered index

--1.unique, clustered index     --as like dictionary
--syntax
--create clustered index IX_Index_name
--on table_name(columns.......)

create clustered index IX_INDEX
on INDEX_TEST(IID)

--2.non-clustered index     --as like book
--syntax
--create nonclustered index IX_Index_name
--on table_name(col1,col2.......coln)


--pivot and unpivot

--pivot (columns to rows)
--is a sql operator which can be used to extract unique values from one column into multiple columns

create table product(Vendor varchar(20),state varchar(20),sales int)
insert into product values ('Amit','MH',200),('Sumit','KA',300),
                           ('Rohit','TN',250),('Amit','KA',450),
						   ('Sumit','MH',620),('Rohit','KA',150),
						   ('Amit','TN',260),('Sumit','KA',520),
						   ('Rohit','TN',300)
insert into product values ('Sumit','MH',140)

--pivot operation
select Vendor,MH,KA,TN from product
pivot
(
           sum(sales)
		   for state
		   in (MH,KA,TN)
) as pivottable

--using group by
select vendor,state,sum(sales) as totalsales from product
group by Vendor,state
order by Vendor,state

--unpivot (row<multiple columns> into one column)

create table sales(Vendor varchar(20),MH int,KA int,TN int)
insert into sales values ('Amit',200,450,260),('Rohit',NULL,150,550),('Sumit',760,820,NULL)
select * from sales

select vendor,state,salesamount from sales
unpivot
(
           salesamount
		   for state
		   in (MH,KA,TN)
) as unpivottable

select * from INFORMATION_SCHEMA.TABLES


