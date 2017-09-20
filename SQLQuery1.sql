create table Query1(Cid int constraint cns_pk primary key, cname varchar(50) not null, Balance decimal(9,2), AOD date, status Bit )

insert into Query1(Cid,cname)values(1001,'mmm')

insert into Query1(Cid,cname,Balance)values(1002,'mmm',559.20)

insert into Query1(Cid,cname,Balance,AOD,status)values(1003,'mmm',5549.20,'1991/12/1',1)

insert into Query1(Cid,cname,Balance,AOD,status)values(1004,'mmm',10559.20,'1/12/1991',1)

insert into Query1(Cid,cname,Balance,AOD,status)values(1005,'mmm',520034.20,'1991/12/1',1)

select cname,balance,cid,aod from Query1

--select * from Query1 where 11=11(must see this, interview question)(gives you hole table has a result with the data)
--select * from Query1 where 1=2(gives you no data)

--UPDATE Command

update Query1 set Balance=1000 where Cid=1001
update Query1 set AOD='12/12/1991' where Cid=1001
update Query1 set AOD='1992/12/1' where Cid=1002
update Query1 set status=0 where Cid=1001
update Query1 set cname='santosh'where cid=1001
update Query1 set cname='sai' where Cid=1001
update Query1 set cname='rahul' where Cid=1003
update Query1 set status=0 where Cid=1002
--Delete command
delete from Query1 where Cid=1004
delete from Query1 where Cid=1005

select * from Query1
------------------------------------------------------------------------------------------------------------
--Constraints(6 types-- Not null, Unique,Primary key,Foriegn key,Check,Default)

create table uni (cid int constraint Un_constraint unique,cname varchar not null,Balance decimal(9,2),status bit)
create table uni1 (cid int constraint Un_constrait unique,cname varchar(50) not null,Balance decimal(9,2),statua1 bit)
--table level
create table uni11(cid int, cname varchar(50) not null,balance decimal(5,2),status bit,constraint cid_uni unique(cid))
alter table unil add  status bit constraint con_def default 1
drop table uni,uni1

select * from uni11

insert into uni1 values(1001,'santosh',400.20,null)
insert into uni1 values(1002,'santn',2000,null)
insert into uni1 values(1003,'santosh',29002,1)

insert into uni11 values(1001,'santosh',400.20,null)
insert into uni11 values(1002,'santn',200,null)
insert into uni11 values(1003,'santosh',202,1)
insert into uni11 values(1003,'santosh',202,1)
insert into uni11 values(1004,'santosh',202,default)
--primart key

create table customerprimary(cid int constraint cid_PK primary key, cname varchar(50),status bit)

insert into customerprimary values(1001,'santosh',1)
insert into customerprimary values(1002,'santosh',1)
insert into customerprimary values(1003,'santosh',null)
insert into customerprimary values(1004,'santosh',0)
insert into customerprimary values(1005,'santosh',0)

create table customerprimary1(cid int,cname varchar(50),balance decimal(9,2),status bit,constraint cid1_PK primary key(cid))


insert into customerprimary1 values(1001,'santosh',400.20,null)
insert into customerprimary1 values(1002,'santn',200,null)
insert into customerprimary1 values(1003,'santosh',202,1)
insert into customerprimary1 values(1004,'santosh',202,1)

select * from customerprimary1

--check constriant

create table checkcustomer(cid int constraint cid121_PK primary key, cname varchar(50),balance decimal constraint bal_ch check(balance>100),status bit)

insert into checkcustomer values(1001,'santosh',120,1)
insert into checkcustomer values(1002,'santosh',1000,1)
insert into checkcustomer values(1003,'santosh',1220,1)
insert into checkcustomer values(1004,'santosh',120,1)

create table tablechekcustomer(cid int constraint cid10_PK primary key,cname varchar(50),balance decimal(9,2),status bit, constraint tck_check check(balance>=100))


insert into tablechekcustomer values(1001,'santosh',120,1)
insert into tablechekcustomer values(1002,'santosh',1000,1)
insert into tablechekcustomer values(1003,'santosh',1220,1)
insert into tablechekcustomer values(1004,'santosh',120,1)
insert into tablechekcustomer values(1005,'santosh',20,1)

