select * from INFORMATION_SCHEMA.tables
Create database DB_TESTING

use DB_TESTING
create table student (SID int, Sname varchar(20),City varchar(20))
insert into student (SID,Sname,City)values (5,'Meena','Hyderbad'), (2,'Rohit','Mumbai'),(3,'Sumit','Indore'),(4,'Mohit','Jaipur')

select * from student;
create table Department (DID int, Dname varchar(20),DEPTNAME varchar(20),SID int)

insert into department(DID,Dname,DEPTNAME,SID) values (15,'MBA','HR',5),(12,'MECH','Mechatronics',4),(13,'CIVIL','SOM',1),(14,'ECE','DSP',3)
select * from Department

create view vStudentDetails
as
select s1.SID,s1.Sname,s1.city,d1.deptname from student s1 join Department d1 on s1.SID=d1.SID

--Notw: in creating view always we can use only one select statement.

create view vTwoTables
as 
select * from student
select * from Department

select * from vTwoTables
select * from INFORMATION_SCHEMA.tables

insert into vStudentDetails values (7,'vikram','latur','microprocessor')

insert into vTwoTables values (7,'mohan','nagar')

update vTwoTables set Sname='savita' where SID=7

delete vTwoTables where SID=7

--to view script from view
sp_helptext vTTables

alter view vTTables
as
select * from students

--to drop view
drop view vTwoTables

--to rename 
sp_rename 'vTwoTables','vTTables'
