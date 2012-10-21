-- MySQL dump 10.13  Distrib 5.1.62, for pc-linux-gnu (i686)
--
-- Host: localhost    Database: eyeos
-- ------------------------------------------------------
-- Server version	5.1.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cache_key` varchar(128) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `data` longtext NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cache_id`),
  KEY `created_index` (`created`),
  KEY `user_cache_index` (`user_id`,`cache_key`),
  CONSTRAINT `user_id_fk_cache` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `id` varchar(128) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  `timezone` tinyint(4) NOT NULL,
  `ownerid` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarevent`
--

DROP TABLE IF EXISTS `calendarevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarevent` (
  `id` varchar(128) NOT NULL,
  `subject` varchar(128) NOT NULL,
  `location` varchar(128) DEFAULT NULL,
  `description` text,
  `isallday` tinyint(1) NOT NULL,
  `timestart` int(32) NOT NULL,
  `timeend` int(32) NOT NULL,
  `type` varchar(16) NOT NULL,
  `privacy` varchar(10) NOT NULL,
  `repetition` varchar(64) NOT NULL,
  `creatorid` varchar(128) NOT NULL,
  `calendarid` varchar(128) NOT NULL,
  `repeattype` varchar(1) DEFAULT NULL,
  `finaltype` tinyint(4) DEFAULT NULL,
  `finalvalue` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `creatorid` (`creatorid`),
  KEY `calendarid` (`calendarid`),
  KEY `timestart` (`timestart`),
  KEY `timeend` (`timeend`),
  CONSTRAINT `calendarevent_ibfk_4` FOREIGN KEY (`creatorid`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `calendarevent_ibfk_5` FOREIGN KEY (`calendarid`) REFERENCES `calendar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarevent`
--

LOCK TABLES `calendarevent` WRITE;
/*!40000 ALTER TABLE `calendarevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarprefs`
--

DROP TABLE IF EXISTS `calendarprefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarprefs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(7) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `notifications` text NOT NULL,
  `userid` varchar(128) NOT NULL,
  `calendarid` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_calendarprefs_userid_calendarid` (`userid`,`calendarid`),
  KEY `userid` (`userid`),
  KEY `calendarid` (`calendarid`),
  CONSTRAINT `calendarprefs_ibfk_2` FOREIGN KEY (`calendarid`) REFERENCES `calendar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `calendarprefs_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarprefs`
--

