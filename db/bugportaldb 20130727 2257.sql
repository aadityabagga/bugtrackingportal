-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.77-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema bugportaldb
--

CREATE DATABASE IF NOT EXISTS bugportaldb;
USE bugportaldb;

--
-- Definition of table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
CREATE TABLE `bugs` (
  `bug_no` int(10) unsigned NOT NULL auto_increment,
  `posted_by` varchar(45) NOT NULL default 'Unknown',
  `posted_on` varchar(45) NOT NULL,
  `prod_cat` varchar(45) NOT NULL,
  `status` varchar(20) NOT NULL default 'Pending',
  `description` varchar(500) NOT NULL,
  `assign_to` varchar(45) NOT NULL default 'Not Assigned',
  `assign_on` varchar(45) NOT NULL default '0000-00-00 00:00:00',
  `solved_on` varchar(45) NOT NULL default '0000-00-00 00:00:00',
  `solution` varchar(200) NOT NULL default '--------',
  `feedback` varchar(45) NOT NULL default '--------',
  `overview` varchar(45) NOT NULL,
  PRIMARY KEY  (`bug_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Will store all bugs info';

--
-- Dumping data for table `bugs`
--




--
-- Definition of table `consumers`
--

DROP TABLE IF EXISTS `consumers`;
CREATE TABLE `consumers` (
  `loginID` varchar(20) default NULL,
  `password` varchar(15) default NULL,
  `email` varchar(45) default NULL,
  `contactno` varchar(15) default NULL,
  `address` varchar(150) default NULL,
  `pincode` varchar(15) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consumers`
--




--
-- Definition of table `expertdetails`
--

DROP TABLE IF EXISTS `expertdetails`;
CREATE TABLE `expertdetails` (
  `expertid` varchar(45) NOT NULL,
  `expertname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `contactno` longtext NOT NULL,
  `emailid` varchar(45) NOT NULL,
  `domain` varchar(45) NOT NULL,
  PRIMARY KEY  (`expertid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expertdetails`
--




--
-- Definition of table `monitordetails`
--

DROP TABLE IF EXISTS `monitordetails`;
CREATE TABLE `monitordetails` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monitordetails`
--



--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_name` varchar(45) NOT NULL,
  `pro_desc` varchar(45) NOT NULL,
  `pro_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`pro_name`,`pro_desc`,`pro_id`) VALUES 
 ('computer','hsagfkjajskfl.akfl',1),
 ('laptop','gsdajgjhdg',2),
 ('Pendrive','Its a portable device.',3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
