
use employee;

-- DELETE , TRUNCATE and DROP TABLE

select * from abc123;
insert into abc123 values
("sfsf","dsada","sdws"),("dsdad","dsfds","dfe543"),
("xcds34534","erwrwe","csdf45");

alter table abc123 
add column (branch varchar(20) , location varchar(10));

delete from abc123;  -- DML(Data Manipulation Language), uses a row lock during execution and can be rolled back. Every deleted row is locked, so it will require a lot of locks if you’re working in a large table
truncate table abc123;  -- DDL(Data Definition Language) command, locks the whole table to remove data from a table; thus, this command also uses less transaction space than DELETE, transactions can be rolled back in database engines like SQL Server and PostgreSQL, but not in MySQL and Oracle.

drop table abc123  -- DDL, removes the table definition and data as well as the indexes, constraints, and triggers related to the table.frees the memory space.cannot be rolled back in MySQL, but it can in Oracle, SQL Server, and PostgreSQL.



CREATE TABLE BrLocation(
BrId int primary key auto_increment,
BrName varchar(20) NOT NULL,
BrAdd varchar(50)
);

/* 
alter table BrLocation
modify bradd varchar(20) NULL;

alter table brlocation
drop column bradd;

alter table BrLocation
add bradd varchar(20); 

alter table BrLocation
modify bradd varchar(50);
describe brlocation;

*/

INSERT INTO brlocation (brname,bradd) VALUES ("Chennai","No 5,second floor,Broadway");
INSERT INTO brlocation (brname,bradd) VALUES ("Coimbatore","No 3, 3rd cross street,Gandhiputam");
INSERT INTO brlocation (brname,bradd) VALUES ("Trichy","No 2,ABC complex,Woraiyur");
INSERT INTO brlocation (brname,bradd) VALUES ("Madurai", "No 1, Floor 2, Maela Maasi Veethi");
INSERT INTO brlocation (brname) VALUES ("Trisur");
INSERT INTO brlocation (brname) VALUES ("Mysuru");

select * from brlocation;

CREATE TABLE BrEmployee(
EId int primary key auto_increment,
EName varchar(20) NOT NULL,
JobDesc varchar(20) NOT NULL,
Salary int NOT NULL,
Branchid int,
CONSTRAINT Fk_br_id foreign key(Branchid) references Brlocation(Brid)
);

describe bremployee;


INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Satg","Manager",1500000,2);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Arun","Admin",2000000,3);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Ravi","Analyst",2500000,1);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Muhtu","Manager",5000000,1);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Sakthi","Teller",1000000,3);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Dinesh","Manager",8000000,3);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Ramesh","HR",3000000,2);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("sarvo","Sales",1600000,1);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Suresh","HR",2700000,2);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Bala","CEO",9500000,1);
insert into bremployee (ename,jobdesc,salary,branchid) VALUES ("Pandi","Manager",3500000,4);
insert into bremployee (ename,jobdesc,salary,branchid) VALUES ("Banu","CEO",8500000,4);
insert into bremployee (ename,jobdesc,salary,branchid) VALUES ("Raja","Sales",1800000,4);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Revathi","Developer",1500000,NULL);
INSERT INTO bremployee (ename,jobdesc,salary,branchid) VALUES ("Suganya","Engineer",1700000,NULL);

select * from bremployee;
select * from brlocation;

alter table brlocation
add column ManagerId int;

/* -- The below query failed to execute

update brlocation 
set managerid=1,managerid=4,managerid=6,managerid=19  where brid in (2,1,3,4);



/* -- The below query failed to execute

UPDATE brlocation
SET    managerid = 
       CASE brid
            WHEN 2 THEN 1
            WHEN 1 THEN 4
            WHEN 3 THEN 6
            WHEN 4 THEN 19
			END
WHERE  brid IN (1,4,6,19);
*/

update brlocation
set managerid=null where managerid is not null;

update brlocation
set Managerid=1 where brid=2;

update brlocation
set Managerid=4 where brid=1;

update brlocation
set Managerid=6 where brid=3;

update brlocation
set Managerid=19 where brid=4;

-- SET FOREIGN KEY for Brlocation After creating Bremployee table then only it will be meaningfull