LOCK TABLES `calendarprefs` WRITE;
/*!40000 ALTER TABLE `calendarprefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarprefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `channel` varchar(128) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactgroupmembers`
--

DROP TABLE IF EXISTS `contactgroupmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactgroupmembers` (
  `contactgroup_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`contactgroup_id`,`contact_id`),
  KEY `contact_id_fk_contacts` (`contact_id`),
  CONSTRAINT `contactgroup_id_fk_contactgroups` FOREIGN KEY (`contactgroup_id`) REFERENCES `contactgroups` (`contactgroup_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contact_id_fk_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`contact_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactgroupmembers`
--

LOCK TABLES `contactgroupmembers` WRITE;
/*!40000 ALTER TABLE `contactgroupmembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactgroupmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactgroups`
--

DROP TABLE IF EXISTS `contactgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactgroups` (
  `contactgroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`contactgroup_id`),
  KEY `contactgroups_user_index` (`user_id`,`del`),
  CONSTRAINT `user_id_fk_contactgroups` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactgroups`
--

LOCK TABLES `contactgroups` WRITE;
/*!40000 ALTER TABLE `contactgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL,
  `firstname` varchar(128) NOT NULL DEFAULT '',
  `surname` varchar(128) NOT NULL DEFAULT '',
  `vcard` text,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`contact_id`),
  KEY `user_contacts_index` (`user_id`,`email`),
  CONSTRAINT `user_id_fk_contacts` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventgroup`
--

DROP TABLE IF EXISTS `eventgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventsubject` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventgroup`
--

LOCK TABLES `eventgroup` WRITE;
/*!40000 ALTER TABLE `eventgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventineventgroup`
--

DROP TABLE IF EXISTS `eventineventgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventineventgroup` (
  `eventId` varchar(128) NOT NULL,
  `eventgroupid` int(11) NOT NULL,
  KEY `eventineventgroup_ibfk_4` (`eventId`),
  KEY `eventineventgroup_ibfk_5` (`eventgroupid`),
  CONSTRAINT `eventineventgroup_ibfk_4` FOREIGN KEY (`eventId`) REFERENCES `calendarevent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `eventineventgroup_ibfk_5` FOREIGN KEY (`eventgroupid`) REFERENCES `eventgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventineventgroup`
--

LOCK TABLES `eventineventgroup` WRITE;
/*!40000 ALTER TABLE `eventineventgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventineventgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventnotificationinformation`
--

DROP TABLE IF EXISTS `eventnotificationinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventnotificationinformation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) DEFAULT NULL,
  `answer` varchar(128) DEFAULT NULL,
  `creationdate` int(32) NOT NULL,
  `sender` varchar(128) NOT NULL,
  `receiver` varchar(128) NOT NULL,
  `question` text NOT NULL,
  `messageinformation` text,
  `availableanswers` text,
  `isquestion` tinyint(1) NOT NULL,
  `eventdata` text,
  `hasended` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventnotificationinformation_ibfk_1` (`sender`),
  KEY `eventnotificationinformation_ibfk_2` (`receiver`),
  CONSTRAINT `eventnotificationinformation_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `eventnotificationinformation_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventnotificationinformation`
--

LOCK TABLES `eventnotificationinformation` WRITE;
/*!40000 ALTER TABLE `eventnotificationinformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventnotificationinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eyeosgroup`
--

DROP TABLE IF EXISTS `eyeosgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eyeosgroup` (
  `id` varchar(128) NOT NULL,
  `name` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eyeosgroup`
--

LOCK TABLES `eyeosgroup` WRITE;
/*!40000 ALTER TABLE `eyeosgroup` DISABLE KEYS */;
INSERT INTO `eyeosgroup` VALUES ('eyeID_EyeosGroup_admin','admin',0),('eyeID_EyeosGroup_exec','exec',0),('eyeID_EyeosGroup_lfs','lfs',0),('eyeID_EyeosGroup_mnt','mnt',0),('eyeID_EyeosGroup_rfs','rfs',0),('eyeID_EyeosGroup_root','root',0),('eyeID_EyeosGroup_sys','sys',0),('eyeID_EyeosGroup_um','um',0),('eyeID_EyeosGroup_users','users',0),('eyeID_EyeosGroup_vfs','vfs',0),('eyeID_EyeosGroup_wg','wg',0),('eyeID_EyeosGroup_wg-managers','wg-managers',0);
/*!40000 ALTER TABLE `eyeosgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eyeosmetadata`
--

DROP TABLE IF EXISTS `eyeosmetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eyeosmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(128) NOT NULL,
  `object_id` varchar(128) NOT NULL,
  `name` text NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eyeosmetadata`
--

LOCK TABLES `eyeosmetadata` WRITE;
/*!40000 ALTER TABLE `eyeosmetadata` DISABLE KEYS */;
INSERT INTO `eyeosmetadata` VALUES (1,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.firstname','s:4:\"root\";'),(2,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.lastname','s:4:\"root\";'),(3,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.email','s:16:\"root@example.com\";'),(4,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.applications.installed','a:6:{s:10:\"calculator\";s:1:\"0\";s:4:\"mail\";s:1:\"0\";s:5:\"files\";s:1:\"0\";s:8:\"calendar\";s:1:\"0\";s:9:\"documents\";s:1:\"0\";s:7:\"notepad\";s:1:\"0\";}'),(5,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.desktop.widgets','a:7:{s:7:\"desktop\";a:4:{s:5:\"title\";s:7:\"Desktop\";s:9:\"installed\";s:5:\"false\";s:6:\"column\";s:1:\"1\";s:8:\"position\";s:1:\"1\";}s:5:\"files\";a:5:{s:5:\"title\";s:5:\"Files\";s:9:\"installed\";s:4:\"true\";s:6:\"column\";i:1;s:8:\"position\";i:0;s:9:\"minimized\";b:0;}s:6:\"groups\";a:5:{s:5:\"title\";s:9:\"My Groups\";s:9:\"installed\";s:4:\"true\";s:6:\"column\";i:1;s:8:\"position\";i:1;s:9:\"minimized\";b:0;}s:6:\"events\";a:6:{s:5:\"title\";s:6:\"Events\";s:9:\"installed\";s:4:\"true\";s:5:\"items\";s:1:\"5\";s:6:\"column\";i:3;s:8:\"position\";i:1;s:9:\"minimized\";b:0;}s:9:\"favorites\";a:5:{s:5:\"title\";s:22:\"Favorites Applications\";s:9:\"installed\";s:4:\"true\";s:6:\"column\";i:3;s:8:\"position\";i:0;s:9:\"minimized\";b:0;}s:5:\"notes\";a:5:{s:5:\"title\";s:5:\"Notes\";s:9:\"installed\";s:4:\"true\";s:6:\"column\";i:3;s:8:\"position\";i:2;s:9:\"minimized\";b:0;}i:1;a:3:{s:6:\"column\";i:1;s:8:\"position\";i:0;s:9:\"minimized\";b:0;}}'),(6,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.desktop.wallpaperId','s:6:\"nature\";'),(7,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.language','s:2:\"en\";'),(8,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.applications.favorite','a:5:{s:10:\"calculator\";s:1:\"0\";s:5:\"files\";s:1:\"0\";s:8:\"calendar\";s:1:\"0\";s:9:\"documents\";s:1:\"0\";s:7:\"notepad\";s:1:\"0\";}'),(9,'EyeosUser','eyeID_EyeosUser_root','eyeos.desktop.mode','s:7:\"classic\";'),(10,'EyeosUser','eyeID_EyeosUser_root','eyeos.desktop.dashboard.nbcolumns','s:1:\"3\";'),(11,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.desktop.wallpaperMode','s:5:\"image\";'),(12,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.desktop.backgroundColors','a:9:{s:7:\"#E6E6E6\";s:4:\"true\";s:7:\"#CCDADA\";s:5:\"false\";s:7:\"#A1C4E0\";s:5:\"false\";s:7:\"#A7AFC4\";s:5:\"false\";s:7:\"#999999\";s:5:\"false\";s:7:\"#6293BB\";s:5:\"false\";s:7:\"#679966\";s:5:\"false\";s:7:\"#787B9A\";s:5:\"false\";s:7:\"#6E829A\";s:5:\"false\";}'),(13,'EyeosUser','eyeID_EyeosUser_root','eyeos.user.desktop.wallpaper','s:50:\"sys:///extern/images/wallpapers/nature/default.jpg\";');
/*!40000 ALTER TABLE `eyeosmetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eyeosprincipalgroupassignation`
--

DROP TABLE IF EXISTS `eyeosprincipalgroupassignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eyeosprincipalgroupassignation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principalid` varchar(128) NOT NULL,
  `groupid` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `principalid` (`principalid`),
  KEY `groupid` (`groupid`),
  CONSTRAINT `FK_eyeosprincipal2groupassignation_group_id` FOREIGN KEY (`groupid`) REFERENCES `eyeosgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eyeosprincipalgroupassignation`
--

LOCK TABLES `eyeosprincipalgroupassignation` WRITE;
/*!40000 ALTER TABLE `eyeosprincipalgroupassignation` DISABLE KEYS */;
INSERT INTO `eyeosprincipalgroupassignation` VALUES (1,'eyeID_EyeosUser_root','eyeID_EyeosGroup_root'),(2,'eyeID_EyeosUser_root','eyeID_EyeosGroup_users'),(3,'eyeID_EyeosUser_root','eyeID_EyeosGroup_sys'),(4,'eyeID_EyeosUser_register','eyeID_EyeosGroup_sys'),(5,'eyeID_EyeosUser_register','eyeID_EyeosGroup_um'),(6,'eyeID_EyeosGroup_wg-managers','eyeID_EyeosGroup_wg');
/*!40000 ALTER TABLE `eyeosprincipalgroupassignation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eyeosuser`
--

DROP TABLE IF EXISTS `eyeosuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eyeosuser` (
  `id` varchar(128) NOT NULL,
  `name` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `primarygroupid` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `primarygroupid` (`primarygroupid`),
  CONSTRAINT `FK_eyeosuser_primaryGroup_id` FOREIGN KEY (`primarygroupid`) REFERENCES `eyeosgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eyeosuser`
--

LOCK TABLES `eyeosuser` WRITE;
/*!40000 ALTER TABLE `eyeosuser` DISABLE KEYS */;
INSERT INTO `eyeosuser` VALUES ('eyeID_EyeosUser_register','_register','','eyeID_EyeosGroup_sys',0),('eyeID_EyeosUser_root','root','fff2b4cb565669376cf14c11154c9821b5a8855c','eyeID_EyeosGroup_root',0);
/*!40000 ALTER TABLE `eyeosuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eyeosuserworkgroupassignation`
--

DROP TABLE IF EXISTS `eyeosuserworkgroupassignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eyeosuserworkgroupassignation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(128) NOT NULL,
  `workgroupid` varchar(128) NOT NULL,
  `role` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_userid_workgroupid` (`userid`,`workgroupid`),
  KEY `userid` (`userid`),
  KEY `workgroupid` (`workgroupid`),
  CONSTRAINT `eyeosuserworkgroupassignation_ibfk_2` FOREIGN KEY (`workgroupid`) REFERENCES `eyeosworkgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `eyeosuserworkgroupassignation_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eyeosuserworkgroupassignation`
--

LOCK TABLES `eyeosuserworkgroupassignation` WRITE;
/*!40000 ALTER TABLE `eyeosuserworkgroupassignation` DISABLE KEYS */;
/*!40000 ALTER TABLE `eyeosuserworkgroupassignation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eyeosworkgroup`
--

DROP TABLE IF EXISTS `eyeosworkgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eyeosworkgroup` (
  `id` varchar(128) NOT NULL,
  `name` varchar(40) NOT NULL,
  `ownerId` varchar(128) NOT NULL,
  `mastergroupid` varchar(128) NOT NULL,
  `privacymode` tinyint(4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ownerId` (`ownerId`),
  KEY `mastergroupid` (`mastergroupid`),
  CONSTRAINT `eyeosworkgroup_ibfk_3` FOREIGN KEY (`ownerId`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `eyeosworkgroup_ibfk_4` FOREIGN KEY (`mastergroupid`) REFERENCES `eyeosgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eyeosworkgroup`
--

LOCK TABLES `eyeosworkgroup` WRITE;
/*!40000 ALTER TABLE `eyeosworkgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `eyeosworkgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identities`
--

DROP TABLE IF EXISTS `identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identities` (
  `identity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `standard` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `organization` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL,
  `reply-to` varchar(128) NOT NULL DEFAULT '',
  `bcc` varchar(128) NOT NULL DEFAULT '',
  `signature` text,
  `html_signature` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identity_id`),
  KEY `user_identities_index` (`user_id`,`del`),
  CONSTRAINT `user_id_fk_identities` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identities`
--

LOCK TABLES `identities` WRITE;
/*!40000 ALTER TABLE `identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impressionto`
--

DROP TABLE IF EXISTS `impressionto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impressionto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` varchar(128) NOT NULL,
  `targetId` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sourceId` (`sourceId`),
  KEY `targetId` (`targetId`),
  CONSTRAINT `impressionto_ibfk_1` FOREIGN KEY (`sourceId`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `impressionto_ibfk_2` FOREIGN KEY (`targetId`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impressionto`
--

LOCK TABLES `impressionto` WRITE;
/*!40000 ALTER TABLE `impressionto` DISABLE KEYS */;
/*!40000 ALTER TABLE `impressionto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languageadminto`
--

DROP TABLE IF EXISTS `languageadminto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languageadminto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `assigned` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assigned` (`assigned`),
  CONSTRAINT `languageadminto_ibfk_1` FOREIGN KEY (`assigned`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languageadminto`
--

LOCK TABLES `languageadminto` WRITE;
/*!40000 ALTER TABLE `languageadminto` DISABLE KEYS */;
/*!40000 ALTER TABLE `languageadminto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailaccounts`
--

DROP TABLE IF EXISTS `mailaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailaccounts` (
  `accountid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` tinytext NOT NULL,
  `imap_server` text NOT NULL,
  `imap_user` text NOT NULL,
  `imap_password` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_password` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`accountid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailaccounts`
--

LOCK TABLES `mailaccounts` WRITE;
/*!40000 ALTER TABLE `mailaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `cache_key` varchar(128) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `idx` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `size` int(11) unsigned NOT NULL DEFAULT '0',
  `headers` text NOT NULL,
  `structure` text,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `uniqueness` (`user_id`,`cache_key`,`uid`),
  KEY `created_index` (`created`),
  KEY `index_index` (`user_id`,`cache_key`,`idx`),
  CONSTRAINT `user_id_fk_messages` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `netsyncHooks`
--

DROP TABLE IF EXISTS `netsyncHooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `netsyncHooks` (
  `callback` varchar(256) NOT NULL,
  `file` varchar(256) NOT NULL,
  PRIMARY KEY (`callback`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `netsyncHooks`
--

LOCK TABLES `netsyncHooks` WRITE;
/*!40000 ALTER TABLE `netsyncHooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `netsyncHooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `netsync_messages`
--

DROP TABLE IF EXISTS `netsync_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `netsync_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(128) NOT NULL,
  `to` varchar(128) NOT NULL,
  `data` varchar(1024) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `netsync_messages`
--

LOCK TABLES `netsync_messages` WRITE;
/*!40000 ALTER TABLE `netsync_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `netsync_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peopletag`
--

DROP TABLE IF EXISTS `peopletag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peopletag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `userId` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `peopletag_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peopletag`
--

LOCK TABLES `peopletag` WRITE;
/*!40000 ALTER TABLE `peopletag` DISABLE KEYS */;
/*!40000 ALTER TABLE `peopletag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presence`
--

DROP TABLE IF EXISTS `presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(128) CHARACTER SET utf8 NOT NULL,
  `lastSeen` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `presence_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presence`
--

LOCK TABLES `presence` WRITE;
/*!40000 ALTER TABLE `presence` DISABLE KEYS */;
/*!40000 ALTER TABLE `presence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pressence`
--

DROP TABLE IF EXISTS `pressence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pressence` (
  `who` varchar(128) NOT NULL,
  `since` int(10) unsigned NOT NULL,
  `loggedIn` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`who`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pressence`
--

LOCK TABLES `pressence` WRITE;
/*!40000 ALTER TABLE `pressence` DISABLE KEYS */;
/*!40000 ALTER TABLE `pressence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` varchar(128) NOT NULL,
  `targetId` varchar(128) NOT NULL,
  `state` varchar(50) NOT NULL,
  `lastmodification` int(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sourceId` (`sourceId`),
  KEY `targetId` (`targetId`),
  CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`sourceId`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`targetId`) REFERENCES `eyeosuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `sess_id` varchar(40) NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `changed` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `ip` varchar(40) NOT NULL,
  `vars` mediumtext NOT NULL,
  PRIMARY KEY (`sess_id`),
  KEY `changed_index` (`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `who` varchar(128) NOT NULL,
  `channel` varchar(128) NOT NULL,
  `since` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tagid` bigint(20) NOT NULL AUTO_INCREMENT,
  `principalid` varchar(128) NOT NULL,
  `label` varchar(64) NOT NULL,
  `color` varchar(7) NOT NULL,
  PRIMARY KEY (`tagid`),
  UNIQUE KEY `UNQ_tag_principalid_label` (`principalid`,`label`),
  KEY `principalid` (`principalid`),
  KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggedobject`
--

DROP TABLE IF EXISTS `taggedobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggedobject` (
  `taggableobjectid` varchar(128) NOT NULL,
  `objectdata` text NOT NULL,
  `handlerclassname` varchar(128) NOT NULL,
  PRIMARY KEY (`taggableobjectid`),
  KEY `handlerclassname` (`handlerclassname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggedobject`
--

LOCK TABLES `taggedobject` WRITE;
/*!40000 ALTER TABLE `taggedobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggedobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagobjectassignation`
--

DROP TABLE IF EXISTS `tagobjectassignation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagobjectassignation` (
  `taggableobjectid` varchar(128) NOT NULL,
  `tagid` bigint(20) NOT NULL,
  UNIQUE KEY `UNQ_tagobjectassignation_taggableoibjectid_tagid` (`taggableobjectid`,`tagid`),
  KEY `taggableobjectid` (`taggableobjectid`),
  KEY `tagid` (`tagid`),
  CONSTRAINT `tagobjectassignation_ibfk_1` FOREIGN KEY (`taggableobjectid`) REFERENCES `taggedobject` (`taggableobjectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tagobjectassignation_ibfk_2` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagobjectassignation`
--

LOCK TABLES `tagobjectassignation` WRITE;
/*!40000 ALTER TABLE `tagobjectassignation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagobjectassignation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagperimpressionto`
--

DROP TABLE IF EXISTS `tagperimpressionto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagperimpressionto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `impressionId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagId` (`tagId`),
  KEY `impressionId` (`impressionId`),
  CONSTRAINT `tagperimpressionto_ibfk_1` FOREIGN KEY (`tagId`) REFERENCES `peopletag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tagperimpressionto_ibfk_2` FOREIGN KEY (`impressionId`) REFERENCES `impressionto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagperimpressionto`
--

LOCK TABLES `tagperimpressionto` WRITE;
/*!40000 ALTER TABLE `tagperimpressionto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagperimpressionto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urlfile`
--

DROP TABLE IF EXISTS `urlfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urlfile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urlfile`
--

LOCK TABLES `urlfile` WRITE;
/*!40000 ALTER TABLE `urlfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `urlfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urlshare`
--

DROP TABLE IF EXISTS `urlshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urlshare` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(8) NOT NULL,
  `publicationDate` int(12) NOT NULL,
  `expirationDate` int(12) DEFAULT NULL,
  `lastdownloaddate` int(12) DEFAULT NULL,
  `fileId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`),
  CONSTRAINT `urlshare_ibfk_1` FOREIGN KEY (`fileId`) REFERENCES `urlfile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urlshare`
--

LOCK TABLES `urlshare` WRITE;
/*!40000 ALTER TABLE `urlshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `urlshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `mail_host` varchar(128) NOT NULL,
  `alias` varchar(128) NOT NULL,
  `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_login` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `language` varchar(5) DEFAULT NULL,
  `preferences` text,
  PRIMARY KEY (`user_id`),
  KEY `username_index` (`username`),
  KEY `alias_index` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-21 21:57:08
