create table COMPANY
(
  ID           NUMBER not null,
  NAME         VARCHAR2(30),
  PARENTID     NUMBER,
  COMPANYLEVEL NUMBER
);
alter table COMPANY
  add primary key (ID);

create table DEMOUSER
(
  ID           NUMBER not null,
  LOGINNAME    VARCHAR2(30),
  NAME         VARCHAR2(30),
  PASSWORD     VARCHAR2(30),
  COMPANYID    NUMBER,
  DEPARTMENTID NUMBER,
  ISMANAGER    NUMBER,
  HIREDATE     DATE
);
alter table DEMOUSER
  add primary key (ID);

create table DEPARTMENT
(
  ID       NUMBER not null,
  NAME     VARCHAR2(30),
  PARENTID NUMBER
);
alter table DEPARTMENT
  add primary key (ID);

create table LOAN_MONEY
(
  ID       NUMBER,
  USERID   NUMBER,
  MONEY    NUMBER,
  LOANDATE DATE
);
alter table LOAN_MONEY
  add primary key (ID)
  disable;

create or replace view userview as
select d."ID",d."LOGINNAME",d."NAME",d."PASSWORD",d."COMPANYID",d."DEPARTMENTID",d."ISMANAGER",d."HIREDATE",c.companylevel,c.name as companyName from demouser d, company c
where d.companyid=c.id;