select * from checkcustomer

--Default coanstriant
-- write default in insert statement to get default value in the table

create table defaultconstraint(cid int primary key, cname varchar(50),status bit constraint status_DF default 1)


insert into defaultconstraint values(1001,'santosh',0)
insert into defaultconstraint values(1002,'santosh',1)
insert into defaultconstraint values(1003,'santosh',null)
insert into defaultconstraint values(1004,'santosh',null)
insert into defaultconstraint(cid,cname,status)values(1005,'sed',1)
insert into defaultconstraint values(1006,'santosh',default)
select * from defaultconstraint

--Foriegn key

create table depart1(deptno int constraint dep_PK primary key,dname varchar(50),loc varchar(50))

insert into depart1 values(101,'social','hyderabad')
insert into depart1 values(102,'research','hyderabad')
insert into depart1 values(103,'HR','hyderabad')
insert into depart1 values(104,'BPO','hyderabad')
insert into depart1 values(108,'BPO','hyderabad')


create table emply(empid int constraint emp_PK primary key,ename varchar(50),deptno int constraint dp_FK references depart1(deptno))

insert into emply values(1001,'santosh',101)

insert into emply values(1002,'santosh',101)
insert into emply values(1003,'santosh',101)
insert into emply values(1004,'santosh',101)

insert into emply values(1005,'santosh',102)
insert into emply values(1006,'santosh',103)
insert into emply values(1007,'santosh',104)
insert into emply values(1008,'santosh',108)

select * from emply
select * from depart1

create table tableempm(empid int,ename varchar(50),deptno int,constraint emp1_PK primary key(empid),constraint depq_fk foreign key(deptno) references depart1(deptno))
insert into tableempm values(1001,'santohs',101)
insert into tableempm values(1002,'santohs',102)
insert into tableempm values(1003,'santohs',103)
insert into tableempm values(1004,'santohs',108)
insert into tableempm values(1005,'santohs',108)
select * from tableempm

 delete from depart1 where deptno=101

 update depart1 set deptno=109 where deptno=108


 create table empII(empid int,ename varchar(50),deptno int,constraint emp121_pk primary key(empid),constraint dep_FK foreign key(deptno) references depart1(deptno))

 insert into empII values(1001,'helloworld',104)
 insert into empII values(1002,'helloworld',101)
 insert into empII values(1003,'helloworld',101)

 create table empIII (emoid int primary key ,ename varchar(50),deptno int constraint depn129_FK references depart1(deptno))

  insert into empIII values(1001,'helloworld',104)
 insert into empIII values(1002,'helloworld',101)
 insert into empIII values(1003,'helloworld',101)
 insert into empIII values(1004,'helloworld',106)

 create table empIV(empid int,ename varchar(50),deptno int,constraint emp_zpk primary key(empid),constraint dt_fk foreign key(deptno) references depart1(deptno))
 insert into empIV values(1001,'santosh',101)
 insert into empIV values(1002,'santosh',101)
 insert into empIV values(1003,'santosh',108)

select * from empIV

create table def(defaultvalue int constraint def_con default 1,dname varchar(50))
insert into def values(1,'dsdr')
insert into def values(0,'km')
insert into def values(1,'krtr')

select * from def
---------------------------------------------------------------------------------------------------------
--Delete cascade

create table casc(empid int constraint empl_pk primary key, ename varchar(50),deptno int,constraint casc_FK foreign key(deptno) references depart1(deptno) on delete cascade on update set default)
insert into casc values(1001,'santosh',101)
insert into casc values(1002,'santosh',101)
insert into casc values(1003,'santosh',101)
insert into casc values(1004,'santosh',101)
insert into casc values(1005,'santosh',101)


delete from casc where deptno=101

select * from depart1

-------------------------------------------------------------------------------------------------------
--self referal integereation

create table selfin(empid int constraint self_pk primary key,ename varchar(50) not null,job varchar(50) not null,manager int constraint mn_fK foreign key(manager) references selfin(empid),deptno int constraint self_rk references depart1(deptno))

insert into selfin values(1001,'santosh','manager',1001,101)
insert into selfin values(1002,'santosh','manager',1001,102)
insert into selfin values(1003,'santosh','manager',1001,108)
insert into selfin values(1004,'santosh','manager',1002,102)

