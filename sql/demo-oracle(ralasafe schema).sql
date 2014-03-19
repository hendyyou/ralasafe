create table APPLICATION
(
  NAME        VARCHAR2(100) not null,
  DESCRIPTION VARCHAR2(500)
);
alter table APPLICATION
  add primary key (NAME);

create table APPLICATIONUSERTYPE
(
  APPNAME         VARCHAR2(100) not null,
  USERTYPENAME    VARCHAR2(100) not null,
  USERMETADATASTR VARCHAR2(1000)
);
alter table APPLICATIONUSERTYPE
  add primary key (APPNAME,USERTYPENAME);

create table RALASAFE_BUSINESSDATA
(
  ID          NUMBER not null,
  NAME        VARCHAR2(100) not null,
  DESCRIPTION VARCHAR2(500),
  INSTALLDATE DATE,
  FILENAME    VARCHAR2(40),
  PID         NUMBER,
  ISLEAF      NUMBER
);
alter table RALASAFE_BUSINESSDATA
  add primary key (ID);
alter table RALASAFE_BUSINESSDATA
  add unique (NAME);

create table RALASAFE_DECISION_ENTITLEMENT
(
  ID             NUMBER not null,
  PRIVILEGEID    NUMBER,
  USERCATEGORYID NUMBER,
  BUSINESSDATAID NUMBER,
  EFFECT         VARCHAR2(100),
  DENYREASON     VARCHAR2(1000)
);
alter table RALASAFE_DECISION_ENTITLEMENT
  add primary key (ID);

create table RALASAFE_PRIVILEGE
(
  ID                    NUMBER not null,
  PID                   NUMBER,
  DESCRIPTION           VARCHAR2(500),
  NAME                  VARCHAR2(100) not null,
  ISLEAF                NUMBER,
  DECISIONPOLICYCOMBALG NUMBER,
  QUERYPOLICYCOMBALG    NUMBER,
  TYPE                  NUMBER,
  CONSTANTNAME          VARCHAR2(40),
  URL                   VARCHAR2(100),
  TARGET                VARCHAR2(20),
  ORDERNUM              NUMBER
);
alter table RALASAFE_PRIVILEGE
  add primary key (ID);
alter table RALASAFE_PRIVILEGE
  add unique (NAME);

create table RALASAFE_QUERY
(
  ID          NUMBER not null,
  NAME        VARCHAR2(100) not null,
  DESCRIPTION VARCHAR2(500),
  INSTALLDATE DATE,
  FILENAME    VARCHAR2(40),
  PID         NUMBER,
  ISLEAF      NUMBER
);
alter table RALASAFE_QUERY
  add primary key (ID);
alter table RALASAFE_QUERY
  add unique (NAME);

create table RALASAFE_QUERY_ENTITLEMENT
(
  ID             NUMBER not null,
  PRIVILEGEID    NUMBER,
  USERCATEGORYID NUMBER,
  QUERYID        NUMBER,
  DESCRIPTION    VARCHAR2(500)
);
alter table RALASAFE_QUERY_ENTITLEMENT
  add primary key (ID);

create table RALASAFE_ROLE
(
  ID          NUMBER not null,
  NAME        VARCHAR2(100) not null,
  DESCRIPTION VARCHAR2(500)
);
alter table RALASAFE_ROLE
  add primary key (ID);
alter table RALASAFE_ROLE
  add unique (NAME);

create table RALASAFE_RALASAFE_USERROLE
(
  USERID NUMBER not null,
  ROLEID NUMBER not null
);
alter table RALASAFE_RALASAFE_USERROLE
  add primary key (USERID,ROLEID);
alter table RALASAFE_RALASAFE_USERROLE
  add foreign key (ROLEID)
  references RALASAFE_ROLE (ID);

create table RALASAFE_ROLEPRIVILEGE
(
  ROLEID      NUMBER not null,
  PRIVILEGEID NUMBER not null
);
alter table RALASAFE_ROLEPRIVILEGE
  add primary key (ROLEID,PRIVILEGEID);
