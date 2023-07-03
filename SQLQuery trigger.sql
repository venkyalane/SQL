use DB_TESTING

--Trigger 

--syntax:
--create trigger tr_trigger_name
--on table_name
--for insert/update/delete
--as
--begin
--[sql script]
--end

create table employee(eid int, ename varchar(20),sal int,gender varchar(10))
insert into employee values (1,'Punnet',2000,'M'),(2,'Amit',3000,'M'),(3,'Sumit',4000,'M')--insert multiple records in table
select * from employee
--trigger for insert
create trigger trTest_insert
on employee
for insert
as
begin
select * from inserted
end

insert into employee values (4,'mohan',5000,'M')
select * from employee

--trigger for delete
create trigger trTest_delete
on employee
for delete
as
begin
select * from deleted
end

delete from employee where eid=4
select * from employee

--trigger for update
create trigger trTest_update
on employee
for update
as
begin
select * from deleted
select * from inserted
end

update employee set sal=6000 where eid=3

select * from INFORMATION_SCHEMA.TABLES