prompt Disabling triggers for COMPANY...
alter table COMPANY disable all triggers;
prompt Disabling triggers for DEMOUSER...
alter table DEMOUSER disable all triggers;
prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for LOAN_MONEY...
alter table LOAN_MONEY disable all triggers;
prompt Deleting LOAN_MONEY...
delete from LOAN_MONEY;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
prompt Deleting DEMOUSER...
delete from DEMOUSER;
commit;
prompt Deleting COMPANY...
delete from COMPANY;
commit;
prompt Loading COMPANY...
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (3, 'Texas Branch', 1, 2);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (4, 'San Francisco Sub-branch', 2, 3);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (5, 'Los Angeles Sub-branch', 2, 3);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (6, 'San Jose Sub-branch', 2, 3);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (7, 'Houston Sub-branch', 3, 3);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (8, 'San Antonio Sub-branch', 3, 3);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (9, 'Dallas Sub-branch', 3, 3);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (10, 'San Diego Sub-branch', 2, 3);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (1, 'Head Office', 0, 1);
insert into COMPANY (ID, NAME, PARENTID, COMPANYLEVEL)
values (2, 'California Branch', 1, 2);
commit;
prompt 10 records loaded
prompt Loading DEMOUSER...
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (2, 'Alexis Stark', 'Alexis Stark', 'password', 1, 4, 1, to_date('05-01-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (3, 'Kerri Hatcher', 'Kerri Hatcher', 'password', 1, 3, 1, to_date('22-01-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (4, 'Janie Marie', 'Janie Marie', 'password', 1, 3, 0, to_date('02-02-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (5, 'Kathleen Woodiwiss', 'Kathleen Woodiwiss', 'password', 1, 3, 0, to_date('12-02-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (6, 'John Smith', 'John Smith', 'password', 2, 4, 0, to_date('20-02-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (7, 'Gabrielle Phillips', 'Gabrielle Phillips', 'password', 2, 3, 0, to_date('02-02-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (8, 'Haylee Ellington', 'Haylee Ellington', 'password', 2, 3, 1, to_date('02-03-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (9, 'Lydia Nelson', 'Lydia Nelson', 'password', 2, 1, 0, to_date('12-03-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (10, 'Jaiden Matthew', 'Jaiden Matthew', 'password', 3, 4, 0, to_date('22-03-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (11, 'Jeremy Steven', 'Jeremy Steven', 'password', 3, 3, 0, to_date('02-04-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (12, 'Savannah Paula', 'Savannah Paula', 'password', 3, 3, 1, to_date('12-04-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (13, 'Ava Rose', 'Ava Rose', 'password', 3, 1, 0, to_date('22-04-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (14, 'Steven Douglas', 'Steven Douglas', 'password', 4, 3, 0, to_date('02-05-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (15, 'Kaylee Marae', 'Kaylee Marae', 'password', 4, 4, 0, to_date('12-05-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (16, 'Hayden Panettiere', 'Hayden Panettiere', 'password', 5, 3, 0, to_date('22-05-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (17, 'Camylle Boyd', 'Camylle Boyd', 'password', 5, 4, 0, to_date('12-06-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (18, 'Tracey Miklesavage', 'Tracey Miklesavage', 'password', 6, 3, 0, to_date('22-06-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (19, 'Chaleena Watson', 'Chaleena Watson', 'password', 6, 4, 0, to_date('15-06-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (20, 'Kaylee Avery', 'Kaylee Avery', 'password', 7, 3, 0, to_date('15-07-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (21, 'Brooke Paiton', 'Brooke Paiton', 'password', 7, 4, 0, to_date('25-07-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (22, 'Avah Analise', 'Avah Analise', 'password', 8, 3, 0, to_date('03-07-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (23, 'Chase Elizabeth', 'Chase Elizabeth', 'password', 8, 4, 0, to_date('03-08-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (24, 'April Alexander', 'April Alexander', 'password', 9, 3, 0, to_date('13-08-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (25, 'Brandon Cole', 'Brandon Cole', 'password', 9, 4, 0, to_date('23-08-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (26, 'Kelly Freeman', 'Kelly Freeman', 'password', 10, 3, 0, to_date('03-08-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (27, 'Lauren Nicole', 'Lauren Nicole', 'password', 10, 4, 0, to_date('03-09-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (29, 'Caitlyn Derderian', 'Caitlyn Derderian', 'password', 1, 2, 0, to_date('13-09-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (30, 'Angeles Corona', 'Angeles Corona', 'password', 2, 2, 1, to_date('23-09-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (31, 'Ambrozia Shelley', 'Ambrozia Shelley', 'password', 2, 2, 0, to_date('07-09-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (32, 'Cindy Lawson', 'Cindy Lawson', 'password', 3, 2, 1, to_date('03-10-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (33, 'Michelle Steinke', 'Michelle Steinke', 'password', 3, 2, 0, to_date('13-10-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (34, 'Stacie Ferguson', 'Stacie Ferguson', 'password', 4, 2, 1, to_date('14-10-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (35, 'Clare Matthews', 'Clare Matthews', 'password', 4, 2, 0, to_date('15-10-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (36, 'Lauren Mcintosh', 'Lauren Mcintosh', 'password', 5, 2, 1, to_date('16-10-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (37, 'Amber Stanley', 'Amber Stanley', 'password', 5, 2, 0, to_date('17-11-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (38, 'Jenna Lyn', 'Jenna Lyn', 'password', 6, 2, 1, to_date('10-11-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (39, 'Steven Michael', 'Steven Michael', 'password', 6, 2, 0, to_date('21-11-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (40, 'James Paul', 'James Paul', 'password', 7, 2, 1, to_date('07-11-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (41, 'Hayden Nicole', 'Hayden Nicole', 'password', 7, 2, 0, to_date('07-12-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (42, 'Jimmy Greg', 'Jimmy Greg', 'password', 8, 2, 1, to_date('09-12-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (43, 'Billy Joe', 'Billy Joe', 'password', 8, 2, 0, to_date('16-12-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (44, 'Andrea Lee', 'Andrea Lee', 'password', 9, 2, 1, to_date('26-12-2008', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (45, 'John Ridgley', 'John Ridgley', 'password', 9, 2, 0, to_date('11-01-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (46, 'Sierra Shaffer', 'Sierra Shaffer', 'password', 10, 2, 1, to_date('22-01-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (47, 'Kimberly Perry', 'Kimberly Perry', 'password', 10, 2, 0, to_date('23-01-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (48, 'Ella Kate', 'Ella Kate', 'password', 1, 4, 0, to_date('13-01-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (49, 'Sophie Britton', 'Sophie Britton', 'password', 2, 4, 1, to_date('23-02-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (50, 'Kassy Smith', 'Kassy Smith', 'password', 3, 4, 1, to_date('02-02-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (51, 'Amanda Christine', 'Amanda Christine', 'password', 4, 4, 1, to_date('12-02-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (52, 'Dalton Grace', 'Dalton Grace', 'password', 5, 4, 1, to_date('17-02-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (53, 'Jenna Carter', 'Jenna Carter', 'password', 6, 4, 1, to_date('12-03-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (54, 'Allison Welch', 'Allison Welch', 'password', 7, 4, 1, to_date('12-04-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (55, 'Roxy Garcia', 'Roxy Garcia', 'password', 8, 4, 1, to_date('12-05-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (56, 'Elizabeth Stamper', 'Elizabeth Stamper', 'password', 9, 4, 1, to_date('22-03-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (57, 'Lizzy Pendrey', 'Lizzy Pendrey', 'password', 10, 4, 1, to_date('07-04-2009', 'dd-mm-yyyy'));
insert into DEMOUSER (ID, LOGINNAME, NAME, PASSWORD, COMPANYID, DEPARTMENTID, ISMANAGER, HIREDATE)
values (1, 'Kenzie Jaiden', 'Kenzie Jaiden', 'password', 1, 2, 1, to_date('02-01-2008', 'dd-mm-yyyy'));
commit;
prompt 56 records loaded
prompt Loading DEPARTMENT...
insert into DEPARTMENT (ID, NAME, PARENTID)
values (2, 'Research & Development', 0);
insert into DEPARTMENT (ID, NAME, PARENTID)
values (3, 'Sales', 0);
insert into DEPARTMENT (ID, NAME, PARENTID)
values (4, 'Human Resources', 0);
insert into DEPARTMENT (ID, NAME, PARENTID)
values (1, 'Finance & Accounting', 0);
commit;
prompt Enabling triggers for COMPANY...
alter table COMPANY enable all triggers;
prompt Enabling triggers for DEMOUSER...
alter table DEMOUSER enable all triggers;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for LOAN_MONEY...
alter table LOAN_MONEY enable all triggers;
set feedback on
set define on
prompt Done.