--to show superiority we can use this EG: 1001 is a boss of 1002 and 1003
-------------------------------------------------------------------------------------------------------------------------
--Identity function

create table supplier(supid int identity(101,1),supname varchar(50),loc varchar(50))

insert into supplier values('santosh','hyderabad')
insert into supplier values('santosh','hyderabad')
insert into supplier values('santosh','hyderabad')
insert into supplier values('santosh','hyderabad')
insert into supplier values('santosh','hyderabad')
insert into supplier values('santosh','hyderabad')

set identity_insert supplier on
insert into supplier(supid,supname,loc)values(103,'santosh3','jiyaguda')
delete from supplier where supid=103
select * from supplier

set identity_insert supplier off
---------------------------------------------------------------------------------------------------------------------------
--Alter

create table student(sno int,sname varchar(50))

alter table student alter column sname int
alter table student alter column sno nvarchar(50)

alter table student alter column sno int not null

insert into student values('santosh',9)
delete from student where sno='santosh'

alter table student add stulocation varchar(50) not null
alter table student add class int
alter table student add primaryy int

select * from student 

--droping column

alter table student drop column stulocation

alter table student add constraint claas_check1 check(class>6)
alter table student drop constraint claas_check

insert into student values(1,2,8,2)
insert into student values(2,2,4,1)
select * from student


delete from student where sno=1

alter table student alter column primaryy int not null

alter table student add constraint primar_ky primary key(primaryy)

--droping constraint

alter table student drop constraint primar_ky

--Renaming the table

sp_rename student,stu

--Renaming the column

sp_rename 'stu.primaryy','manager'

select * from stu

---------------------------------------------------------------------------------------------------------------------------
--FUNCTIONS

--Len
select EmployeeID,LastName,FirstName,len(firstname)as firstname from Employees
select * from Employees where LEN(firstname)=5

--ABS

select ABS(10),abs(0),ABS(-10)

--ceiling
select CEILING(15.4),CEILING(13.5),CEILING(-1.3)
--floor
select FLOOR(15.3), floor(15.4), floor(14.8)
--log
select log(10)
select pi()
select RAND() -- random value
select rand(10) -- fix value
select log(RAND())

select round(123.934,1)

select round(123.934,2)

select round(123.9346,3)

select sign(10),sign(0),sign(-10)
select SQRT(16),SQRT(4)
select ROUND(rand()*1000,0)
select round(RAND()*10,0)

--string functions

select ASCII('A'),ASCII('helllo')
select CHAR(65)
select nchar(650),NCHAR(1234),NCHAR(555)
select CHARINDEX('w','helloworld'),CHARINDEX('h','helloworldh'),CHARINDEX('h','helloworldh',4)

--employee contains 'E' in his name

select * from Employees where CHARINDEX('e',FirstName)>0

--employee contains no 'E' in his name
 
select * from Employees where CHARINDEX('e',FirstName)=0

select CONCAT('hello','world','how')
select CONCAT(FirstName,LastName) from Employees name  --Adding first name and last name with the help of CONCAT FUNCTION

--Format function

select FORMAT(GETDATE(),'d','hi-IN')
select FORMAT(GETDATE(),'d','en-US')
select FORMAT(5000,'c')
--for currency
select FORMAT(5000,'c','hi-IN')
select FORMAT(5000,'c','ja-JP')
--for number system
select FORMAT(1234567,'n')
select FORMAT(1234567,'n','hi-IN')

--getting hire date in indian format

select employeeid,lastname,firstname,format(hiredate,'d','hi-IN')as indiandates from Employees

--left
select left('hello',3)

--write a query to get list of employees where starts with the character man

select * from Employees where LEFT(FirstName,2)='na'
select * from Employees where RighT(FirstName,1)='a'

--write a query to get the list of employess where names 2 rd character is a

select * from Employees where right(left(firstname,2),1)='a'

--sub string

select * from Employees where SUBSTRING(FirstName,2,1)='a'

--lower and upper

select UPPER(firstname)as upper from Employees
select LOWER(firstname) as lower from Employees

--Ltrim

select len('    hello')
select len(LTRIM('    hello'))

