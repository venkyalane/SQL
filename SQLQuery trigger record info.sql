use DB_TESTING
select * from INFORMATION_SCHEMA.tables
select * from employee
sp_helptext [trTest_insert]
sp_helptext [trTest_delete]
sp_helptext [trTest_update]
drop trigger trTest_insert
drop trigger [trTest_delete]
drop trigger [trTest_update]


--we will record trigger information below table
create table record_info(id int identity,DMLUpdate varchar(300))
select * from employee
select * from record_info


--create trigger for inserted information
create trigger tr_inserted_info
on employee 
for insert
as 
begin
          declare @id int
		  select @id = eid from inserted

		  insert into record_info values ('EID'+' '+cast (@id as varchar(5)) +' '+'is inserted at'+' '+cast(getdate() as varchar(20)))
end

--create trigger for deleted information
create trigger tr_deleted_info
on employee
for delete
as 
begin
      declare @id int
	  select @id = eid from deleted

	  insert into record_info values ('EID'+' '+cast(@id as varchar(5))+' '+'is deleted at'+' '+cast(getdate() as varchar(20)))
end

--create trigger for updated information
create trigger tr_updated_info
on employee
for update
as 
begin
      declare @id int
	  select @id = eid from deleted

	  insert into record_info values ('EID'+' '+cast(@id as varchar(5))+' '+'is updated at'+' '+cast(getdate() as varchar(20)))
end

select * from employee
select * from record_info

insert into employee 
values 
         (3,'sumit',4000,'M'), 
		 (7,'dth',10000,'M'), 
		 (8,'komal',11000,'F'), 
		 (9,'swati',12000,'F'),
		 (10,'anil',13000,'M')

delete employee where eid=10
update employee set ename='dnyaneshwar' where eid=7


--cast()
--this function convert value into a specified datatype.
--syntax: cast(expression as datatype[(length)]
--Ex:
create table joining_date(jid int identity, jod datetime)
insert into joining_date values ('2017-08-15 10:43:15.463'),('2016-08-15 10:43:15.463')
select * from joining_date
select *,cast(jod as varchar) as new_jod from joining_date

--convert()
--convert value into specified data type
--syntax: convert(data_type[(length)],expression/column_name,[(style)])
--Converting datetime to character:
--Without		With 	  Input/Output					Standard
--century		century
--0				100		  mon dd yyyy hh:miAM/PM		Default
--1				101		  mm/dd/yyyy					US
--2				102		  yyyy.mm.dd					ANSI
--3	            103		  dd/mm/yyyy	                British/French
--4	            104		  dd.mm.yyyy	                German
--5				105	      dd-mm-yyyy					Italian
--6				106		  dd mon yyyy	                -
--7	            107	      Mon dd, yyyy	                -
--8	            108	      hh:mm:ss	                    -
--9	            109	      mon dd yyyy hh:mi:ss:mmmAM (or PM)	Default + millisec
--10	        110	      mm-dd-yyyy	                USA
--11			111		  yyyy/mm/dd					Japan
--12			112	      yyyymmdd						ISO
--13			113	      dd mon yyyy hh:mi:ss:mmm		Europe (24 hour clock)>
--14			114	      hh:mi:ss:mmm					24 hour clock
--20			120	      yyyy-mm-dd hh:mi:ss			ODBC canonical (24 hour clock)
--21			121	      yyyy-mm-dd hh:mi:ss.mmm		ODBC canonical (24 hour clock)
-- 				126	      yyyy-mm-ddThh:mi:ss.mmm		ISO8601
-- 				127	      yyyy-mm-ddThh:mi:ss.mmmZ		ISO8601 (with time zone Z)
-- 				130	      dd mon yyyy hh:mi:ss:mmmAM	Hijiri
-- 				131	      dd/mm/yy hh:mi:ss:mmmAM		Hijiri

--Ex:
select *,convert(varchar,jod)as new_doj from joining_date --without style
select *,convert(varchar,jod,0)as new_doj from joining_date --default 
select *,convert(varchar,jod,1)as new_doj from joining_date  --US
select *,convert(varchar,jod,2)as new_doj from joining_date   --ANSI