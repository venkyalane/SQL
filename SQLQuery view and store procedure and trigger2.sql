--simple tables
select * from viewtest
select * from viewtest1
--create view
create view vjoinDetails
as
select a.VID,b.FirstName,b.LastName,b.Loc from viewtest a join viewtest1 b on a.VID =b.VID
--fetch viewtable
select * from vjoinDetails

insert into viewtest1 values (17,'ajit','pawar','wai',5)
alter view vjoinDetails
as
select VID,FirstName,LastName,Loc from viewtest1

--sp store procedure

select * from student

--create store procedure without parameter
create proc spStudentDetailes
as
begin
        select * from student

end
--execute  sp
spStudentDetailes

sp_helptext spStudentDetailes

--we can use multiple select statement

create proc spTwoTableDetailes
as
begin
        select * from student
		select * from viewtest
end

spTwoTableDetailes
--create sp with parameter
create proc additions(@x int,@y int )
as
begin

declare @additions int
set @additions = @x + @y

print 'additions of two number = '+ cast(@additions as varchar)

end
addition 10,20
spCalculator 50,5
additions 10,20

--trigger for insert
create trigger tr_test_insert
on emp
for insert
as
begin
        select * from inserted
end

select * from emp

insert into emp values (7,'meena',7000,'F')
--trigger for delete
delete emp where EID= 7
--trigger for update
update emp set E_name='mohit',salary=5000 where EID=5
--syntax--
create trigger tr_test_update
on emp
for update
as
begin
           select * from deleted
		   select * from inserted

end

update emp set E_name='sonal',salary=9000 where EID=5
select * from recordinfo

