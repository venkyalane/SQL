 --T_SQL--
 create table viewtest (VID int, FirstName varchar(20), LastName varchar(20), Loc varchar(20));

 insert into viewtest values (1,'A','B','AB')
 insert into viewtest values (2,'C','D','CD')
 insert into viewtest values (3,'E','F','EF')
 insert into viewtest values (4,'G','H','GH')
insert into viewtest values (5,'I','J','IJ')

create table viewtest1 (VID1 int, FirstName varchar(20), LastName varchar(20), Loc varchar(20), VID int);


 insert into viewtest1 values (11,'Amit','Verma','Pune',1)
  insert into viewtest1 values (12,'Sumit','Sharma','Delhi',2)
   insert into viewtest1 values (13,'Rohit','Patil','Sangli',3)
      insert into viewtest1 values (14,'Mohit','Thakur','Jaipur',6)
	     insert into viewtest1 values (15,'Sohan','Pawar','Indor',7)

--how to create view

create view vjoinDetails
as
select a.VID,b.FirstName,b.LastName,b.Loc from viewtest a join viewtest1 b on a.VID =b.VID 

--fetch vjoinDetails

select * from vjoinDetails

--script inside a view--

SP_HelpText vjoinDetails

--Drop a view--

drop view vjoinDetails

create view vViewdetails
as
select VID1,FirstName,Loc from viewtest1 

--view
select * from vViewDetails

--Insert the values inside view-- for view

insert into vViewDetails values (16,'Kumar','Nasik')

--table
select * from viewtest1 
--table insertion
insert into viewtest1 values (17,'Ajit','Pawar','Wai',5)

--Alter view
Alter view vViewDetails
as
select VID1 ,FirstName,lastname,Loc from viewtest1 

--Update view

update vViewDetails set LastName='visvas' where VID1=16

select * from vViewDetails
select * from viewtest1 

-->inside a view we can have only one SELECT statement
-->if we use two statement then it will through an exception
-->Exception: Incorrect syntax near the keyword 'select'.

create view vTwoselect
as
select * from viewtest 

select * from vTwoselect



-->Store procedure(SP)--
--It is block of code to perform certain action , whenever it is needed.
--It works like function

--SP_HELP - this is used to identify structure of table.

--We can create two types of store procedure 
--1.Without parameter
--2.With parameter

--Syntax:
--CREATE PROCEDURE /PROC sp_STORE_PROCEDURE_NAME
--[(@parametrs) <data type>  <size>]  --optinal
--As
--BEGIN

--		SQL Script

--END

--1.Without Parameter


create table student (S_ID int,FirstName varchar(20),LastName varchar(20),Loc varchar(20))

insert into student values (11,'Amit','Verma','Pune')
insert into student values (12,'Sumit','Sharma','Delhi')
insert into student values (13,'Rohit','Patil','Sangali')
insert into student values (14,'Mohit','Thakur','Jaipur')
insert into student values (15,'Sohan','Pawar','Indor')


--SP creation
create proc spStudentDetails
As
begin

	select * from student

END

--Q.How to execute SP?
--1.
spStudentDetails
--2
exec spStudentDetails
--3.
execute spStudentDetails


--Q.How to view script from SP?
SP_helptext spTwoTableDetails


--We can use multiple SELECT statemnets inside SP.
create proc spTwoTableDetails
As
begin

	select * from student
	select * from viewtest
END


spTwoTableDetails


--2.With Parameter
create procedure Addition(@x int,@y int)
as 
begin

declare @addition int
set @addition = @x + @y

print 'Addition of two numbers = ' +  cast(@addition as varchar)

END 

Addition 10,20
addition 20,10
addition 120,450

--Simple Calculator
create proc spCalculator(@a int ,@b int)
as
begin

declare @add int
declare @Sub int
declare @Mul int
declare @Div int

set @add = @a + @b
set @Sub = @a - @b
set @Mul = @a * @b
set @Div = @a / @b

print 'Sum of two numbers = ' + cast (@add as varchar)
print 'Substraction of two numbers = ' + cast (@sub as varchar)
print 'multiplication of two numbers = ' + cast (@mul as varchar)
print 'Division of two numbers = ' + cast (@div as varchar)

END


spCalculator 50,5


--Diffrence between views and SP
--View														Store Procedure(SP)
--1.Views does not accepts parameters.						1.SP accepts parameters.
--2.Views can contain only one SELECT staments.				2.SP can contains several SELECT statements.
--3.Not requied any space									3.SP required storage
--4.Views acts as virtual table								4.SP acts as function.
--5.By using views we can't perform modification			5.By using SP we can modify one or more tables at a time.
--  to multiple tables at once