--replace
select REPLACE('hello world','o','a')

select * from emp where ename='john smith'
select * from emp where ename='johnsmith'
select * from emp where REPLACE(ename,' ','')='johnsmith'

--replicate
select replicate('hello ',4)
--reverse
select REVERSE('happy birthday')
--soundex
select SOUNDEX('color'),SOUNDEX('colour')
select * from emp where SOUNDEX(ename)=SOUNDEX('smith')
--difference
select DIFFERENCE('smith','smyth')
select DIFFERENCE('color','red')
select DIFFERENCE('color','colour')


--space
select 'hello'+space(5)+'world'
select space(1)+FirstName+SPACE(2)+lastname as name from Employees
--stuff

select STUFF('hello world',5,3,'r')
---------------------------------------------------------------------------------------------------------------
--DATA TYPE FUNCTION

select DATALENGTH(200)
select DATALENGTH('date')
select DATALENGTH(GETDATE())

select DATALENGTH(empno),DATALENGTH(ename) from Emp

select IDENT_CURRENT('supplier'),IDENT_SEED('supplier'),IDENT_INCR('supplier')

select GETDATE(),GETUTCDATE(),SYSDATETIME()

--datename

select DATENAME(DD,GETDATE())
select DATENAME(mm,GETDATE())
select DATENAME(YY,GETDATE())
select DATENAME(DW,GETDATE())

--only difference is dw,mm in datename gives in string but in datepart its in integer format

select DATEPART(DW,GETDATE())
select DATEPART(d,GETDATE())
select DATEPART(M,GETDATE())
select DATEPART(YEAR,GETDATE())

--list of employess join in the month of march

select * from emp where DATEname(m,HireDate)='march'

select YEAR(getdate())
select MONTH(getdate())
select EOMONTH(getdate(),5)-- gives last date of the month

select datediff(yy,'1991-12-17',getdate())
select max(DATEDIFF(yy,hiredate,getdate()))as seniority from emp

--dateadd
select DATEADD(yy,45,GETDATE())
select DATEFROMPARTS(2014,08,3)
select TIMEFROMPARTS(2015,03,01)

select ISDATE('1/19/2015')
select ISDATE('19/01/2015') -- gives zero it must be in correct format

--Conversion function
--cast
select CAST('100' as int)
select CAST(getdate() as varchar(12))
select CAST(getdate() as varchar)
select cast(hiredate as varchar)as inwords from Emp
select GETDATE()

--Logical functions

select CHOOSE(3,10.2,12,178,43,894)
select CHOOSE(2,firstname,lastname,Title)from Employees
select * from Employees

--iff

select iif(10<20,'hello','hai')
select iif(10>20,'hello','hai')
--host_id

select HOST_ID()
select HOST_NAME()
select ISNUMERIC(1),ISNUMERIC('santosh'),isnumeric('100') 
select NEWID()
--isnulll
select ISNULL(100,200),ISNULL(null,200),ISNULL(200,null),ISNULL(null,null)
select empno,ename,job,sal+ISNULL(comm,0)as totalsalary from Emp
--coalesec

select coalesce(null,null,33,null,499) 

--null if

select nullif(10,10),nullif(12,20)

--case

select empno,ename,job,
case job
when 'president' then 'bigboss'
when 'manager' then 'boss'
when 'analyst' then 'scientist'
else 'employee'
end as comment from Emp

select empno,ename,job,
case job
when 'clerk' then 'lower job'
when 'analyst' then 'typer'
when 'manager' then 'comer'
else 'employee'
end as comment from emp

select APP_NAME()
select COL_LENGTH('emp','ename')
select COL_LENGTH('emp','hiredate')
select DB_ID('msdb')

----------------------------------------------------------------------------------------------------------
--Ranking functions

--top clause
--write a query to get 5 heighest paid salary

 select top 5 * from Emp order by Sal desc

-- write a query to get last 5 employess
F
select top 5 * from emp  order by Sal desc

--Ranking 

select empno,ename,job,sal,rank() over(order by sal,empno desc) from emp

--write a query to get top 7 salaried employed in the organization with ranking

select top 7 empno, ename,job,sal,rank() over(order by sal desc) from emp

--partion clause