alter table RALASAFE_ROLEPRIVILEGE
  add foreign key (ROLEID)
  references RALASAFE_ROLE (ID);
alter table RALASAFE_ROLEPRIVILEGE
  add foreign key (PRIVILEGEID)
  references RALASAFE_PRIVILEGE (ID);

create table RALASAFE_SEQUENCE
(
  CURRENTVALUE NUMBER,
  NAME         VARCHAR2(100) not null
);
alter table RALASAFE_SEQUENCE
  add primary key (NAME);

create table RALASAFE_USERCATEGORY
(
  ID          NUMBER not null,
  NAME        VARCHAR2(100) not null,
  DESCRIPTION VARCHAR2(500),
  INSTALLDATE DATE,
  FILENAME    VARCHAR2(40),
  PID         NUMBER,
  ISLEAF      NUMBER
);
alter table RALASAFE_USERCATEGORY
  add primary key (ID);
alter table RALASAFE_USERCATEGORY
  add unique (NAME);

create table USERTYPE
(
  NAME            VARCHAR2(100) not null,
  DESCRIPTION     VARCHAR2(500),
  USERMETADATAXML VARCHAR2(4000)
);
alter table USERTYPE
  add primary key (NAME);

create table RALASAFE_BACKUP
(
  ID          NUMBER not null,
  CREATETIME  TIMESTAMP(6),
  DESCRIPTION VARCHAR2(500),
  CONTENT     BLOB
);
alter table RALASAFE_BACKUP
  add primary key (ID);