alter table brlocation
add constraint fk_eid foreign key (BrId) references BrEmployee(Eid);

select * from bremployee;
select * from brlocation;


-- ON DELETE -- SET NULL and CASCADE

CREATE TABLE BrInfo(
BrId int primary key auto_increment,
BrName varchar(20) NOT NULL,
BrAdd varchar(50)
);

INSERT INTO BrInfo (brname,bradd) VALUES ("Chennai","No 5,second floor,Broadway");
INSERT INTO BrInfo (brname,bradd) VALUES ("Coimbatore","No 3, 3rd cross street,Gandhiputam");
INSERT INTO BrInfo (brname,bradd) VALUES ("Trichy","No 2,ABC complex,Woraiyur");
INSERT INTO BrInfo (brname,bradd) VALUES ("Madurai", "No 1, Floor 2, Maela Maasi Veethi");
INSERT INTO BrInfo (brname) VALUES ("Trisur");
INSERT INTO BrInfo (brname) VALUES ("Mysuru");


CREATE TABLE BrEmpInfo(
EId int primary key auto_increment,
EName varchar(20) NOT NULL,
JobDesc varchar(20) NOT NULL,
Salary int NOT NULL,
Branchid int,
CONSTRAINT Fk_bid foreign key(Branchid) references BrInfo(Brid)
);

INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Satg","Manager",1500000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Arun","Admin",2000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ravi","Analyst",2500000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Muhtu","Manager",5000000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Sakthi","Teller",1000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Dinesh","Manager",8000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ramesh","HR",3000000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("sarvo","Sales",1600000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suresh","HR",2700000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Bala","CEO",9500000,1);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Pandi","Manager",3500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Banu","CEO",8500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Raja","Sales",1800000,4);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Revathi","Developer",1500000,NULL);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suganya","Engineer",1700000,NULL);

select * from brinfo;
select * from brempinfo;

-- SHOW INDEX, CREATE INDEX, ADD INDEX, DROP INDEX

describe brempinfo;
show index from brempinfo;
show indexes from brempinfo;

-- CREATE INDEX

create index name_index on brempinfo(ename);

-- ADD INDEX
alter table brempinfo
add index sal_index (salary);

-- DROP INDEX

alter table brempinfo
drop index name_index

alter table brempinfo
drop index sal_index;

alter table brempinfo
drop index name_index, drop index sal_index;

-- SET NULL

select * from brempinfo;
show index from brempinfo;
select * from brinfo;

drop table brempinfo;

CREATE TABLE BrEmpInfo(
EId int primary key auto_increment,
EName varchar(20) NOT NULL,
JobDesc varchar(20) NOT NULL,
Salary int NOT NULL,
Branchid int,
CONSTRAINT Fk_bid foreign key(Branchid) references BrInfo(Brid)
);

INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Satg","Manager",1500000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Arun","Admin",2000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ravi","Analyst",2500000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Muhtu","Manager",5000000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Sakthi","Teller",1000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Dinesh","Manager",8000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ramesh","HR",3000000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("sarvo","Sales",1600000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suresh","HR",2700000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Bala","CEO",9500000,1);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Pandi","Manager",3500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Banu","CEO",8500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Raja","Sales",1800000,4);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Revathi","Developer",1500000,NULL);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suganya","Engineer",1700000,NULL);


select * from brempinfo;
show index from brempinfo;
select * from brinfo;

delete from brinfo where brname="chennai"; -- can not delete bcoz of foreign key, So use ON DELETE while creating the table

drop table brempinfo;
drop table brinfo;

CREATE TABLE BrInfo(
BrId int primary key auto_increment,
BrName varchar(20) NOT NULL,
BrAdd varchar(50)
);

INSERT INTO BrInfo (brname,bradd) VALUES ("Chennai","No 5,second floor,Broadway");
INSERT INTO BrInfo (brname,bradd) VALUES ("Coimbatore","No 3, 3rd cross street,Gandhiputam");
INSERT INTO BrInfo (brname,bradd) VALUES ("Trichy","No 2,ABC complex,Woraiyur");
INSERT INTO BrInfo (brname,bradd) VALUES ("Madurai", "No 1, Floor 2, Maela Maasi Veethi");
INSERT INTO BrInfo (brname) VALUES ("Trisur");
INSERT INTO BrInfo (brname) VALUES ("Mysuru");