select empno,ename,job,sal,deptno, rank() over(partition by deptno order by sal desc)as ranking from Emp

--dense rank

select empno,ename,job,sal,deptno,DENSE_RANK() over(order by sal desc)as ranking from Emp

--write a query to rank the records under a table basing on the job  without gaps in ranking
select empno,ename,job,sal,deptno,DENSE_RANK()over(partition by job order by sal desc)as ranking from emp

--Row number

select empno,ename,job,deptno,sal, ROW_NUMBER() over( order by sal desc) as Rownumbr from Emp 

--Aggrigat function

select distinct job from emp
select distinct deptno from emp

--count : number of items in the group , returns in integer

select * from emp
select COUNT(*) from emp
select COUNT(*) from emp where Job='clerk'
select COUNT(sal) from emp
select COUNT( distinct sal) from emp

select COUNT(comm) from Emp

select COUNT(distinct job) from emp
select count(distinct deptno) from emp

--count_big

select COUNT_big(distinct job) from emp

--sum: it's work only on integer column(adds the values)

select SUM(sal) from emp
select sum(deptno) from emp
select sum(ename) from emp-- gives error
select AVG(sal) from Emp
select MIN(deptno) from emp
select max(deptno) from emp
select STDEV(deptno) from emp
select var(deptno) from emp
-----------------------------------------------------------------------------------------------------------------
--Operators

--+

select empno,ename,job,sal+ISNULL(comm,0)as [Total Salary] from Emp

--=

select * from emp where  sal=300
select * from emp where  sal<300
select * from emp where  sal>300
select * from emp where  sal<>5000
select * from emp where Sal !=5000

--Compound Operator

update emp set sal=sal+1000 from emp where Empno=1001
update emp set Sal+=1000 from emp where Empno=1002

--Logical operators- and,or,not,between,in
--write a query to get the list of manager whose salary is greater than 3500
select * from emp where sal>3000 and Job='manager'

select * from emp where sal>3000 and job='salesman'

--write a query to get the list employees working in deptano no 10 and 13

select * from emp where Deptno=20 or Deptno=30
select * from emp where Deptno=20 and Deptno=30-- not give any answer

--write a query to get the list of employees who are not president
select * from emp where not job='president'
select * from emp where job!='president'
select * from emp where job <> 'president'

--write a query to get the details of clerk,manager,salesman

select * from emp where job in('clerk','manager','salesman')
select * from emp where job='clerk' or Job='manager' or job='salesman'

--whose salary should not be 2500,35000,5000

select * from emp where sal=2500 or sal=3500 or sal=5000
select * from emp where sal=2500 and sal=3500 and sal=5000--no answer

select * from emp where sal!=2500 and sal!=3500 and sal!=5000

select * from emp where sal not in(2500,3500,5000)

select * from emp where sal between 2500 and 5000

-- and : not equal( to applicable)
-- or : equals to (appllicable)

--Like: operand matches to a pattern
--write a query to get the list of employees whose name starts with 's'

select * from emp where LEFT(ename,1)='s'
select * from emp where Ename like 's%'

--smilar to smith
select * from emp where SOUNDEX(ename)=SOUNDEX('smyth')
select * from emp where Ename like'sm_th'

--write a query to get the list of employess whose name contains a letter 'e'

select * from emp where ename like'%e%'

--write a query to get the list of employess whose name does not contains a letter 'e'

select * from emp where ename not like'%e%'

--write a query to get the list of employess whose names ends with any of'khy'

select * from emp where Ename like'%[khy]'

--write a query to get the list of employees whose name starts with A-S range

select * from emp where Ename like'[A-S]%'

--write a query to get the list of employees whose name does not starts with A-S range

select * from emp where Ename like'[^A-S]%'

select * from emp where ename not like '[A-S]%'

----------------------------------------------------------------------------------------------------------

--set operators union,union all,intersect,except

--union

--write a query to find out the jobs associated with deptno 10 and deptno 20

select job from emp where Deptno=10
union all
select job from emp where Deptno=20

--Intersect 

select job from emp where Deptno=10
intersect
select job from emp where Deptno=20
intersect 
select job from emp where Deptno=30

--Except
select job from emp where Deptno=10
except
select job from emp where Deptno=20
except
select job from emp where Deptno=30

