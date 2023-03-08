
-- ON DELETE

use employee;

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


INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Satg","Manager",1500000,2);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Arun","Admin",2000000,3);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Ravi","Analyst",2500000,1);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Muhtu","Manager",5000000,1);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Sakthi","Teller",1000000,3);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Dinesh","Manager",8000000,3);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Ramesh","HR",3000000,2);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("sarvo","Sales",1600000,1);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Suresh","HR",2700000,2);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Bala","CEO",9500000,1);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Revathi","Developer",1500000,NULL);
INSERT INTO bremployee(ename,jobdesc,salary,branchid) VALUES ("Suganya","Engineer",1700000,NULL);

select * from bremployee;

delete from bremployee where ename in("revathi","suganya");

