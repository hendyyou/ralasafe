-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51a-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mydemo
--

CREATE DATABASE IF NOT EXISTS mydemo;
USE mydemo;

--
-- Temporary table structure for view `userview`
--
DROP TABLE IF EXISTS `userview`;
DROP VIEW IF EXISTS `userview`;
CREATE TABLE `userview` (
  `id` int(11),
  `loginName` varchar(30),
  `name` varchar(30),
  `password` varchar(30),
  `companyId` int(11),
  `departmentId` int(11),
  `isManager` int(11),
  `hireDate` datetime,
  `companyLevel` int(11),
  `companyName` varchar(30)
);
--
-- Create schema ralasafe
--

CREATE DATABASE IF NOT EXISTS ralasafe;
USE ralasafe;

--
-- Definition of table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `name` varchar(100) NOT NULL,
  `description` varchar(500) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application`
--

/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` (`name`,`description`) VALUES 
 ('ralasafe','ralasafe application');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;


--
-- Definition of table `applicationusertype`
--

DROP TABLE IF EXISTS `applicationusertype`;
CREATE TABLE `applicationusertype` (
  `appName` varchar(100) NOT NULL,
  `userTypeName` varchar(100) NOT NULL,
  `userMetadataStr` varchar(1000) default NULL,
  PRIMARY KEY  (`appName`,`userTypeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applicationusertype`
--

/*!40000 ALTER TABLE `applicationusertype` DISABLE KEYS */;
INSERT INTO `applicationusertype` (`appName`,`userTypeName`,`userMetadataStr`) VALUES 
 ('ralasafe','ralasafe','id name companyName loginName password isManager companyId departmentId companyLevel ');
/*!40000 ALTER TABLE `applicationusertype` ENABLE KEYS */;


--
-- Definition of table `ralasafe_backup`
--

DROP TABLE IF EXISTS `ralasafe_backup`;
CREATE TABLE `ralasafe_backup` (
  `id` int(11) NOT NULL,
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `description` varchar(500) default NULL,
  `content` blob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_backup`
--

/*!40000 ALTER TABLE `ralasafe_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ralasafe_backup` ENABLE KEYS */;


--
-- Definition of table `ralasafe_businessdata`
--

DROP TABLE IF EXISTS `ralasafe_businessdata`;
CREATE TABLE `ralasafe_businessdata` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) default NULL,
  `installDate` date default NULL,
  `fileName` varchar(40) default NULL,
  `pid` int(11) default NULL,
  `isLeaf` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_businessdata`
--

/*!40000 ALTER TABLE `ralasafe_businessdata` DISABLE KEYS */;
INSERT INTO `ralasafe_businessdata` (`id`,`name`,`description`,`installDate`,`fileName`,`pid`,`isLeaf`) VALUES 
 (1,'Loan money','','2011-06-20',NULL,0,0),
 (2,'More than $5000 record','','2011-06-20','2_ralasafe.xml',1,1),
 (3,'Plus today\'s loan amount,less than $20000 record','','2011-06-20','3_ralasafe.xml',1,1);
/*!40000 ALTER TABLE `ralasafe_businessdata` ENABLE KEYS */;


--
-- Definition of table `ralasafe_decision_entitlement`
--

DROP TABLE IF EXISTS `ralasafe_decision_entitlement`;
CREATE TABLE `ralasafe_decision_entitlement` (
  `id` int(11) NOT NULL,
  `privilegeId` int(11) default NULL,
  `userCategoryId` int(11) default NULL,
  `businessDataId` int(11) default NULL,
  `effect` varchar(100) default NULL,
  `denyReason` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_decision_entitlement`
--

/*!40000 ALTER TABLE `ralasafe_decision_entitlement` DISABLE KEYS */;
INSERT INTO `ralasafe_decision_entitlement` (`id`,`privilegeId`,`userCategoryId`,`businessDataId`,`effect`,`denyReason`) VALUES 
 (1,4,7,2,'deny','The limit of each record is $5000.'),
 (2,4,7,3,'permit','The limit of each day is $20000.');
/*!40000 ALTER TABLE `ralasafe_decision_entitlement` ENABLE KEYS */;


--
-- Definition of table `ralasafe_privilege`
--

DROP TABLE IF EXISTS `ralasafe_privilege`;
CREATE TABLE `ralasafe_privilege` (
  `id` int(11) NOT NULL,
  `pid` int(11) default NULL,
  `description` varchar(500) default NULL,
  `name` varchar(100) NOT NULL,
  `isLeaf` int(11) default NULL,
  `decisionPolicyCombAlg` int(11) default NULL,
  `queryPolicyCombAlg` int(11) default NULL,
  `type` int(11) default NULL,
  `constantName` varchar(40) default NULL,
  `url` varchar(100) default NULL,
  `target` varchar(20) default NULL,
  `orderNum` int(11) default NULL,
  `display` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_privilege`
--

/*!40000 ALTER TABLE `ralasafe_privilege` DISABLE KEYS */;
INSERT INTO `ralasafe_privilege` (`id`,`pid`,`description`,`name`,`isLeaf`,`decisionPolicyCombAlg`,`queryPolicyCombAlg`,`type`,`constantName`,`url`,`target`,`orderNum`,`display`) VALUES 
 (-6,-3,'','Role Admin',1,0,0,0,'ROLE_ADMIN','','_self',3,1),
 (-5,-3,'','Assign Role To User',1,0,0,0,'ASSIGN_ROLE_TO_USER','','_self',2,1),
 (-4,-3,'Define policy, user category, business data and query.','Policy Admin',1,0,0,0,'POLICY_ADMIN','','_self',1,1),
 (-3,0,'','Ralasafe Admin',0,0,0,0,'','','_self',0,1),
 (1,0,'','Employee Manager',0,0,0,0,'','','_self',1,1),
 (2,1,'','Query Employee',1,0,0,0,'QUERY_EMPLOYEE','','_self',0,1),
 (3,0,'','Loan Money',0,0,0,0,'','','_self',2,1),
 (4,3,'','Loan',1,0,0,0,'LOAN','','_self',0,1),
 (5,3,'','Query Loan',1,0,0,0,'QUERY_LOAN','','_self',1,1),
 (6,-1,'','Query Company',1,0,0,1,'QUERY_COMPANY','','_self',0,1);
/*!40000 ALTER TABLE `ralasafe_privilege` ENABLE KEYS */;


--
-- Definition of table `ralasafe_query`
--

DROP TABLE IF EXISTS `ralasafe_query`;
CREATE TABLE `ralasafe_query` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) default NULL,
  `installDate` date default NULL,
  `fileName` varchar(40) default NULL,
  `pid` int(11) default NULL,
  `isLeaf` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_query`
--

/*!40000 ALTER TABLE `ralasafe_query` DISABLE KEYS */;
INSERT INTO `ralasafe_query` (`id`,`name`,`description`,`installDate`,`fileName`,`pid`,`isLeaf`) VALUES 
 (-10,'current user\'s roles','Get current user\'s roles','2011-06-20','-10_ralasafe.xml',0,1),
 (1,'Query employee','','2011-06-20',NULL,0,0),
 (2,'Query all employees','','2011-06-20','2_ralasafe.xml',1,1),
 (3,'Query branch and its sub-branchs employees','','2011-06-20','3_ralasafe.xml',1,1),
 (4,'Query my company employees','','2011-06-20','4_ralasafe.xml',1,1),
 (5,'Loan money','','2011-06-20',NULL,0,0),
 (8,'Today loan money records','','2011-06-20','8_ralasafe.xml',5,1),
 (9,'Today loan money amount','','2011-06-20','9_ralasafe.xml',5,1),
 (10,'Query company','','2011-06-20',NULL,0,0),
 (11,'Query my company','','2011-06-20','11_ralasafe.xml',10,1);
/*!40000 ALTER TABLE `ralasafe_query` ENABLE KEYS */;


--
-- Definition of table `ralasafe_query_entitlement`
--

DROP TABLE IF EXISTS `ralasafe_query_entitlement`;
CREATE TABLE `ralasafe_query_entitlement` (
  `id` int(11) NOT NULL,
  `privilegeId` int(11) default NULL,
  `userCategoryId` int(11) default NULL,
  `queryId` int(11) default NULL,
  `description` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_query_entitlement`
--

/*!40000 ALTER TABLE `ralasafe_query_entitlement` DISABLE KEYS */;
INSERT INTO `ralasafe_query_entitlement` (`id`,`privilegeId`,`userCategoryId`,`queryId`,`description`) VALUES 
 (1,2,6,4,''),
 (2,2,5,3,''),
 (3,2,4,2,''),
 (4,5,7,8,''),
 (5,6,7,11,'');
/*!40000 ALTER TABLE `ralasafe_query_entitlement` ENABLE KEYS */;


--
-- Definition of table `ralasafe_ralasafe_userrole`
--

DROP TABLE IF EXISTS `ralasafe_ralasafe_userrole`;
CREATE TABLE `ralasafe_ralasafe_userrole` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`roleid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `ralasafe_ralasafe_userrole_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `ralasafe_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_ralasafe_userrole`
--

/*!40000 ALTER TABLE `ralasafe_ralasafe_userrole` DISABLE KEYS */;
INSERT INTO `ralasafe_ralasafe_userrole` (`userid`,`roleid`) VALUES 
 (2,1),
 (6,1),
 (17,1);
/*!40000 ALTER TABLE `ralasafe_ralasafe_userrole` ENABLE KEYS */;


--
-- Definition of table `ralasafe_role`
--

DROP TABLE IF EXISTS `ralasafe_role`;
CREATE TABLE `ralasafe_role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_role`
--

/*!40000 ALTER TABLE `ralasafe_role` DISABLE KEYS */;
INSERT INTO `ralasafe_role` (`id`,`name`,`description`) VALUES 
 (-1,'Ralasafe Administrator',NULL),
 (1,'Hr specialist','');
/*!40000 ALTER TABLE `ralasafe_role` ENABLE KEYS */;


--
-- Definition of table `ralasafe_roleprivilege`
--

DROP TABLE IF EXISTS `ralasafe_roleprivilege`;
CREATE TABLE `ralasafe_roleprivilege` (
  `roleid` int(11) NOT NULL,
  `privilegeid` int(11) NOT NULL,
  PRIMARY KEY  (`roleid`,`privilegeid`),
  KEY `privilegeid` (`privilegeid`),
  CONSTRAINT `ralasafe_roleprivilege_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `ralasafe_role` (`id`),
  CONSTRAINT `ralasafe_roleprivilege_ibfk_2` FOREIGN KEY (`privilegeid`) REFERENCES `ralasafe_privilege` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_roleprivilege`
--

/*!40000 ALTER TABLE `ralasafe_roleprivilege` DISABLE KEYS */;
INSERT INTO `ralasafe_roleprivilege` (`roleid`,`privilegeid`) VALUES 
 (-1,-6),
 (-1,-5),
 (-1,-4),
 (1,1),
 (1,2),
 (1,3),
 (1,4),
 (1,5);
/*!40000 ALTER TABLE `ralasafe_roleprivilege` ENABLE KEYS */;


--
-- Definition of table `ralasafe_sequence`
--

DROP TABLE IF EXISTS `ralasafe_sequence`;
CREATE TABLE `ralasafe_sequence` (
  `currentValue` int(11) default NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_sequence`
--

/*!40000 ALTER TABLE `ralasafe_sequence` DISABLE KEYS */;
INSERT INTO `ralasafe_sequence` (`currentValue`,`name`) VALUES 
 (3,'ralasafe_businessdata_id'),
 (2,'ralasafe_decision_entitlement_id'),
 (6,'ralasafe_privilege_id'),
 (5,'ralasafe_query_entitlement_id'),
 (11,'ralasafe_query_id'),
 (1,'ralasafe_role_id'),
 (8,'ralasafe_usercategory_id');
/*!40000 ALTER TABLE `ralasafe_sequence` ENABLE KEYS */;


--
-- Definition of table `ralasafe_usercategory`
--

DROP TABLE IF EXISTS `ralasafe_usercategory`;
CREATE TABLE `ralasafe_usercategory` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) default NULL,
  `installDate` date default NULL,
  `fileName` varchar(40) default NULL,
  `pid` int(11) default NULL,
  `isLeaf` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_usercategory`
--

/*!40000 ALTER TABLE `ralasafe_usercategory` DISABLE KEYS */;
INSERT INTO `ralasafe_usercategory` (`id`,`name`,`description`,`installDate`,`fileName`,`pid`,`isLeaf`) VALUES 
 (-10,'Role','','2011-06-20',NULL,0,0),
 (1,'Ralasafe Administrator',NULL,'2011-06-20','1_ralasafe.xml',-10,1),
 (3,'By company level','','2011-06-20',NULL,0,0),
 (4,'Head office users','','2011-06-20','4_ralasafe.xml',3,1),
 (5,'Branch office users','','2011-06-20','5_ralasafe.xml',3,1),
 (6,'Sub-branch office users','','2011-06-20','6_ralasafe.xml',3,1),
 (7,'Anyone','','2011-06-20','7_ralasafe.xml',0,1),
 (8,'Hr specialist','','2011-06-20','8_ralasafe.xml',-10,1);
/*!40000 ALTER TABLE `ralasafe_usercategory` ENABLE KEYS */;


--
-- Definition of table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `name` varchar(100) NOT NULL,
  `description` varchar(500) default NULL,
  `userMetadataXML` varchar(4000) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertype`
--

/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` (`name`,`description`,`userMetadataXML`) VALUES 
 ('ralasafe','ralasafe demo','<?xml version=\"1.0\"?>\r\n<user>\r\n	<table ds=\"app\" name=\"mainTable\" sqlName=\"UserView\"\r\n		uniqueFields=\"loginName\">\r\n		<field name=\"id\" columnName=\"id\" sqlType=\"int\" javaType=\"java.lang.Integer\" />\r\n		<field name=\"name\" columnName=\"name\" sqlType=\"varchar(40)\"\r\n			javaType=\"java.lang.String\" displayName=\"Name\" show=\"true\" />\r\n		<field name=\"companyName\" columnName=\"companyName\" sqlType=\"varchar(100)\"\r\n			javaType=\"java.lang.String\" displayName=\"Company\" show=\"true\" />\r\n		<field name=\"loginName\" columnName=\"loginName\" sqlType=\"varchar(40)\"\r\n			javaType=\"java.lang.String\" />\r\n		<field name=\"password\" columnName=\"password\" sqlType=\"varchar(40)\"\r\n			javaType=\"java.lang.String\" />\r\n		<field name=\"isManager\" columnName=\"isManager\" sqlType=\"int\"\r\n			javaType=\"java.lang.Boolean\" />\r\n		<field name=\"companyId\" columnName=\"companyId\" sqlType=\"int\"\r\n			javaType=\"java.lang.Integer\" />\r\n		<field name=\"departmentId\" columnName=\"departmentId\" sqlType=\"int\"\r\n			javaType=\"java.lang.Integer\" />\r\n		<field name=\"companyLevel\" columnName=\"companyLevel\" sqlType=\"int\"\r\n			javaType=\"java.lang.Integer\" />\r\n	</table>\r\n</user>\r\n\r\n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;

--
-- Create schema mydemo
--

CREATE DATABASE IF NOT EXISTS mydemo;
USE mydemo;

--
-- Definition of table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `parentId` int(11) default NULL,
  `companyLevel` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id`,`name`,`parentId`,`companyLevel`) VALUES 
 (1,'Head Office',0,1),
 (2,'California Branch',1,2),
 (3,'Texas Branch',1,2),
 (4,'San Francisco Sub-branch',2,3),
 (5,'Los Angeles Sub-branch',2,3),
 (6,'San Jose Sub-branch',2,3),
 (7,'Houston Sub-branch',3,3),
 (8,'San Antonio Sub-branch',3,3),
 (9,'Dallas Sub-branch',3,3),
 (10,'San Diego Sub-branch',2,3);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


--
-- Definition of table `demouser`
--

DROP TABLE IF EXISTS `demouser`;
CREATE TABLE `demouser` (
  `id` int(11) NOT NULL auto_increment,
  `loginName` varchar(30) default NULL,
  `name` varchar(30) default NULL,
  `password` varchar(30) default NULL,
  `companyId` int(11) default NULL,
  `departmentId` int(11) default NULL,
  `isManager` int(11) default NULL,
  `hireDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `demouser`
--

/*!40000 ALTER TABLE `demouser` DISABLE KEYS */;
INSERT INTO `demouser` (`id`,`loginName`,`name`,`password`,`companyId`,`departmentId`,`isManager`,`hireDate`) VALUES 
 (1,'Kenzie Jaiden','Kenzie Jaiden','password',1,2,1,'2008-01-02 00:00:00'),
 (2,'Alexis Stark','Alexis Stark','password',1,4,1,'2008-01-05 00:00:00'),
 (3,'Kerri Hatcher','Kerri Hatcher','password',1,3,1,'2008-01-22 00:00:00'),
 (4,'Janie Marie','Janie Marie','password',1,3,0,'2008-02-02 00:00:00'),
 (5,'Kathleen Woodiwiss','Kathleen Woodiwiss','password',1,3,0,'2008-02-12 00:00:00'),
 (6,'John Smith','John Smith','password',2,4,0,'2008-02-20 00:00:00'),
 (7,'Gabrielle Phillips','Gabrielle Phillips','password',2,3,0,'2008-02-02 00:00:00'),
 (8,'Haylee Ellington','Haylee Ellington','password',2,3,1,'2008-03-02 00:00:00'),
 (9,'Lydia Nelson','Lydia Nelson','password',2,1,0,'2008-03-12 00:00:00'),
 (10,'Jaiden Matthew','Jaiden Matthew','password',3,4,0,'2008-03-22 00:00:00'),
 (11,'Jeremy Steven','Jeremy Steven','password',3,3,0,'2008-04-02 00:00:00'),
 (12,'Savannah Paula','Savannah Paula','password',3,3,1,'2008-04-12 00:00:00'),
 (13,'Ava Rose','Ava Rose','password',3,1,0,'2008-04-22 00:00:00'),
 (14,'Steven Douglas','Steven Douglas','password',4,3,0,'2008-05-02 00:00:00'),
 (15,'Kaylee Marae','Kaylee Marae','password',4,4,0,'2008-05-12 00:00:00'),
 (16,'Hayden Panettiere','Hayden Panettiere','password',5,3,0,'2008-05-22 00:00:00'),
 (17,'Camylle Boyd','Camylle Boyd','password',5,4,0,'2008-06-12 00:00:00'),
 (18,'Tracey Miklesavage','Tracey Miklesavage','password',6,3,0,'2008-06-22 00:00:00'),
 (19,'Chaleena Watson','Chaleena Watson','password',6,4,0,'2008-06-15 00:00:00'),
 (20,'Kaylee Avery','Kaylee Avery','password',7,3,0,'2008-07-15 00:00:00'),
 (21,'Brooke Paiton','Brooke Paiton','password',7,4,0,'2008-07-25 00:00:00'),
 (22,'Avah Analise','Avah Analise','password',8,3,0,'2008-07-03 00:00:00'),
 (23,'Chase Elizabeth','Chase Elizabeth','password',8,4,0,'2008-08-03 00:00:00'),
 (24,'April Alexander','April Alexander','password',9,3,0,'2008-08-13 00:00:00'),
 (25,'Brandon Cole','Brandon Cole','password',9,4,0,'2008-08-23 00:00:00'),
 (26,'Kelly Freeman','Kelly Freeman','password',10,3,0,'2008-08-03 00:00:00'),
 (27,'Lauren Nicole','Lauren Nicole','password',10,4,0,'2008-09-03 00:00:00'),
 (29,'Caitlyn Derderian','Caitlyn Derderian','password',1,2,0,'2008-09-13 00:00:00'),
 (30,'Angeles Corona','Angeles Corona','password',2,2,1,'2008-09-23 00:00:00'),
 (31,'Ambrozia Shelley','Ambrozia Shelley','password',2,2,0,'2008-09-07 00:00:00'),
 (32,'Cindy Lawson','Cindy Lawson','password',3,2,1,'2008-10-03 00:00:00'),
 (33,'Michelle Steinke','Michelle Steinke','password',3,2,0,'2008-10-13 00:00:00'),
 (34,'Stacie Ferguson','Stacie Ferguson','password',4,2,1,'2008-10-14 00:00:00'),
 (35,'Clare Matthews','Clare Matthews','password',4,2,0,'2008-10-15 00:00:00'),
 (36,'Lauren McIntosh','Lauren McIntosh','password',5,2,1,'2008-10-16 00:00:00'),
 (37,'Amber Stanley','Amber Stanley','password',5,2,0,'2008-11-17 00:00:00'),
 (38,'Jenna Lyn','Jenna Lyn','password',6,2,1,'2008-11-10 00:00:00'),
 (39,'Steven Michael','Steven Michael','password',6,2,0,'2008-11-21 00:00:00'),
 (40,'James Paul','James Paul','password',7,2,1,'2008-11-07 00:00:00'),
 (41,'Hayden Nicole','Hayden Nicole','password',7,2,0,'2008-12-07 00:00:00'),
 (42,'Jimmy Greg','Jimmy Greg','password',8,2,1,'2008-12-09 00:00:00'),
 (43,'Billy Joe','Billy Joe','password',8,2,0,'2008-12-16 00:00:00'),
 (44,'Andrea Lee','Andrea Lee','password',9,2,1,'2008-12-26 00:00:00'),
 (45,'John Ridgley','John Ridgley','password',9,2,0,'2009-01-11 00:00:00'),
 (46,'Sierra Shaffer','Sierra Shaffer','password',10,2,1,'2009-01-22 00:00:00'),
 (47,'Kimberly Perry','Kimberly Perry','password',10,2,0,'2009-01-23 00:00:00'),
 (48,'Ella Kate','Ella Kate','password',1,4,0,'2009-01-13 00:00:00'),
 (49,'Sophie Britton','Sophie Britton','password',2,4,1,'2009-02-23 00:00:00'),
 (50,'Kassy Smith','Kassy Smith','password',3,4,1,'2009-02-02 00:00:00'),
 (51,'Amanda Christine','Amanda Christine','password',4,4,1,'2009-02-12 00:00:00'),
 (52,'Dalton Grace','Dalton Grace','password',5,4,1,'2009-02-17 00:00:00'),
 (53,'Jenna Carter','Jenna Carter','password',6,4,1,'2009-03-12 00:00:00'),
 (54,'Allison Welch','Allison Welch','password',7,4,1,'2009-04-12 00:00:00'),
 (55,'Roxy Garcia','Roxy Garcia','password',8,4,1,'2009-05-12 00:00:00'),
 (56,'Elizabeth Stamper','Elizabeth Stamper','password',9,4,1,'2009-03-22 00:00:00'),
 (57,'Lizzy Pendrey','Lizzy Pendrey','password',10,4,1,'2009-04-07 00:00:00');
/*!40000 ALTER TABLE `demouser` ENABLE KEYS */;


--
-- Definition of table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `parentId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`id`,`name`,`parentId`) VALUES 
 (1,'Finance & Accounting',0),
 (2,'Research & Development',0),
 (3,'Sales',0),
 (4,'Human Resources',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


--
-- Definition of table `loan_money`
--

DROP TABLE IF EXISTS `loan_money`;
CREATE TABLE `loan_money` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `money` int(11) default NULL,
  `loanDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loan_money`
--

/*!40000 ALTER TABLE `loan_money` DISABLE KEYS */;
INSERT INTO `loan_money` (`id`,`userId`,`money`,`loanDate`) VALUES 
 (64,2,5000,'2011-06-20'),
 (65,2,5000,'2011-06-20'),
 (66,2,5000,'2011-06-20'),
 (67,2,5000,'2011-06-20');
/*!40000 ALTER TABLE `loan_money` ENABLE KEYS */;


--
-- Definition of table `ralasafe_sequence`
--

DROP TABLE IF EXISTS `ralasafe_sequence`;
CREATE TABLE `ralasafe_sequence` (
  `currentValue` int(11) default NULL,
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ralasafe_sequence`
--

/*!40000 ALTER TABLE `ralasafe_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `ralasafe_sequence` ENABLE KEYS */;


--
-- Definition of view `userview`
--

DROP TABLE IF EXISTS `userview`;
DROP VIEW IF EXISTS `userview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userview` AS select `u`.`id` AS `id`,`u`.`loginName` AS `loginName`,`u`.`name` AS `name`,`u`.`password` AS `password`,`u`.`companyId` AS `companyId`,`u`.`departmentId` AS `departmentId`,`u`.`isManager` AS `isManager`,`u`.`hireDate` AS `hireDate`,`c`.`companyLevel` AS `companyLevel`,`c`.`name` AS `companyName` from (`demouser` `u` join `company` `c`) where (`u`.`companyId` = `c`.`id`);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