-------------------------------------------------------------------------------------------------------------------
--Clauses Where,Group By,Having,Order by
--where
select * from emp where job='clerk'
select * from emp where job in('clerk','manager','salesman')
select * from emp where sal between 3000 and 4000

--write a query to get the number of employess in the organization

select count(*) from emp

--write a query to get the number of employess in each department

select deptno from emp group by Deptno
select deptno,COUNT(*) from Emp group by Deptno

--write a query to find out the number of employess present under each job


select job from emp group by job

select job, COUNT(*)as Grouped from emp group by job

--write a query to find out the number of employess present under each job under each department

select  deptno, job,count(*) from emp group by Deptno,job

select job,deptno,count(*) from emp group by job,Deptno

--write a query to get max sal of each department

select deptno,max(sal) from emp group by deptno
select deptno,min(sal),GETDATE() from emp group by Deptno
select job,avg(sal),'hello' from emp group by job
select empno,deptno,sum(sal) from emp group by Deptno -- gives you error
--having (appliecable for only aggrearate function like count(*),appllicabl after the group by)
--***(left coulumn name should be equal to after the group by clause, 2 columns names then group by 2 cloumns names) 
--(EG: select job,deptno from emp group by job,Deptno)
 

--write a query to get the number of employessin each department but only if the count is greater then 5

select deptno,COUNT(*) from emp group by Deptno having COUNT(*)>5

--write a query to find out the no of clerks present in the organization

select COUNT(*) from emp where job='clerk'

--write a query to find out the no of clerks on each deppt

select deptno,count(*) from emp where job='clerk' group by Deptno

select deptno,job,count(*) from emp where job='clerk' group by Deptno -- gives you error u need to add job besides group by clause

select deptno,job,count(*) from emp where job='clerk' group by Deptno,job

--write a record to find out the no of clerk in each dept but on if the count>1

select deptno,COUNT(*) from emp where job='clerk'group by Deptno having COUNT(*)>1

select deptno,job,COUNT(*) from emp where job='clerk'group by Deptno,job having COUNT(*)>1

--wrtie a query to get the number of clerks an each department but only if the count is greater
-- then 1 and display them in descinding order to the deptno

select job,deptno,count(*) from emp where job='clerk' group by deptno,job having COUNT(*)>1 order by Deptno desc

select job,deptno,hiredate from emp group by deptno,Job,HireDate

--order by(default : ASC)

select * from emp order by Sal
select * from emp order by Sal asc

--write a query to get the employeed details of each employee with the salary highest to lowest

select * from emp order by sal desc

select empno,ename,deptno,job,sal,comm from emp where Deptno=20 order by sal,Comm

------------------------------------------------------------------------------------------------------------------

--SUB QUERIES
--(columns should be match left and right)

--write a query to get the details of heighest salrired employed

--1)select max(sal) from Emp 
--2)select * from emp wher sal= 7000
 
 select * from emp where sal=(select MAX(sal) from emp)

 --write a query to get the second highest salary

 select * from emp where sal=(select max(sal) from emp where sal< (select MAX(sal) from Emp))

 --write a query to get employees working at sales dept

 select * from Dept
 select * from emp where Deptno=(select deptno from dept where DName='sales')

 --write a query to get employees working at finanace dept

 select * from emp where Deptno=(select Deptno from dept where DName='finance')

 --write a query to details of employee working in delhi location

 select * from emp where Deptno=(select Deptno from dept where Loc='delhi')

 --write a query to get the details of employee who earning more then the highest salary of dept no 30

 select * from emp where sal>(select sal from emp where Deptno=30)-- gives error coz Subquery conatins more than one value,so thats why use ALL
			
 --ALL
  select * from emp where sal>ALL(select sal from emp where Deptno=30)

  			--OR

select * from emp where sal>(select max(sal) from emp where Deptno=30)

--write a query to get the list of employees who earning less then the list salary of deptno 20

select * from emp where sal<(select min(sal) from emp where Deptno=20)
select * from emp where sal<all(select sal from emp where Deptno=20)

--write a query to get the list of employees who earning less then the list highest salary of deptno 10

