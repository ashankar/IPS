/*
SQLyog Community Edition- MySQL GUI v8.05 
MySQL - 5.0.75-0ubuntu10.3 : Database - qmsdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`qmsdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `qmsdb`;

/*Table structure for table `circular` */

DROP TABLE IF EXISTS `circular`;

CREATE TABLE `circular` (
  `c_id` varchar(20) NOT NULL,
  `c_subject` char(30) default NULL,
  `c_description` varchar(30000) default NULL,
  `c_date` date default NULL,
  `issued_by` varchar(30) default NULL,
  `issued_to` varchar(30) default NULL,
  UNIQUE KEY `c_id` (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `circular` */

/*Table structure for table `coodinator` */

DROP TABLE IF EXISTS `coodinator`;

CREATE TABLE `coodinator` (
  `Sl_No` int(10) NOT NULL auto_increment,
  `Pro_Name` varchar(25) default NULL,
  `Emp_Id` varchar(25) default NULL,
  `school` varchar(50) default NULL,
  `Design` varchar(50) default NULL,
  `Program` varchar(100) default NULL,
  `Course` varchar(100) default NULL,
  `Contact_No` varchar(100) default NULL,
  `email_id` varchar(50) default NULL,
  PRIMARY KEY  (`Sl_No`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;

/*Data for the table `coodinator` */

insert  into `coodinator`(`Sl_No`,`Pro_Name`,`Emp_Id`,`school`,`Design`,`Program`,`Course`,`Contact_No`,`email_id`) values (1,'Naveen Kumar',NULL,'SOCIS','PC','MCA','MCA','9313039979','naveenkumar@ignou.ac.in'),(2,'Akshay Kumar',NULL,'SOCIS','PC','MCA','MCA','9968261055','akshay@ignou.ac.in'),(3,'Manohar Lal',NULL,'SOCIS','PC','MCA','PHD',NULL,'mlal@ignou.ac.in'),(4,'Shashi Bhusan',NULL,'SOCIS','PC','BIT','BIT',NULL,'shashibhusan@ignou.ac.in'),(5,'Akshay Kumar',NULL,'SOCIS','PC','ADIT','ADIT',NULL,'akshay@ignou.ac.in'),(6,'MP. Mishra',NULL,'SOCIS','PC','BCA','BCA',NULL,'mpmishra@ignou.ac.in'),(7,'Naveen Kumar',NULL,'SOCIS','CC','MCA','CS-02','9313039979','naveenkumar@ignou.ac.in'),(8,'Akshay Kumar',NULL,'SOCIS','CC','MCA','CS-03','9968261055','akshay@ignou.ac.in'),(9,'Akshay Kumar',NULL,'SOCIS','CC','MCA','CS-04','9968261055','akshay@ignou.ac.in'),(10,'P V Suresh',NULL,'SOCIS','CC','MCA','CS-05',NULL,'pvsuresh@ignou.ac.in'),(11,'Akshay Kumar',NULL,'SOCIS','CC','MCA','CS-01','9968261055','akshay@ignou.ac.in'),(13,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','CS-09',NULL,'shashibhusan@ignou.ac.in'),(14,'Manohar Lal',NULL,'SOCIS','CC','MCA','CS-51',NULL,'mlal@ignou.ac.in'),(15,'M.P Mishra',NULL,'SOCIS','CC','MCA','CS_07',NULL,'mpmishra@ignou.ac.in'),(16,'P V Suresh',NULL,'SOCIS','CC','MCA','CS-10',NULL,'pvsuresh@ignou.ac.in'),(17,'Manohar Lal',NULL,'SOCIS','CC','MCA','CS-54',NULL,'mlal@ignou.ac.in'),(18,'MP. Mishra',NULL,'SOCIS','CC','MCA','CS-16',NULL,'mpmishra@ignou.ac.in'),(19,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','CS-12',NULL,'shashibhusan@ignou.ac.in'),(20,'Naveen Kumar',NULL,'SOCIS','CC','MCA','CS-17','9313039979','naveenkumar@ignou.ac.in'),(21,'Naveen Kumar',NULL,'SOCIS','CC','MCA','CS-13','9313039979','naveenkumar@ignou.ac.in'),(22,'Manohar Lal',NULL,'SOCIS','CC','MCA','CS-14',NULL,'mlal@ignou.ac.in'),(23,'Akshay Kumar',NULL,'SOCIS','CC','MCA','CS-15',NULL,'akshay@ignou.ac.in'),(24,'Naveen Kumar',NULL,'SOCIS','CC','MCA','CS-17',NULL,'naveenkumar@ignou.ac.in'),(25,'M.P Mishra',NULL,'SOCIS','CC','MCA','CS-011',NULL,'mpmishra@ignou.ac.in'),(26,'Akshay Kumar',NULL,'SOCIS','CC','MCA','MCS-012',NULL,'akshay@ignou.ac.in'),(27,'M.P Mishra',NULL,'SOCIS','CC','MCA','MCS-013',NULL,'mpmishra@ignou.ac.in'),(28,'P V Suresh',NULL,'SOCIS','CC','MCA','MCS-014',NULL,'pvsuresh@ignou.ac.in'),(29,'Anju',NULL,'SOCIS','CC','MCA','MCS-014',NULL,NULL),(30,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','MCS-016',NULL,'shashibhusan@ignou.ac.in'),(31,'Naveen Kumar',NULL,'SOCIS','CC','MCA','MCSL-017','9313039979','naveenkumar@ignou.ac.in'),(32,'P V Suresh',NULL,'SOCIS','CC','MCA','MCS-021',NULL,'pvsuresh@ignou.ac.in'),(33,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','MCS-022',NULL,'shashibhusan@ignou.ac.in'),(34,'Akshay Kumar',NULL,'SOCIS','CC','MCA','MCS-023',NULL,'akshay@ignou.ac.in'),(35,'M.P Mishra',NULL,'SOCIS','CC','MCA','MCS-024',NULL,'mpmishra@ignou.ac.in'),(36,'Naveen Kumar',NULL,'SOCIS','CC','MCA','MCSL-025','9313039979','naveenkumar@ignou.ac.in'),(37,'Manohar Lal',NULL,'SOCIS','CC','MCA','MCS-031',NULL,'mlal@ignou.ac.in'),(38,'M.P Mishra',NULL,'SOCIS','CC','MCA','MCS-032',NULL,'mpmishra@ignou.ac.in'),(39,'Manohar Lal',NULL,'SOCIS','CC','MCA','MCS-033',NULL,'mlal@ignou.ac.in'),(40,'P V Suresh',NULL,'SOCIS','CC','MCA','MCS-034',NULL,'pvsuresh@ignou.ac.in'),(41,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','MCS-035',NULL,'shashibhusan@ignou.ac.in'),(42,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','MCSL-036',NULL,'shashibhusan@ignou.ac.in'),(43,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','MCS-041',NULL,'shashibhusan@ignou.ac.in'),(44,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','MCS-042',NULL,'shashibhusan@ignou.ac.in'),(45,'Akshay Kumar',NULL,'SOCIS','CC','MCA','MCS-043',NULL,'akshay@ignou.ac.in'),(46,'Naveen Kumar',NULL,'SOCIS','CC','MCA','MCS-044','9313039979','naveenkumar@ignou.ac.in'),(47,'Akshay Kumar',NULL,'SOCIS','CC','MCA','MCSL-045',NULL,'akshay@ignou.ac.in'),(48,'Shashi Bhusan',NULL,'SOCIS','CC','MCA','MCS-051',NULL,'shashibhusan@ignou.ac.in'),(49,'Naveen Kumar',NULL,'SOCIS','CC','MCA','MCS-052','9313039979','naveenkumar@ignou.ac.in'),(50,'Akshay Kumar',NULL,'SOCIS','CC','MCA','MCS-053',NULL,'akshay@ignou.ac.in'),(51,'M.P Mishra',NULL,'SOCIS','CC','MCA','MCS-054',NULL,'mpmishra@ignou.ac.in'),(52,'Manohar Lal',NULL,'SOCIS','CC','MCA','MCSE-003',NULL,'mlal@ignou.ac.in'),(53,'Manohar Lal',NULL,'SOCIS','CC','MCA','MCSE-004',NULL,'mlal@ignou.ac.in'),(54,'Manohar Lal',NULL,'SOCIS','CC','MCA','MCSE-011',NULL,'mlal@ignou.ac.in'),(55,'Naveen Kumar',NULL,'SOCIS','CC','MCA','MCSP-060','9313039979','naveenkumar@ignou.ac.in'),(56,'SOH',NULL,'SOCIS','CC','BCA','CS-610',NULL,NULL),(57,'SOH',NULL,'SOCIS','CC','BCA','FHS-01',NULL,NULL),(58,'M.P Mishra',NULL,'SOCIS','CC','BCA','CS-611',NULL,'mpmishra@ignou.ac.in'),(59,'M.P Mishra',NULL,'SOCIS','CC','BCA','CS-612',NULL,'mpmishra@ignou.ac.in'),(60,'Manohar Lal',NULL,'SOCIS','CC','BCA','CS-60',NULL,'mlal@ignou.ac.in'),(61,'Akshay Kumar',NULL,'SOCIS','CC','BCA','CS-62',NULL,'akshay@ignou.ac.in'),(62,'SOSS',NULL,'SOCIS','CC','BCA','FST-01',NULL,NULL),(63,'Naveen Kumar',NULL,'SOCIS','CC','BCA','CS-63','9313039979','naveenkumar@ignou.ac.in'),(64,'P V Suresh',NULL,'SOCIS','CC','BCA','CS-05',NULL,'pvsuresh@ignou.ac.in'),(65,'Shashi Bhusan',NULL,'SOCIS','CC','BCA','CS-06',NULL,'shashibhusan@ignou.ac.in'),(66,'Akshay Kumar',NULL,'SOCIS','CC','BCA','CS-64',NULL,'akshay@ignou.ac.in'),(67,'Naveen Kumar',NULL,'SOCIS','CC','BCA','CS-65','9313039979','naveenkumar@ignou.ac.in'),(68,'M.P Mishra',NULL,'SOCIS','CC','BCA','CS-66',NULL,'mpmishra@ignou.ac.in'),(69,'Akshay Kumar',NULL,'SOCIS','CC','BCA','CS-67',NULL,'akshay@ignou.ac.in'),(70,'Shashi Bhusan',NULL,'SOCIS','CC','BCA','CS-68',NULL,'shashibhusan@ignou.ac.in'),(71,'Naveen Kumar',NULL,'SOCIS','CC','BCA','CS-69/BCS-061','9313039979','naveenkumar@ignou.ac.in'),(72,'P V Suresh',NULL,'SOCIS','CC','BCA','CS-70',NULL,'pvsuresh@ignou.ac.in'),(73,'Manohar Lal',NULL,'SOCIS','CC','BCA','CS-71',NULL,'mlal@ignou.ac.in'),(74,'P V Suresh',NULL,'SOCIS','CC','BCA','CS-72',NULL,'pvsuresh@ignou.ac.in'),(75,'Manohar Lal',NULL,'SOCIS','CC','BCA','CS-73',NULL,'mlal@ignou.ac.in'),(76,'Shashi Bhusan',NULL,'SOCIS','CC','BCA','CS-74',NULL,'shashibhusan@ignou.ac.in'),(77,'P V Suresh',NULL,'SOCIS','CC','BCA','CS-75',NULL,'pvsuresh@ignou.ac.in'),(78,'M.P Mishra',NULL,'SOCIS','CC','BCA','CS-76',NULL,'mpmishra@ignou.ac.in'),(79,'P V Suresh',NULL,'SOCIS','CC','CIC','CIC-01',NULL,'pvsuresh@ignou.ac.in'),(80,'P V Suresh',NULL,'SOCIS','CC','CIC','CIC-02',NULL,'pvsuresh@ignou.ac.in'),(81,'P V Suresh',NULL,'SOCIS','CC','CIC','CIC-04',NULL,'pvsuresh@ignou.ac.in'),(82,'P V Suresh',NULL,'SOCIS','CC','CIC','CIC-05',NULL,'pvsuresh@ignou.ac.in'),(83,'Akshay Kumar',NULL,'SOCIS','CC','ADIT','CST-101',NULL,'akshay@ignou.ac.in'),(84,'P V Suresh',NULL,'SOCIS','CC','ADIT','CST-102',NULL,'pvsuresh@ignou.ac.in'),(85,'Manohar Lal',NULL,'SOCIS','CC','ADIT','CST-103',NULL,'mlal@ignou.ac.in'),(86,'Naveen Kumar',NULL,'SOCIS','CC','ADIT','CST-104','9313039979','naveenkumar@ignou.ac.in'),(87,'P V Suresh',NULL,'SOCIS','CC','ADIT','CST-201',NULL,'pvsuresh@ignou.ac.in'),(88,'Shashi Bhusan',NULL,'SOCIS','CC','ADIT','CST-202',NULL,'shashibhusan@ignou.ac.in'),(89,'Akshay Kumar',NULL,'SOCIS','CC','ADIT','CST-203',NULL,'akshay@ignou.ac.in'),(90,'P V Suresh',NULL,'SOCIS','CC','ADIT','CST-204',NULL,'pvsuresh@ignou.ac.in'),(91,'Shashi Bhusan',NULL,'SOCIS','CC','ADIT','CST-301',NULL,'shashibhusan@ignou.ac.in'),(92,'Akshay Kumar',NULL,'SOCIS','CC','ADIT','CST-302',NULL,'akshay@ignou.ac.in'),(93,'Manohar Lal',NULL,'SOCIS','CC','ADIT','CST-303',NULL,'mlal@ignou.ac.in'),(94,'M.P Mishra',NULL,'SOCIS','CC','ADIT','CST-304',NULL,'mpmishra@ignou.ac.in'),(95,'Akshay Kumar',NULL,'SOCIS','CC','BIT','CSI-01',NULL,'akshay@ignou.ac.in'),(96,'P V Suresh',NULL,'SOCIS','CC','BIT','CSI-02',NULL,'pvsuresh@ignou.ac.in'),(97,'Shashi Bhusan',NULL,'SOCIS','CC','BIT','CSI-03',NULL,'shashibhusan@ignou.ac.in'),(98,'M.P Mishra',NULL,'SOCIS','CC','BIT','CSI-04',NULL,'mpmishra@ignou.ac.in'),(99,'Manohar Lal',NULL,'SOCIS','CC','BIT','CSI-13',NULL,'mlal@ignou.ac.in'),(100,'M.P Mishra',NULL,'SOCIS','CC','BIT','CSI-05/06/07',NULL,'mpmishra@ignou.ac.in'),(101,'Shashi Bhusan',NULL,'SOCIS','CC','BIT','CSI-08',NULL,'shashibhusan@ignou.ac.in'),(102,'Naveen Kumar',NULL,'SOCIS','CC','BIT','CSI-09',NULL,'naveenkumar@ignou.ac.in'),(103,'Naveen Kumar',NULL,'SOCIS','CC','BIT','CSI-22',NULL,'naveenkumar@ignou.ac.in '),(104,'P V Suresh',NULL,'SOCIS','CC','BIT','CSI-14',NULL,'pvsuresh@ignou.ac.in'),(105,'Naveen Kumar',NULL,'SOCIS','CC','BIT','CSI-15',NULL,'naveenkumar@ignou.ac.in'),(106,'Naveen Kumar',NULL,'SOCIS','CC','BIT','CSI-16',NULL,'naveenkumar@ignou.ac.in'),(107,'Akshay Kumar',NULL,'SOCIS','CC','BIT','CSI-20',NULL,'akshay@ignou.ac.in'),(108,'M.P Mishra',NULL,'SOCIS','CC','BIT','CSI-24',NULL,'mpmishra@ignou.ac.in'),(109,'M.P Mishra',NULL,'SOCIS','CC','BIT','CSI-27',NULL,'mpmishra@ignou.ac.in'),(110,'Shashi Bhusan',NULL,'SOCIS','CC','BIT','CSI-10/11/12',NULL,'shashibhusan@ignou.ac.in'),(112,'Naveen Kumar',NULL,'SOCIS','CC','BIT','CSI-09',NULL,'naveenkumar@ignou.ac.in'),(113,'Naveen Kumar',NULL,'SOCIS','CC','BIT','CSI-22',NULL,'naveenkumar@ignou.ac.in'),(114,'P V Suresh',NULL,'SOCIS','CC','BIT','CSI-14',NULL,'pvsuresh@ignou.ac.in'),(115,'Naveen Kumar',NULL,'SOCIS','CC','BIT','CSI-15',NULL,'naveenkumar@ignou.ac.in'),(116,'Naveen Kumar',NULL,'SOCIS','CC','BIT','CSI-16',NULL,'naveenkumar@ignou.ac.in'),(117,'Akshay Kumar',NULL,'SOCIS','CC','BIT','CSI-20',NULL,'akshay@ignou.ac.in'),(118,'M.P Mishra',NULL,'SOCIS','CC','BIT','CSI-24',NULL,'mpmishra@ignou.ac.in'),(119,'M.P Mishra',NULL,'SOCIS','CC','BIT','CSI-27',NULL,'mpmishra@ignou.ac.in'),(120,'Shashi Bhusan',NULL,'SOCIS','CC','BIT','CSI-10/11/12',NULL,'shashibhusan@ignou.ac.in'),(121,'Shashi Bhusan',NULL,'SOCIS','CC','HND','CSM-01',NULL,'shashibhusan@ignou.ac.in'),(122,'Shashi Bhusan',NULL,'SOCIS','CC','HND','CSM-03',NULL,'shashibhusan@ignou.ac.in'),(123,'Shashi Bhusan',NULL,'SOCIS','CC','HND','CSM-04',NULL,'shashibhusan@ignou.ac.in'),(124,'Shashi Bhusan',NULL,'SOCIS','CC','HND','CSM-05',NULL,'shashibhusan@ignou.ac.in'),(125,'Naveen Kumar',NULL,'SOCIS','CC','HND','CSM-21',NULL,'naveenkumar@ignou.ac.in'),(126,'Naveen Kumar',NULL,'SOCIS','CC','HND','CSM-10',NULL,'naveenkumar@ignou.ac.in'),(127,'M.P Mishra',NULL,'SOCIS','CC','HND','CSI-21',NULL,'mpmishra@ignou.ac.in'),(128,'Manohar Lal',NULL,'SOCIS','CC','HND','CSI-32',NULL,'mlal@ignou.ac.in'),(129,'Manohar Lal',NULL,'SOCIS','CC','HND','CSI-23',NULL,'mlal@ignou.ac.in'),(130,'Mr. Arvind Kumar Dubey',NULL,'SOTHSM','CC','MTM','MTM-1',NULL,NULL),(131,'Ms. Tangjakhombi Akoijam',NULL,'SOTHSM','CC','MTM','MTM-2',NULL,NULL),(132,'Dr. Sonia Sharma',NULL,'SOTHSM','CC','MTM','MTM-3',NULL,NULL),(133,'Dr. Paramita Suklabaidya',NULL,'SOTHSM','CC','MTM','MTM-4',NULL,NULL),(134,'Ms. Tangjakhombi Akoijam',NULL,'SOTHSM','CC','MTM','MTM-5',NULL,NULL),(135,'Dr. Paramita Suklabaidya',NULL,'SOTHSM','CC','MTM','MTM-6',NULL,NULL),(136,'Mr. Arvind Kumar Dubey',NULL,'SOTHSM','CC','MTM','MTM-7',NULL,NULL),(137,'Dr. Sonia Sharma',NULL,'SOTHSM','CC','MTM','MTM-8',NULL,NULL),(138,'Ms. Tangjakhombi Akoijam',NULL,'SOTHSM','CC','MTM','MTM-9',NULL,NULL),(139,'Mr. Arvind Kumar Dubey',NULL,'SOTHSM','CC','MTM','MTM-10',NULL,NULL),(140,'Dr. Sonia Sharma',NULL,'SOTHSM','CC','MTM','MTM-12',NULL,NULL),(141,'Dr. Paramita Suklabaidya',NULL,'SOTHSM','CC','MTM','MTM-13',NULL,NULL),(142,'Mr. Arvind Kumar Dubey',NULL,'SOTHSM','CC','MTM','MTM-14',NULL,NULL),(143,'Dr. Paramita Suklabaidya',NULL,'SOTHSM','CC','MTM','MTM-15',NULL,NULL),(144,'Ms. Tangjakhombi Akoijam',NULL,'SOTHSM','CC','MTM','MTM-16',NULL,NULL),(145,'Ms. Tangjakhombi Akoijam',NULL,'SOTHSM','CC','MTM',NULL,NULL,NULL),(146,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `dept_details` */

DROP TABLE IF EXISTS `dept_details`;

CREATE TABLE `dept_details` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(20) NOT NULL,
  `dept_discription` varchar(100) NOT NULL,
  `status` varchar(20) default NULL,
  PRIMARY KEY  (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dept_details` */

insert  into `dept_details`(`dept_id`,`dept_name`,`dept_discription`,`status`) values (1,'SOH','School of Humanities','False'),(2,'SOSS','School of Social Sciences','False'),(3,'SOS','School of Sciences','False'),(4,'SOE','School of Education','False'),(5,'SOCE','School of Continuig Education','False'),(6,'SOET','School of Engineering and Technology','False'),(7,'SOMS','School of Management studies','False'),(8,'SOHS','School of health Sciences','False'),(9,'SOCIS','School of Computer and Information Sciences','True'),(10,'SOA','School of Agriculture','False'),(11,'SOL','School of Law','False'),(12,'SOJNMS','School of Journalism and New Media Studies','False'),(13,'SOGDS','School of Gender and Development Studies','False'),(14,'SOTHSM','School of Tourism and Hospitality Services Management','False'),(15,'SOITDS','School of Interdisciplinary and Trans-disciplinary Studies','False'),(16,'SOSW','School of Social Work','False'),(17,'SOVET','School of Vocational Education and Training','False'),(18,'SOEDS','School of Extension and development Studies','False'),(19,'SOFL','School of Foreign Languages','False'),(20,'SOTST','School of Translation Studies and Training','False'),(21,'SOPVA','School of Performing and Visual Arts','False'),(22,'DEC','Distance Education Council ','False'),(23,'SSC','Student Services Centre','False'),(24,'EMPC','Electronic Media Production Centre','False'),(25,'NCIDE','National Centre for Innovations in Distance Education','False'),(26,'IUC','Inter-University Consortium','False'),(27,'CEE','Centre for Extension Education','False'),(28,'STRIDE','Staff Training and Research Institute of Distance Education','False'),(29,'NCDS','National Centre for Disability Studies ','False'),(30,'PIU','Public Information Unit','False'),(31,'EDNERU','Educational Development of North East Region Unit','False'),(32,'IGCSOFS','Indira Gandhi Centre for Studies on Freedom Struggle','False'),(33,'DEPSSA','Distance Education Programme - Sarva Shiksha Abhiyan','False'),(34,'IIFVET','IGNOU Institute for Vocational Education and Training','False'),(35,'NECFRD','North East Centre for Research and Development Guwahati','False'),(36,'CFCET','Centre for Corporate Education Training & Consultancy','False'),(37,'ACIIL','Adv. Centre for Infm. and Innovative Learning','True'),(38,'RU','Research Unit ','False'),(39,'ACD','Academic Co-ordination Division','False'),(40,'AD','Administration Division','False'),(41,'CAM','Construction & Maintenance Division','False'),(42,'CD','Computer Division ','True'),(43,'EMPC','Electronic Media Production Centre','False'),(44,'ID','International Division','True'),(45,'FCD','Finance and Accounts Division','False'),(46,'LADD','Library and Documentation Division','False'),(47,'MPDD','Material Production & Distribution Divis','True'),(48,'SRD','Student Registration Division','True'),(49,'SED','Student Evaluation Division','True'),(50,'RSD','Regional Services Division','True'),(51,'PNDD','Planning and Development Division','False'),(52,'CPC','Campus Placement Cell','False'),(53,'Others','Other Department','True');

/*Table structure for table `dept_query` */

DROP TABLE IF EXISTS `dept_query`;

CREATE TABLE `dept_query` (
  `Token_id` varchar(20) default NULL,
  `Name` varchar(50) default NULL,
  `Dept_From` varchar(50) default NULL,
  `Dept_To` varchar(500) default NULL,
  `Query_Subject` varchar(1000) default NULL,
  `Query_Details` varchar(5000) default NULL,
  `Date` varchar(30) default NULL,
  `Emp_Id` varchar(40) default NULL,
  `ip_address` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  `Time` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dept_query` */

/*Table structure for table `deptqueryinfo` */

DROP TABLE IF EXISTS `deptqueryinfo`;

CREATE TABLE `deptqueryinfo` (
  `TokenId` varchar(20) NOT NULL,
  `QueryFwdDate` varchar(20) default NULL,
  `QueryAnswer` varchar(10000) default NULL,
  `QueryReplyDate` varchar(20) default NULL,
  `RepliedBy` varchar(100) default NULL,
  `DeptName` varchar(100) default NULL,
  `QueryStatus` varchar(50) default NULL,
  `EmpId` varchar(20) default NULL,
  `QueryFwdTo` varchar(100) default NULL,
  `Time` varchar(50) default NULL,
  PRIMARY KEY  (`TokenId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `deptqueryinfo` */

/*Table structure for table `employee_details` */

DROP TABLE IF EXISTS `employee_details`;

CREATE TABLE `employee_details` (
  `emp_id` varchar(10) NOT NULL,
  `emp_name` varchar(40) NOT NULL,
  `emp_category` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  `address` varchar(100) default NULL,
  `zip_code` varchar(7) default NULL,
  `std_code` varchar(10) default NULL,
  `contact_no` varchar(30) default NULL,
  `mobile_no` varchar(13) default NULL,
  `email_id` varchar(40) default NULL,
  `dob` varchar(20) default NULL,
  `gender` varchar(6) default NULL,
  `country` varchar(30) default NULL,
  PRIMARY KEY  (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_details` */

insert  into `employee_details`(`emp_id`,`emp_name`,`emp_category`,`department`,`address`,`zip_code`,`std_code`,`contact_no`,`mobile_no`,`email_id`,`dob`,`gender`,`country`) values ('0','rejith','admin','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan Garhi\r\nNew Delhi - 110068','110068','011','29571725','9958804509','rejithr@ignou.ac.in','1960-06-18','Male','India'),('10','Anand Shankar','admin','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan','110068','011','29571725','9716179091','anand.shankar@ignou.ac.in','1960-08-09','Male','India'),('11','Seema','admin','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan','110068','011','29571725','9958862676','seema.ojha@ignou.ac.in','1960-08-09','Female','India'),('12','Vivek Ranjan','dept','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan','110068','011','29571725','9953036815','vivek.ranjan@ignou.ac.in','1960-08-09','Male','India'),('120','test ty','admin','RSD','testing.........','112234','110','9987786655','9000099007','test@gmail.com','1960-08-11','Male','India'),('123','ridhi','dept','MPDD','testing......','112234','110','9987786655','9000099007','r@gmail.com','1986-10-20','Female','India'),('124','test ty','admin','RSD','testing.........','112234','110','9987786655','9000099007','test@gmail.com','1960-08-11','Male','India'),('13','Ridhi Khera','admin','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan','110068','011','29571725','9910804404','ridhi.khera@ignou.ac.in','1960-08-09','Female','India'),('14','Sanjay Kumar','dept','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan','110068','011','29571725','9868568212','sanjaykvr@ignou.ac.in','1960-08-09','Male','India'),('15','Ganesh Tamang','dept','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan','110068','011','29571725','9953265084','ganesh.tamang@ignou.ac.in','1960-08-09','Male','India'),('16','Sonal ','dept','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan','110068','011','29571725','9717614675','sonal.agarwal@ignou.ac.in','1960-08-09','Female','India'),('17','Dipti Gupta','dept','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan','110068','011','29571725','9871430750','deepti.gupta@ignou.ac.in','1960-08-09','Female','India'),('20','ACIIL User','admin','ACIIL','ACIIL','110068','011','29571725','9878965445','aciil_team@ignou.ac.in','1960-60-21','Male','India'),('21','sukant','admin','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan Garhi\r\nNew Delhi - 110068','110068','011','29571725','9871946096','sukant@ignou.ac.in','1960-06-18','Male','India'),('80','Prof. K. Subramanian','admin','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan Garhi\r\nNew Delhi - 110068','110068','011','29571725','9999999999','ksmanian@ignou.ac.in','1960-06-21','Male','India'),('81','Prof. K.R. Srivathsan','admin','ACIIL','A C I I L\r\nBlock No:7, Room No: 20\r\nIGNOU, Maidan Garhi\r\nNew Delhi - 110068','110068','011','29571725','9999999999','srivathsan@ignou.ac.in','1960-06-21','Male','India');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `Emp_id` varchar(10) NOT NULL,
  `department` varchar(40) default NULL,
  `User_Type` varchar(15) NOT NULL,
  `Username` varchar(40) default NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY  (`Emp_id`,`User_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`Emp_id`,`department`,`User_Type`,`Username`,`Password`) values ('0','ACIIL','admin','rejith','newnewipsadmin'),('10','ACIIL','admin','anand','anand'),('10','ACIIL','cc','anand','anand'),('10','ACIIL','coun','anand','anand'),('10','ACIIL','dept','anand','anand'),('10','ACIIL','Experts','anand','anand'),('10','ACIIL','pqa','anand','anand'),('10','ACIIL','RCExperts','anand','anand'),('10','RC 07','rc_cord','anand','anand'),('10','ACIIL','ssc','anand','anand'),('11','ACIIL','admin','seema','seemaadmin'),('12','ACIIL','dept','vivek','vivekips'),('120','RSD','admin','test','testtest'),('123','MPDD','dept','ridhi','ridhideptdept'),('124','RSD','admin','test','testtest'),('13','ACIIL','admin','ridhi','ridhiadmin'),('14','ACIIL','dept','sanjay','sanjayips'),('15','ACIIL','dept','ganesh.tamang','ganeshipsadmin'),('16','ACIIL','dept','sonal','sonalips'),('17','ACIIL','dept','dipti','diptiips'),('20','ACIIL','admin','aciil','aciil'),('20','ACIIL','dept','aciil','aciil'),('20','ACIIL','pqa','aciil','aciil'),('20','ACIIL','ssc','aciil','aciil'),('21','ACIIL','admin','sukant','newsukantipsadmin'),('28','ACIIL','admin','divyaraj','newdivyaipsadmin'),('80','ACIIL','admin','ksmanian','ksmanianipsadmin'),('81','ACIIL','admin','krsrivathsan','changeme');

/*Table structure for table `query_info` */

DROP TABLE IF EXISTS `query_info`;

CREATE TABLE `query_info` (
  `Token_id` varchar(20) NOT NULL,
  `Query_Fwd_date` varchar(15) NOT NULL,
  `Query_Answer` varchar(1000) default NULL,
  `Query_Reply_Date` varchar(15) default NULL,
  `Replied_By` varchar(40) default NULL,
  `dept_name` varchar(40) default NULL,
  `Query_Status` varchar(40) default NULL,
  `Emp_Id` varchar(10) default NULL,
  `FAQ` varchar(20) default NULL,
  `Query_Fwd_To` varchar(40) default NULL,
  `Time` double default NULL,
  PRIMARY KEY  (`Token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `query_info` */

/*Table structure for table `regional_center` */

DROP TABLE IF EXISTS `regional_center`;

CREATE TABLE `regional_center` (
  `rc_code` varchar(10) NOT NULL,
  `rc_name` varchar(50) NOT NULL,
  `emp_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `regional_center` */

insert  into `regional_center`(`rc_code`,`rc_name`,`emp_id`) values ('RC 07','Delhi 1','1'),('RC 29','Delhi 2','2'),('RC 01','HYDERABAD','344'),('RC 04','GUWAHATI','455'),('RC 05','PATNA','566'),('RC 07','DELHI 1','677'),('RC 09','AHMEDABAD','788'),('RC 10','KARNAL','899'),('RC 11','SHIMLA','900'),('RC 12','JAMMU','123'),('RC 13','BANGALORE','234'),('RC 14','COCHIN','345'),('RC 15','BHOPAL','456'),('RC 16','PUNE','567'),('RC 18','SHILLONG','678'),('RC 21','BHUBANESHWAR','789'),('RC 23','JAIPUR','832'),('RC 25','CHENNAI','932'),('RC 27','LAKHIMPUR KHERI','132'),('RC 28','KOLKATA','232'),('RC 29','DELHI 2','332'),('RC 30','SRINAGAR','442'),('RC 31','DEHRADUN','552'),('RC 32','RANCHI','662'),('RC 24','GANGTOK','772'),('RC 03','ITANAGAR','282'),('RC 17','IMPHAL','992'),('RC 19','AIZWAL','142'),('RC 26','AGARTALA','252'),('RC 20','KOHIMA','352'),('RC 22','KHANNA','452'),('RC 35','RAIPUR','542'),('RC 44','KORAPUT','672'),('RC 45','SILIGURI','772'),('RC 43','MADURAI','872'),('RC 42','RAJKOT','962'),('RC 41','JABALPUR','182'),('RC 46','DARBHANGA','282'),('RC 53','LUCKNOW','383'),('RC 55','UDHAMPUR','464'),('RC 52','CHANDIMANDIR','525'),('RC 54','PUNE','675'),('RC 51','KOLKATA','768'),('RC 71','NEW DELHI','825'),('RC 72','MUMBAI','996'),('RC 73','VISAKHAPATNAM','681'),('RC 74','KOCHI','721'),('RC 81','SHILLONG','811'),('RC 02','PORT BLAIR','876'),('RC 47','ALIGARH','769'),('RC 48','VARANASI','943'),('RC 56','JAIPUR','843'),('RC 08','PANAJI','743'),('RC 33','VIJAYAWADA','643'),('RC 38','DELHI 3','543'),('RC 39','NOIDA','443'),('RC 06','CHANDIGARH','343'),('RC 40','TRIVANDRUM','243'),('RC 37','JORHAT','143'),('RC 50','RAGHUNATHGANJ','193');

/*Table structure for table `uploads` */

DROP TABLE IF EXISTS `uploads`;

CREATE TABLE `uploads` (
  `UPLOADID` varchar(20) NOT NULL,
  `FILENAME` varchar(255) default NULL,
  `BINARYFILE` longblob,
  `FILETYPE` char(100) default NULL,
  `FILESIZE` int(11) default NULL,
  `MAPEDNAME` varchar(150) default NULL,
  PRIMARY KEY  (`UPLOADID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `uploads` */

/*Table structure for table `user_query` */

DROP TABLE IF EXISTS `user_query`;

CREATE TABLE `user_query` (
  `token_id` varchar(25) NOT NULL,
  `name` varchar(50) default NULL,
  `email_id` varchar(60) default NULL,
  `study_centre` varchar(100) default NULL,
  `region` varchar(50) default NULL,
  `ip_address` varchar(30) default NULL,
  `querytype` varchar(70) default NULL,
  `subject` varchar(250) default NULL,
  `department` varchar(50) default NULL,
  `query` varchar(1000) default NULL,
  `date` varchar(15) default NULL,
  `time` double default NULL,
  `status` varchar(40) default NULL,
  `e_no` varchar(10) default NULL,
  `program` varchar(200) default NULL,
  PRIMARY KEY  (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_query` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