select * from brempinfo;
show index from brempinfo;
select * from brinfo;

CREATE TABLE BrEmpInfo(
EId int primary key auto_increment,
EName varchar(20) NOT NULL,
JobDesc varchar(20) NOT NULL,
Salary int NOT NULL,
Branchid int,
CONSTRAINT Fk_bid foreign key(Branchid) references BrInfo(Brid)
ON DELETE set null
);

INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Satg","Manager",1500000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Arun","Admin",2000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ravi","Analyst",2500000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Muhtu","Manager",5000000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Sakthi","Teller",1000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Dinesh","Manager",8000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ramesh","HR",3000000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("sarvo","Sales",1600000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suresh","HR",2700000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Bala","CEO",9500000,1);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Pandi","Manager",3500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Banu","CEO",8500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Raja","Sales",1800000,4);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Revathi","Developer",1500000,NULL);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suganya","Engineer",1700000,NULL);


delete from brinfo where brid=1 -- If a FOREIGN KEY referenced data that is brid is deleted on BrInfo table then only branchId thet is related to brid will be deleted  on brempinfo table

select * from brinfo;
select * from brempinfo;

select * from brinfo,brempinfo;

-- CASCADE -- If a FOREIGN KEY referenced data that is brid is deleted on Brinfo table then the entire row's data related to this FOREIGN KEY is also deleted on another table that is brempinfo table 

drop table brempinfo;
drop table brinfo;

CREATE TABLE BrInfo(
BrId int primary key auto_increment,
BrName varchar(20) NOT NULL,
BrAdd varchar(50)
);

INSERT INTO BrInfo (brname,bradd) VALUES ("Chennai","No 5,second floor,Broadway");
INSERT INTO BrInfo (brname,bradd) VALUES ("Coimbatore","No 3, 3rd cross street,Gandhiputam");
INSERT INTO BrInfo (brname,bradd) VALUES ("Trichy","No 2,ABC complex,Woraiyur");
INSERT INTO BrInfo (brname,bradd) VALUES ("Madurai", "No 1, Floor 2, Maela Maasi Veethi");
INSERT INTO BrInfo (brname) VALUES ("Trisur");
INSERT INTO BrInfo (brname) VALUES ("Mysuru");


CREATE TABLE BrEmpInfo(
EId int primary key auto_increment,
EName varchar(20) NOT NULL,
JobDesc varchar(20) NOT NULL,
Salary int NOT NULL,
Branchid int,
CONSTRAINT Fk_bid foreign key(Branchid) references BrInfo(Brid)
ON DELETE cascade
);

INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Satg","Manager",1500000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Arun","Admin",2000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ravi","Analyst",2500000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Muhtu","Manager",5000000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Sakthi","Teller",1000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Dinesh","Manager",8000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ramesh","HR",3000000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("sarvo","Sales",1600000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suresh","HR",2700000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Bala","CEO",9500000,1);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Pandi","Manager",3500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Banu","CEO",8500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Raja","Sales",1800000,4);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Revathi","Developer",1500000,NULL);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suganya","Engineer",1700000,NULL);

select * from brinfo;
select * from brempinfo;

delete from brinfo where brid=1; 

----------------------------------------
-- -------------------JOINS-------------

CREATE TABLE BrInfo(
BrId int primary key auto_increment,
BrName varchar(20) NOT NULL,
BrAdd varchar(50)
);

INSERT INTO BrInfo (brname,bradd) VALUES ("Chennai","No 5,second floor,Broadway");
INSERT INTO BrInfo (brname,bradd) VALUES ("Coimbatore","No 3, 3rd cross street,Gandhiputam");
INSERT INTO BrInfo (brname,bradd) VALUES ("Trichy","No 2,ABC complex,Woraiyur");
INSERT INTO BrInfo (brname,bradd) VALUES ("Madurai", "No 1, Floor 2, Maela Maasi Veethi");
INSERT INTO BrInfo (brname) VALUES ("Trisur");
INSERT INTO BrInfo (brname) VALUES ("Mysuru");