select * from emp where sal<(select max(sal) from emp where Deptno=10)
select * from emp where sal<some(select sal from emp where Deptno=10)
select * from emp where sal<any(select max(sal) from emp where Deptno=10)

--ALL,ANY,SUM are can be used only with sub queries

-- ANY=SUM, both are equal

--*** in:used mostly at the grouping the subquiries, it is also for equality

--write a query to get the details of employees earning the highest salry in each department

select * from emp where sal in(select max(sal) from emp group by Deptno)

--write a query to get the deptno of mose senior employee in the organization

select * from emp where HireDate=(select MIN(hiredate) from emp)

--write a query to get the deptno of most senior employee in the each department organization
 
select * from emp where HireDate in(select MIN(hiredate) from emp group by Deptno)

--write a query to get the deptno of most recent employee in the organization

select * from emp where HireDate=(select max(HireDate) from emp)

--write a query to get the deptno of most recent employee in the each department organization

select * from emp where HireDate in (select max(hiredate) from emp group by Deptno)

--*** in SQL multipile column comparsion in sub quires are not available but in oracle it is available, like

--select * from emp where deptno,hire = (select deptno,hiredate from emp)

-----------------------------------------------------------------------------------------------------------------------------
--Rollup and cube operator

select deptno,job,sum(sal) from emp group by rollup(deptno,job)


select deptno,job,sum(sal) from emp group by cube(deptno,job)

------------------------------------------------------------------------------------------------------------------------------
--offset and fetch

select * from emp order by sal offset 5 rows --leaves first 5 rows and gives the result
 
select * from emp order by sal offset 10 rows

--fetch-- returns the rows after the offsets one

select * from emp order by sal offset 5 rows fetch next 5 rows only

--write a query to get the top 5 employee

select top 5 * from emp
select * from emp order by sal offset 0 rows fetch next 5 rows only

--write a query to get last 5 records of the data

select * from emp order by sal offset 10 rows fetch next 5 rows only
select * from emp order by sal offset 0 rows fetch next+5 rows only

--corelated query

select * from emp e where 0= (select count(sal) from emp where sal>e.Sal)
select * from emp e where 0= (select count(distinct(sal)) from emp where sal>e.Sal)

--write  a query to get list of department only under which employment are working
--sub query
select * from dept where Deptno in(select distinct Deptno from emp)

-- correlated query

select * from Dept where exists(select * from  emp where emp.Deptno = Dept.Deptno)
 

--write  a query to get list of department only under which employment are not working

--sub query

select * from dept where Deptno not in (select distinct deptno from emp)

-- correlated query

select * from dept where not exists(select * from emp where Emp.Deptno=Dept.Deptno)

--write a query to get the list of employees who are having sub ordinates

--sub query

select * from emp where Empno in(select distinct mgr from emp )

select * from emp e where exists (select * from emp m where e.Empno=m.Mgr)

-----------------------------------------------------------------------------------------------------------------------

--Joins
--Ineer joins
--1) ansi joins(equi join)
--2)Non ansi joins(avoid usig these joins, coz it's resticated for sql server)(here "WHERE" condition get used)
--Outer join

--1) ansi joins(equi join)
--write a query to get the tables data ie employee and department
select e.empno,e.ename,e.job,e.mgr,d.deptno,d.dname,d.loc from emp e inner join Dept d on e.Deptno=d.Deptno
select * from emp e inner join Dept d on e.Deptno=d.Deptno

--non ansi join
select e.empno,e.ename,e.job,e.mgr,d.deptno,d.dname,d.loc from emp e,dept d where e.Deptno=d.Deptno

--to retrive 3 table data

--Ansi
select e.empno,e.ename,e.job,d.loc,d.deptno,d.dname,dd.did,dd.deptno,dd.comments from emp e join Dept d on e.Deptno=d.Deptno join DeptDetails dd  on d.Deptno=dd.Deptno

select * from emp e join Dept d on e.Deptno=d.Deptno join DeptDetails dd on d.Deptno=dd.Deptno
--Non ansi

select e.empno,e.ename,e.job,d.loc,d.deptno,d.dname,dd.did,dd.deptno,dd.comments from Emp e,Dept d,DeptDetails dd where e.Deptno=d.Deptno and d.Deptno=dd.Deptno