prompt Disabling triggers for APPLICATION...
alter table APPLICATION disable all triggers;
prompt Disabling triggers for APPLICATIONUSERTYPE...
alter table APPLICATIONUSERTYPE disable all triggers;
prompt Disabling triggers for RALASAFE_BUSINESSDATA...
alter table RALASAFE_BUSINESSDATA disable all triggers;
prompt Disabling triggers for RALASAFE_DECISION_ENTITLEMENT...
alter table RALASAFE_DECISION_ENTITLEMENT disable all triggers;
prompt Disabling triggers for RALASAFE_PRIVILEGE...
alter table RALASAFE_PRIVILEGE disable all triggers;
prompt Disabling triggers for RALASAFE_QUERY...
alter table RALASAFE_QUERY disable all triggers;
prompt Disabling triggers for RALASAFE_QUERY_ENTITLEMENT...
alter table RALASAFE_QUERY_ENTITLEMENT disable all triggers;
prompt Disabling triggers for RALASAFE_ROLE...
alter table RALASAFE_ROLE disable all triggers;
prompt Disabling triggers for RALASAFE_RALASAFE_USERROLE...
alter table RALASAFE_RALASAFE_USERROLE disable all triggers;
prompt Disabling triggers for RALASAFE_ROLEPRIVILEGE...
alter table RALASAFE_ROLEPRIVILEGE disable all triggers;
prompt Disabling triggers for RALASAFE_SEQUENCE...
alter table RALASAFE_SEQUENCE disable all triggers;
prompt Disabling triggers for RALASAFE_USERCATEGORY...
alter table RALASAFE_USERCATEGORY disable all triggers;
prompt Disabling triggers for USERTYPE...
alter table USERTYPE disable all triggers;
prompt Disabling foreign key constraints for RALASAFE_RALASAFE_USERROLE...
alter table RALASAFE_RALASAFE_USERROLE disable constraint SYS_C0011292;
prompt Disabling foreign key constraints for RALASAFE_ROLEPRIVILEGE...
alter table RALASAFE_ROLEPRIVILEGE disable constraint SYS_C0011296;
alter table RALASAFE_ROLEPRIVILEGE disable constraint SYS_C0011297;
prompt Deleting USERTYPE...
delete from USERTYPE;
commit;
prompt Deleting RALASAFE_USERCATEGORY...
delete from RALASAFE_USERCATEGORY;
commit;
prompt Deleting RALASAFE_SEQUENCE...
delete from RALASAFE_SEQUENCE;
commit;
prompt Deleting RALASAFE_ROLEPRIVILEGE...
delete from RALASAFE_ROLEPRIVILEGE;
commit;
prompt Deleting RALASAFE_RALASAFE_USERROLE...
delete from RALASAFE_RALASAFE_USERROLE;
commit;
prompt Deleting RALASAFE_ROLE...
delete from RALASAFE_ROLE;
commit;
prompt Deleting RALASAFE_QUERY_ENTITLEMENT...
delete from RALASAFE_QUERY_ENTITLEMENT;
commit;
prompt Deleting RALASAFE_QUERY...
delete from RALASAFE_QUERY;
commit;
prompt Deleting RALASAFE_PRIVILEGE...
delete from RALASAFE_PRIVILEGE;
commit;
prompt Deleting RALASAFE_DECISION_ENTITLEMENT...
delete from RALASAFE_DECISION_ENTITLEMENT;
commit;
prompt Deleting RALASAFE_BUSINESSDATA...
delete from RALASAFE_BUSINESSDATA;
commit;
prompt Deleting APPLICATIONUSERTYPE...
delete from APPLICATIONUSERTYPE;
commit;
prompt Deleting APPLICATION...
delete from APPLICATION;
commit;
prompt Loading APPLICATION...
insert into APPLICATION (NAME, DESCRIPTION)
values ('ralasafe', 'ralasafe application');
commit;
prompt 1 records loaded
prompt Loading APPLICATIONUSERTYPE...
insert into APPLICATIONUSERTYPE (APPNAME, USERTYPENAME, USERMETADATASTR)
values ('ralasafe', 'ralasafe', 'id name companyName loginName password isManager companyId departmentId companyLevel ');
commit;
prompt 1 records loaded
prompt Loading RALASAFE_BUSINESSDATA...
insert into RALASAFE_BUSINESSDATA (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (1, 'Loan money', ' ', to_date('20-06-2011', 'dd-mm-yyyy'), null, 0, 0);
insert into RALASAFE_BUSINESSDATA (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (2, 'More than $5000 record', null, to_date('20-06-2011', 'dd-mm-yyyy'), '2_ralasafe.xml', 1, 1);
insert into RALASAFE_BUSINESSDATA (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (3, 'Plus today''''s loan amount,less than $20000 record', null, to_date('20-06-2011', 'dd-mm-yyyy'), '3_ralasafe.xml', 1, 1);
commit;
prompt 3 records loaded
prompt Loading RALASAFE_DECISION_ENTITLEMENT...
insert into RALASAFE_DECISION_ENTITLEMENT (ID, PRIVILEGEID, USERCATEGORYID, BUSINESSDATAID, EFFECT, DENYREASON)
values (1, 4, 7, 2, 'deny', 'The limit of each record is $5000.');
insert into RALASAFE_DECISION_ENTITLEMENT (ID, PRIVILEGEID, USERCATEGORYID, BUSINESSDATAID, EFFECT, DENYREASON)
values (2, 4, 7, 3, 'permit', 'The limit of each day is $20000.');
commit;
prompt 2 records loaded
prompt Loading RALASAFE_PRIVILEGE...
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (-6, -3, null, 'Role Admin', 1, 0, 0, 0, 'ROLE_ADMIN', null, '_self', 3);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (-5, -3, null, 'Assign Role To User', 1, 0, 0, 0, 'ASSIGN_ROLE_TO_USER', null, '_self', 2);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (-4, -3, 'Define policy, user category, business data and query.', 'Policy Admin', 1, 0, 0, 0, 'POLICY_ADMIN', null, '_self', 1);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (-3, 0, null, 'Ralasafe Admin', 0, 0, 0, 0, null, null, '_self', 0);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (1, 0, null, 'Employee Manager', 0, 0, 0, 0, null, null, '_self', 1);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (2, 1, null, 'Query Employee', 1, 0, 0, 0, 'QUERY_EMPLOYEE', null, '_self', 0);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (3, 0, null, 'Loan Money', 0, 0, 0, 0, null, null, '_self', 2);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (4, 3, null, 'Loan', 1, 0, 0, 0, 'LOAN', null, '_self', 0);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (5, 3, null, 'Query Loan', 1, 0, 0, 0, 'QUERY_LOAN', null, '_self', 1);
insert into RALASAFE_PRIVILEGE (ID, PID, DESCRIPTION, NAME, ISLEAF, DECISIONPOLICYCOMBALG, QUERYPOLICYCOMBALG, TYPE, CONSTANTNAME, URL, TARGET, ORDERNUM)
values (6, -1, null, 'Query Company', 1, 0, 0, 1, 'QUERY_COMPANY', null, '_self', 0);
commit;
prompt 10 records loaded
prompt Loading RALASAFE_QUERY...
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (-10, 'current user''s roles', 'Get current user''s roles', to_date('20-06-2011', 'dd-mm-yyyy'), '-10_ralasafe.xml', 0, 1);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (1, 'Query employee', null, to_date('20-06-2011', 'dd-mm-yyyy'), null, 0, 0);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (2, 'Query all employees', null, to_date('20-06-2011', 'dd-mm-yyyy'), '2_ralasafe.xml', 1, 1);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (3, 'Query branch and its sub-branchs employees', null, to_date('20-06-2011', 'dd-mm-yyyy'), '3_ralasafe.xml', 1, 1);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (4, 'Query my company employees', null, to_date('20-06-2011', 'dd-mm-yyyy'), '4_ralasafe.xml', 1, 1);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (5, 'Loan money', null, to_date('20-06-2011', 'dd-mm-yyyy'), null, 0, 0);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (8, 'Today loan money records', null, to_date('20-06-2011', 'dd-mm-yyyy'), '8_ralasafe.xml', 5, 1);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (9, 'Today loan money amount', null, to_date('20-06-2011', 'dd-mm-yyyy'), '9_ralasafe.xml', 5, 1);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (10, 'Query company', null, to_date('20-06-2011', 'dd-mm-yyyy'), null, 0, 0);
insert into RALASAFE_QUERY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (11, 'Query my company', null, to_date('20-06-2011', 'dd-mm-yyyy'), '11_ralasafe.xml', 10, 1);
commit;
prompt 10 records loaded
prompt Loading RALASAFE_QUERY_ENTITLEMENT...
insert into RALASAFE_QUERY_ENTITLEMENT (ID, PRIVILEGEID, USERCATEGORYID, QUERYID, DESCRIPTION)
values (1, 2, 6, 4, null);
insert into RALASAFE_QUERY_ENTITLEMENT (ID, PRIVILEGEID, USERCATEGORYID, QUERYID, DESCRIPTION)
values (2, 2, 5, 3, null);
insert into RALASAFE_QUERY_ENTITLEMENT (ID, PRIVILEGEID, USERCATEGORYID, QUERYID, DESCRIPTION)
values (3, 2, 4, 2, null);
insert into RALASAFE_QUERY_ENTITLEMENT (ID, PRIVILEGEID, USERCATEGORYID, QUERYID, DESCRIPTION)
values (4, 5, 7, 8, null);
insert into RALASAFE_QUERY_ENTITLEMENT (ID, PRIVILEGEID, USERCATEGORYID, QUERYID, DESCRIPTION)
values (5, 6, 7, 11, null);
commit;
prompt 5 records loaded
prompt Loading RALASAFE_ROLE...
insert into RALASAFE_ROLE (ID, NAME, DESCRIPTION)
values (-1, 'Ralasafe Administrator', null);
insert into RALASAFE_ROLE (ID, NAME, DESCRIPTION)
values (1, 'Hr specialist', null);
commit;
prompt 2 records loaded
prompt Loading RALASAFE_RALASAFE_USERROLE...
insert into RALASAFE_RALASAFE_USERROLE (USERID, ROLEID)
values (2, 1);
insert into RALASAFE_RALASAFE_USERROLE (USERID, ROLEID)
values (6, 1);
insert into RALASAFE_RALASAFE_USERROLE (USERID, ROLEID)
values (17, 1);
commit;
prompt 3 records loaded
prompt Loading RALASAFE_ROLEPRIVILEGE...
insert into RALASAFE_ROLEPRIVILEGE (ROLEID, PRIVILEGEID)
values (-1, -6);
insert into RALASAFE_ROLEPRIVILEGE (ROLEID, PRIVILEGEID)
values (-1, -5);
insert into RALASAFE_ROLEPRIVILEGE (ROLEID, PRIVILEGEID)
values (-1, -4);
insert into RALASAFE_ROLEPRIVILEGE (ROLEID, PRIVILEGEID)
values (1, 1);
insert into RALASAFE_ROLEPRIVILEGE (ROLEID, PRIVILEGEID)
values (1, 2);
insert into RALASAFE_ROLEPRIVILEGE (ROLEID, PRIVILEGEID)
values (1, 3);
insert into RALASAFE_ROLEPRIVILEGE (ROLEID, PRIVILEGEID)
values (1, 4);
insert into RALASAFE_ROLEPRIVILEGE (ROLEID, PRIVILEGEID)
values (1, 5);
commit;
prompt 8 records loaded
prompt Loading RALASAFE_SEQUENCE...
insert into RALASAFE_SEQUENCE (CURRENTVALUE, NAME)
values (3, 'ralasafe_businessdata_id');
insert into RALASAFE_SEQUENCE (CURRENTVALUE, NAME)
values (2, 'ralasafe_decision_entitlement_id');
insert into RALASAFE_SEQUENCE (CURRENTVALUE, NAME)
values (6, 'ralasafe_privilege_id');
insert into RALASAFE_SEQUENCE (CURRENTVALUE, NAME)
values (5, 'ralasafe_query_entitlement_id');
insert into RALASAFE_SEQUENCE (CURRENTVALUE, NAME)
values (11, 'ralasafe_query_id');
insert into RALASAFE_SEQUENCE (CURRENTVALUE, NAME)
values (1, 'ralasafe_role_id');
insert into RALASAFE_SEQUENCE (CURRENTVALUE, NAME)
values (8, 'ralasafe_usercategory_id');
commit;
prompt 7 records loaded
prompt Loading RALASAFE_USERCATEGORY...
insert into RALASAFE_USERCATEGORY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (-10, 'Role', null, to_date('20-06-2011', 'dd-mm-yyyy'), null, 0, 0);
insert into RALASAFE_USERCATEGORY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (1, 'Ralasafe Administrator', null, to_date('20-06-2011', 'dd-mm-yyyy'), '1_ralasafe.xml', -10, 1);
insert into RALASAFE_USERCATEGORY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (3, 'By company level', null, to_date('20-06-2011', 'dd-mm-yyyy'), null, 0, 0);
insert into RALASAFE_USERCATEGORY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (4, 'Head office users', null, to_date('20-06-2011', 'dd-mm-yyyy'), '4_ralasafe.xml', 3, 1);
insert into RALASAFE_USERCATEGORY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (5, 'Branch office users', null, to_date('20-06-2011', 'dd-mm-yyyy'), '5_ralasafe.xml', 3, 1);
insert into RALASAFE_USERCATEGORY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (6, 'Sub-branch office users', null, to_date('20-06-2011', 'dd-mm-yyyy'), '6_ralasafe.xml', 3, 1);
insert into RALASAFE_USERCATEGORY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (7, 'Anyone', null, to_date('20-06-2011', 'dd-mm-yyyy'), '7_ralasafe.xml', 0, 1);
insert into RALASAFE_USERCATEGORY (ID, NAME, DESCRIPTION, INSTALLDATE, FILENAME, PID, ISLEAF)
values (8, 'Hr specialist', null, to_date('20-06-2011', 'dd-mm-yyyy'), '8_ralasafe.xml', -10, 1);
commit;
prompt 8 records loaded
prompt Loading USERTYPE...
insert into USERTYPE (NAME, DESCRIPTION, USERMETADATAXML)
values ('ralasafe', 'ralasafe', '<?xml version="1.0"?>' || chr(13) || '' || chr(10) || '<user>' || chr(13) || '' || chr(10) || '' || chr(9) || '<table ds="app" name="mainTable" sqlName="UserView"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || 'uniqueFields="loginName">' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="id" columnName="id" sqlType="int" javaType="java.lang.Integer" />' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="name" columnName="name" sqlType="varchar(40)"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'javaType="java.lang.String" displayName="Name" show="true" />' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="companyName" columnName="companyName" sqlType="varchar(100)"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'javaType="java.lang.String" displayName="Company" show="true" />' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="loginName" columnName="loginName" sqlType="varchar(40)"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'javaType="java.lang.String" />' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="password" columnName="password" sqlType="varchar(40)"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'javaType="java.lang.String" />' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="isManager" columnName="isManager" sqlType="int"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'javaType="java.lang.Boolean" />' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="companyId" columnName="companyId" sqlType="int"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'javaType="java.lang.Integer" />' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="departmentId" columnName="departmentId" sqlType="int"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'javaType="java.lang.Integer" />' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '<field name="companyLevel" columnName="companyLevel" sqlType="int"' || chr(13) || '' || chr(10) || '' || chr(9) || '' || chr(9) || '' || chr(9) || 'javaType="java.lang.Integer" />' || chr(13) || '' || chr(10) || '' || chr(9) || '</table>' || chr(13) || '' || chr(10) || '</user>' || chr(13) || '' || chr(10) || '' || chr(13) || '' || chr(10) || '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ');
commit;
prompt 1 records loaded
prompt Enabling foreign key constraints for RALASAFE_RALASAFE_USERROLE...
alter table RALASAFE_RALASAFE_USERROLE enable constraint SYS_C0011292;
prompt Enabling foreign key constraints for RALASAFE_ROLEPRIVILEGE...
alter table RALASAFE_ROLEPRIVILEGE enable constraint SYS_C0011296;
alter table RALASAFE_ROLEPRIVILEGE enable constraint SYS_C0011297;
prompt Enabling triggers for APPLICATION...
alter table APPLICATION enable all triggers;
prompt Enabling triggers for APPLICATIONUSERTYPE...
alter table APPLICATIONUSERTYPE enable all triggers;
prompt Enabling triggers for RALASAFE_BUSINESSDATA...
alter table RALASAFE_BUSINESSDATA enable all triggers;
prompt Enabling triggers for RALASAFE_DECISION_ENTITLEMENT...
alter table RALASAFE_DECISION_ENTITLEMENT enable all triggers;
prompt Enabling triggers for RALASAFE_PRIVILEGE...
alter table RALASAFE_PRIVILEGE enable all triggers;
prompt Enabling triggers for RALASAFE_QUERY...
alter table RALASAFE_QUERY enable all triggers;
prompt Enabling triggers for RALASAFE_QUERY_ENTITLEMENT...
alter table RALASAFE_QUERY_ENTITLEMENT enable all triggers;
prompt Enabling triggers for RALASAFE_ROLE...
alter table RALASAFE_ROLE enable all triggers;
prompt Enabling triggers for RALASAFE_RALASAFE_USERROLE...
alter table RALASAFE_RALASAFE_USERROLE enable all triggers;
prompt Enabling triggers for RALASAFE_ROLEPRIVILEGE...
alter table RALASAFE_ROLEPRIVILEGE enable all triggers;
prompt Enabling triggers for RALASAFE_SEQUENCE...
alter table RALASAFE_SEQUENCE enable all triggers;
prompt Enabling triggers for RALASAFE_USERCATEGORY...
alter table RALASAFE_USERCATEGORY enable all triggers;
prompt Enabling triggers for USERTYPE...
alter table USERTYPE enable all triggers;
set feedback on
set define on
prompt Done.