CREATE TABLE BrEmpInfo(
EId int primary key auto_increment,
EName varchar(20) NOT NULL,
JobDesc varchar(20) NOT NULL,
Salary int NOT NULL,
Branchid int,
CONSTRAINT Fk_bid foreign key(Branchid) references BrInfo(Brid)
ON DELETE cascade
);

INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Satg","Manager",1500000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Arun","Admin",2000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ravi","Analyst",2500000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Muhtu","Manager",5000000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Sakthi","Teller",1000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Dinesh","Manager",8000000,3);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Ramesh","HR",3000000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("sarvo","Sales",1600000,1);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suresh","HR",2700000,2);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Bala","CEO",9500000,1);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Pandi","Manager",3500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Banu","CEO",8500000,4);
insert into BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Raja","Sales",1800000,4);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Revathi","Developer",1500000,NULL);
INSERT INTO BrEmpInfo (ename,jobdesc,salary,branchid) VALUES ("Suganya","Engineer",1700000,NULL);

alter table brinfo
add constraint fk_fk_eid foreign key(brid) references brempinfo(eid);

select * from brinfo;
select * from brempinfo;

-- JOIN or INNER JOIN -- Fetch exact matches

select EId,EName,JobDesc,BrName
from brempinfo          
join brinfo
on branchid=brid
order by eid;

select brempinfo.EId,brempinfo.EName,brempinfo.JobDesc,brinfo.BrName
from brempinfo
inner join brinfo
on brempinfo.branchid=brinfo.brid
order by brempinfo.eid;

select l.EId,l.EName,l.JobDesc,r.BrName
from brempinfo as l        
inner join brinfo as r
on l.branchid=r.brid
order by l.eid;

-- LEFT JOIN , Fetch exact matches and also fetch extra rows of LEFT TABLE

select l.EId,l.EName,l.JobDesc,r.BrName
from brempinfo as l        
left join brinfo as r
on l.branchid=r.brid
order by l.eid;


-- RIGHT JOIN , Fetch exact matches and also fetch extra rows of RIGHT TABLE

select l.EId,l.EName,l.JobDesc,r.BrName
from brempinfo as l        
right join brinfo as r
on l.branchid=r.brid
order by l.eid;

select l.EId,l.EName,l.JobDesc,r.BrName
from brempinfo as l        
right join brinfo as r
on l.branchid=r.brid;

-- WHERE CLAUSE JOIN , WITHOUT using INNER JOIN command we can join two table by WHERE clause for inner join

select l.EId,l.EName,l.JobDesc,r.BrName
from brempinfo as l,brinfo as r
WHERE l.branchid=r.brid
order by l.eid;

-- CROSS JOIN, Fetch same row multiple times

select l.EId,l.EName,l.JobDesc,r.BrName
from brempinfo as l CROSS JOIN brinfo as r;

-- To COUNT no.of employees in a branch

select * from brinfo;
select * from brempinfo;

select bi.BrName, count(be.eid) No_of_Employees
from brinfo as bi
join brempinfo as be
on bi.brid=be.branchid
group by be.branchid;

-- ---------------------UNION and UNION ALL--------------

create table student(
RollNo int primary key auto_increment,
StName varchar(20) not null,
Std varchar(5) 
);

insert into student (stname,std) values ("Bala","5th");
insert into student (stname,std) values ("Kathir","2nd");
insert into student (stname,std) values ("Bommi","1st");
insert into student (stname,std) values ("Elamathi","3rd");
insert into student (stname,std) values ("Maithili","4th");

/*
alter table staff
drop column grade;

alter table staff
employeedrop column salary;
*/

create table staff(
ID int primary key auto_increment,
Name varchar(20),
Sub varchar(20)
);

insert into staff (name,sub) values ("Manjula","Tamil");
insert into staff (name,sub) values ("Sumathi","Science");
insert into staff (name,sub) values ("Bommi","1st");
insert into staff (name,sub) values ("Maithili","4th");
insert into staff (name,sub) values ("Karunanithi","Social");


select * from staff;
select * from student;

describe staff;
describe student;

-- UNION , do not fetch reduntant rows that is exactly matches

select * from student
UNION 
select * from staff;

-- UNION ALL , Fetch all rows that is reduntant rows also

select * from student
UNION ALL
select * from staff;
-----------------------------------
show tables from employee;
show table status from employee;

---------------------------------