--ansi
select e.empno,e.sal,s.losal,s.hisal from Emp e join SalGrade s on e.Sal between s.losal and s.Hisal

--non ansi

select e.empno,e.sal,s.losal,s.hisal from emp e,SalGrade s where e.Sal between s.LoSal and s.Hisal

 --ansi

 select e.empno,e.Ename,e.sal,d.deptno,d.dname,d.loc,dd.did,dd.comments from SalGrade g join emp e on e.Sal between g.LoSal and g.Hisal join dept d on e.Deptno=d.Deptno join DeptDetails dd on d.Deptno=dd.Deptno

 --self join

 select distinct  e.Empno,e.ename,e.job,e.hiredate,e.mgr,e.Deptno from emp e inner join emp m on e.Empno=m.Mgr

 select distinct  e.Empno,e.ename,e.job,e.hiredate,e.mgr,e.Deptno from emp e,emp m where e.Empno=m.Mgr

 --cross join
 --Ansi

 select * from emp e cross join dept d 
 
 --Non ansi

 select * from dept d

 --Outer joins
 --left outer joins
 --right outer joins
 --full outer joins

 --left outer joins

 insert into emp(empno,Ename,Job,sal)values(1016,'santosh','clerk',2000)

 select e.empno,e.ename,e.job,e.sal,e.deptno,d.deptno,d.dname,d.loc from emp e left outer join Dept d on e.Deptno=d.Deptno

 --Right outer join

  select e.empno,e.ename,e.job,e.sal,e.deptno,d.deptno,d.dname,d.loc from emp e right outer join Dept d on e.Deptno=d.Deptno
  
  --full outer join
  
  select e.empno,e.ename,e.job,e.sal,e.deptno,d.deptno,d.dname,d.loc from emp e full outer join Dept d on e.Deptno=d.Deptno

  ---------------------------------------------------------------------------------------------------------------------------------------

  --Synonym

  create synonym E for emp
  Create synonym D for dept

  select * from e
  select * from d

  select e.Ename,e.Empno,e.Deptno,e.Mgr,d.loc,d.DName from e inner join d on e.Deptno=d.Deptno

  ----------------------------------------------------------------------------------------------------------------------------------
  --sequence

  create sequence sq2
  as tinyint
  start with 10
  select next value for sq2
 
 create sequence sq3
 as int
 start with 12
 increment by 2
 cycle 
 cache 10
 select next value for sq3

 create sequence sq4
 as bigint
 start with 100
 increment by 50
 minvalue 100
 maxvalue 100000
 cycle 
 cache 20

 select next value for sq4

  create sequence sq4ka
 as bigint
 start with 100
 increment by 50
 minvalue 100
 maxvalue 1000
 cycle 
 cache 20
 select next value for sq4ka

 --create a sequence for emp

 create sequence emp_seq
 as int
 increment by 1
 start with 100
 minvalue 100
 maxvalue 1000
 no cycle
 cache 10

 create table seq(empid int,ename varchar(50))
 insert into seq values(next value for emp_seq, 'santosh')
 insert into seq values(next value for emp_seq, 'santosh')
 insert into seq values(next value for emp_seq, 'santosh')
 insert into seq values(next value for emp_seq, 'santosh')
 insert into seq values(next value for emp_seq, 'santosh')
 select * from seq
 ---------------------------------------------------------------------------------------------------------------------------
--crete a new table with the existing table by copring selected or required columns

select * into new_emp from Emp
select * from new_emp

--copy only 2 cloumns of your own selection
select ename,empno into two_emp from Emp
select * from two_emp

--copy only selected rows of emp

select * into sele_emp from emp where Deptno=10
select * into sele_emp1 from emp where Empno=1002
select * from sele_emp
select * from sele_emp1

--copy select columns and deptno=20

select empno,ename,Job,Mgr into sel1_emp from emp where Deptno=20
select * from sel1_emp

--**create a blank table with same structure of emp table with our any data

select * into blan_emp from emp where 1=2
select * from blan_emp
insert into blan_emp values(next value for emp_seq,'santosh','sd',100,'12/1/1991',90,23,10)
delete from blan_emp where empno=105
select * from emp where 1=1
select * from emp where 1=2






































































































































































































































