-- MySQL dump 10.13  Distrib 5.6.24, for Linux (i686)
--
-- Host: localhost    Database: clipbucket
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `cb_action_log`
--

DROP TABLE IF EXISTS `cb_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_action_log` (
  `action_id` int(255) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(60) NOT NULL,
  `action_username` varchar(60) NOT NULL,
  `action_userid` int(30) NOT NULL,
  `action_useremail` varchar(200) NOT NULL,
  `action_userlevel` int(11) NOT NULL,
  `action_ip` varchar(15) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_success` enum('yes','no') NOT NULL,
  `action_details` text NOT NULL,
  `action_obj_id` int(255) NOT NULL,
  `action_done_id` int(255) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2688 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_action_log`
--

LOCK TABLES `cb_action_log` WRITE;
/*!40000 ALTER TABLE `cb_action_log` DISABLE KEYS */;
INSERT INTO `cb_action_log` VALUES (2687,'login','admin',1,'admin@example.com',0,'172.17.42.1','2015-06-17 01:22:29','yes','',0,0);
/*!40000 ALTER TABLE `cb_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_admin_notes`
--

DROP TABLE IF EXISTS `cb_admin_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_admin_notes` (
  `note_id` int(225) NOT NULL AUTO_INCREMENT,
  `note` text CHARACTER SET ucs2 NOT NULL,
  `date_added` datetime NOT NULL,
  `userid` int(225) NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_admin_notes`
--

LOCK TABLES `cb_admin_notes` WRITE;
/*!40000 ALTER TABLE `cb_admin_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_admin_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_admin_todo`
--

DROP TABLE IF EXISTS `cb_admin_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_admin_todo` (
  `todo_id` int(225) NOT NULL AUTO_INCREMENT,
  `todo` text CHARACTER SET ucs2 NOT NULL,
  `date_added` datetime NOT NULL,
  `userid` int(225) NOT NULL,
  PRIMARY KEY (`todo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_admin_todo`
--

LOCK TABLES `cb_admin_todo` WRITE;
/*!40000 ALTER TABLE `cb_admin_todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_admin_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_ads_data`
--

DROP TABLE IF EXISTS `cb_ads_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_ads_data` (
  `ad_id` int(50) NOT NULL AUTO_INCREMENT,
  `ad_name` mediumtext NOT NULL,
  `ad_code` mediumtext NOT NULL,
  `ad_placement` varchar(50) NOT NULL DEFAULT '',
  `ad_category` int(11) NOT NULL DEFAULT '0',
  `ad_status` enum('0','1') NOT NULL DEFAULT '0',
  `ad_impressions` bigint(255) NOT NULL DEFAULT '0',
  `last_viewed` datetime NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_ads_data`
--

LOCK TABLES `cb_ads_data` WRITE;
/*!40000 ALTER TABLE `cb_ads_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_ads_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_ads_placements`
--

DROP TABLE IF EXISTS `cb_ads_placements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_ads_placements` (
  `placement_id` int(20) NOT NULL AUTO_INCREMENT,
  `placement` varchar(26) NOT NULL,
  `placement_name` varchar(50) NOT NULL,
  `disable` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`placement_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_ads_placements`
--

LOCK TABLES `cb_ads_placements` WRITE;
/*!40000 ALTER TABLE `cb_ads_placements` DISABLE KEYS */;
INSERT INTO `cb_ads_placements` VALUES (1,'ad_160x600','Wide Skyscrapper 160 x 600','yes'),(2,'ad_468x60','Banner 468 x 60','yes'),(3,'ad_300x250','Medium Rectangle 300 x 250','yes'),(4,'ad_728x90','Leader Board 728 x 90','yes'),(5,'ad_120x600','Skyscrapper 120 x 600','yes');
/*!40000 ALTER TABLE `cb_ads_placements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_collection_categories`
--

DROP TABLE IF EXISTS `cb_collection_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_collection_categories` (
  `category_id` int(255) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  `category_order` int(5) NOT NULL,
  `category_desc` text NOT NULL,
  `date_added` mediumtext NOT NULL,
  `category_thumb` mediumint(9) NOT NULL,
  `isdefault` enum('yes','no') NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_collection_categories`
--

LOCK TABLES `cb_collection_categories` WRITE;
/*!40000 ALTER TABLE `cb_collection_categories` DISABLE KEYS */;
INSERT INTO `cb_collection_categories` VALUES (1,'Uncategorized',0,'Uncategorized','2015-06-17 10:22:24',0,'yes');
/*!40000 ALTER TABLE `cb_collection_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_collection_contributors`
--

DROP TABLE IF EXISTS `cb_collection_contributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_collection_contributors` (
  `contributor_id` int(200) NOT NULL AUTO_INCREMENT,
  `collection_id` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `can_edit` enum('yes','no') NOT NULL DEFAULT 'no',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`contributor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_collection_contributors`
--

LOCK TABLES `cb_collection_contributors` WRITE;
/*!40000 ALTER TABLE `cb_collection_contributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_collection_contributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_collection_items`
--

DROP TABLE IF EXISTS `cb_collection_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_collection_items` (
  `ci_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `collection_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ci_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_collection_items`
--

LOCK TABLES `cb_collection_items` WRITE;
/*!40000 ALTER TABLE `cb_collection_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_collection_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_collections`
--

DROP TABLE IF EXISTS `cb_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_collections` (
  `collection_id` bigint(25) NOT NULL AUTO_INCREMENT,
  `collection_name` varchar(225) NOT NULL,
  `collection_description` text NOT NULL,
  `collection_tags` text NOT NULL,
  `category` varchar(200) NOT NULL,
  `userid` int(10) NOT NULL,
  `views` bigint(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `featured` varchar(4) NOT NULL DEFAULT 'no',
  `broadcast` varchar(10) NOT NULL,
  `allow_comments` varchar(4) NOT NULL,
  `allow_rating` enum('yes','no') NOT NULL DEFAULT 'yes',
  `total_comments` bigint(20) NOT NULL,
  `last_commented` datetime NOT NULL,
  `total_objects` bigint(20) NOT NULL,
  `rating` bigint(20) NOT NULL,
  `rated_by` bigint(20) NOT NULL,
  `voters` longtext NOT NULL,
  `active` varchar(4) NOT NULL,
  `public_upload` varchar(4) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`collection_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_collections`
--

LOCK TABLES `cb_collections` WRITE;
/*!40000 ALTER TABLE `cb_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_comments`
--

DROP TABLE IF EXISTS `cb_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_comments` (
  `comment_id` int(60) NOT NULL AUTO_INCREMENT,
  `type` varchar(3) NOT NULL,
  `comment` text NOT NULL,
  `userid` int(60) NOT NULL,
  `anonym_name` varchar(255) NOT NULL,
  `anonym_email` varchar(255) NOT NULL,
  `parent_id` int(60) NOT NULL,
  `type_id` int(225) NOT NULL,
  `type_owner_id` int(255) NOT NULL,
  `vote` varchar(225) NOT NULL,
  `voters` text NOT NULL,
  `spam_votes` bigint(20) NOT NULL,
  `spam_voters` text NOT NULL,
  `date_added` datetime NOT NULL,
  `comment_ip` text NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=535 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_comments`
--

LOCK TABLES `cb_comments` WRITE;
/*!40000 ALTER TABLE `cb_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_config`
--

DROP TABLE IF EXISTS `cb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_config` (
  `configid` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`configid`)
) ENGINE=MyISAM AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_config`
--

LOCK TABLES `cb_config` WRITE;
/*!40000 ALTER TABLE `cb_config` DISABLE KEYS */;
INSERT INTO `cb_config` VALUES (1,'site_title','Clipbucket v2.7.3'),(2,'site_slogan','A way to broadcast yourself'),(3,'baseurl','http://localhost:5000'),(4,'basedir','/var/www/localhost/htdocs'),(5,'template_dir','cbv2.7'),(6,'player_file','html5_player.php'),(7,'closed','0'),(8,'closed_msg','We Are Updating Our Website, Please Visit us after few hours.'),(9,'description','Clip Bucket is an ultimate Video Sharing script'),(10,'keywords','clip bucket video sharing website script'),(11,'ffmpegpath','/usr/local/bin/ffmpeg'),(12,'flvtool2path','/usr/local/bin/flvtool2'),(13,'mp4boxpath','/usr/local/bin/MP4Box'),(14,'vbrate','300000'),(15,'srate','22050'),(16,'r_height',''),(17,'r_width',''),(18,'resize',''),(19,'mencoderpath',''),(20,'keep_original','1'),(21,'activation',''),(22,'mplayerpath',''),(23,'email_verification','1'),(24,'allow_registeration','1'),(25,'php_path','/usr/bin/php'),(26,'videos_list_per_page','30'),(27,'channels_list_per_page','25'),(28,'videos_list_per_tab','1'),(29,'channels_list_per_tab','1'),(30,'video_comments','1'),(31,'video_rating','1'),(32,'comment_rating','1'),(33,'video_download','1'),(34,'video_embed','1'),(35,'groups_list_per_page','25'),(36,'seo','no'),(37,'admin_pages','100'),(38,'search_list_per_page','25'),(39,'recently_viewed_limit','10'),(40,'max_upload_size','1000'),(41,'sbrate','128000'),(42,'thumb_width','120'),(43,'thumb_height','90'),(45,'user_comment_opt1',''),(44,'ffmpeg_type',''),(46,'user_comment_opt2',''),(47,'user_comment_opt3',''),(48,'user_comment_opt4',''),(49,'user_rate_opt1',''),(50,'captcha_type','0'),(51,'allow_upload',''),(52,'allowed_types','wmv,avi,divx,3gp,mov,mpeg,mpg,xvid,flv,asf,rm,dat,mp4'),(53,'version','2.7.3'),(54,'version_type','Alpha'),(55,'allow_template_change','1'),(56,'allow_language_change','1'),(57,'default_site_lang',''),(58,'video_require_login',''),(59,'audio_codec','libfaac'),(60,'con_modules_type',''),(61,'remoteUpload',''),(62,'embedUpload',''),(63,'player_div_id',''),(64,'code_dev','(Powered by ClipBucket)'),(65,'sys_os',''),(66,'debug_level',''),(67,'enable_troubleshooter','1'),(68,'vrate','25'),(69,'num_thumbs','5'),(70,'big_thumb_width','320'),(71,'big_thumb_height','240'),(72,'user_max_chr','15'),(73,'disallowed_usernames','shit, asshole, fucker'),(74,'min_age_reg','0'),(75,'max_comment_chr','800'),(76,'user_comment_own',''),(77,'anonym_comments','yes'),(78,'player_dir','CB_html5_player'),(79,'player_width','661'),(80,'player_height','360'),(81,'default_country_iso2','PK'),(82,'channel_player_width','600'),(83,'channel_player_height','281'),(84,'videos_items_grp_page','24'),(85,'videos_items_hme_page','25'),(86,'videos_items_columns','12'),(87,'videos_items_ufav_page','25'),(88,'videos_items_uvid_page','25'),(89,'videos_items_search_page','30'),(90,'videos_item_channel_page','25'),(91,'users_items_subscriptions','5'),(92,'users_items_subscibers','5'),(93,'users_items_contacts_channel','5'),(94,'users_items_search_page','12'),(95,'users_items_group_page','15'),(96,'cbhash','PGRpdiBhbGlnbj0iY2VudGVyIj48IS0tIERvIG5vdCByZW1vdmUgdGhpcyBjb3B5cmlnaHQgbm90aWNlIC0tPg0KUG93ZXJlZCBieSA8YSBocmVmPSJodHRwOi8vY2xpcC1idWNrZXQuY29tLyI+Q2xpcEJ1Y2tldDwvYT4gJXMgfCA8YSBocmVmPSJodHRwOi8vY2xpcC1idWNrZXQuY29tL2Fyc2xhbi1oYXNzYW4iPkFyc2xhbiBIYXNzYW48L2E+DQo8IS0tIERvIG5vdCByZW1vdmUgdGhpcyBjb3B5cmlnaHQgbm90aWNlIC0tPjwvZGl2Pg=='),(97,'min_video_title','4'),(98,'max_video_title','60'),(99,'min_video_desc','5'),(100,'max_video_desc','300'),(101,'video_categories','4'),(102,'min_video_tags','3'),(103,'max_video_tags','30'),(104,'video_codec','libx264'),(105,'date_released','16-06-2015'),(106,'date_installed','2015-06-17 10:22:24'),(107,'date_updated','2015-06-17 10:22:24'),(108,'support_email','webmaster@localhost'),(109,'website_email','webmaster@localhost'),(110,'welcome_email','webmaster@localhost'),(112,'anonymous_id','99'),(113,'date_format','Y-m-d'),(114,'default_time_zone','5'),(156,'use_crons','no'),(115,'autoplay_video','no'),(116,'default_country_iso2','PK'),(117,'channel_comments','1'),(118,'max_profile_pic_size','2500'),(119,'max_profile_pic_height',''),(120,'max_profile_pic_width','230'),(121,'gravatars',''),(122,'picture_url','yes'),(123,'picture_upload','yes'),(124,'background_url','yes'),(125,'background_upload','yes'),(126,'max_bg_size','2500'),(127,'max_bg_width','1600'),(128,'max_bg_height',''),(129,'background_color','yes'),(130,'send_comment_notification','yes'),(131,'approve_video_notification','yes'),(132,'keep_mp4_as_is','yes'),(133,'hq_output','yes'),(134,'grp_categories','3'),(136,'grps_items_search_page','25'),(137,'grp_thumb_height','140'),(138,'grp_thumb_width','140'),(139,'grp_max_title','20'),(140,'grp_max_desc','500'),(141,'quick_conv',''),(142,'server_friendly_conversion',''),(143,'max_conversion','2'),(144,'max_time_wait','7200'),(145,'allow_unicode_usernames','yes'),(146,'min_username','3'),(147,'max_username','15'),(154,'youtube_enabled','yes'),(148,'allow_username_spaces','yes'),(149,'use_playlist','yes'),(150,'comments_captcha','guests'),(151,'player_logo_file','logo.jpg'),(152,'logo_placement','tl'),(153,'buffer_time','5'),(155,'use_ffmpeg_vf','yes'),(224,'own_photo_rating',''),(157,'mail_type','mail'),(158,'smtp_host',''),(159,'smtp_user',''),(160,'smtp_pass',''),(161,'smtp_auth','no'),(162,'smtp_port',''),(163,'use_subs','1'),(164,'pak_license',''),(165,'photo_ratio','16:10'),(166,'photo_thumb_width','600'),(167,'photo_thumb_height','75'),(168,'photo_med_width','300'),(169,'photo_med_height','116'),(170,'photo_lar_width','600'),(171,'photo_crop','1'),(172,'photo_multi_upload','5'),(173,'photo_download','1'),(174,'photo_comments','1'),(175,'photo_rating','1'),(176,'max_photo_size','2'),(177,'watermark_photo','0'),(178,'watermark_max_width','120'),(179,'watermark_placement','left:top'),(180,'load_upload_form','yes'),(181,'load_remote_upload_form','yes'),(182,'load_embed_form','yes'),(183,'load_link_video_form','yes'),(184,'enable_groups',''),(185,'groupsSection','yes'),(186,'videosSection','yes'),(187,'photosSection','yes'),(188,'homeSection','yes'),(189,'signupSection','yes'),(190,'uploadSection','yes'),(191,'collectionsSection','yes'),(192,'channelsSection','yes'),(193,'flvtoolpp',''),(194,'normal_resolution','480'),(195,'high_resolution','720'),(196,'max_video_duration','320'),(197,'embed_player_height','250'),(198,'embed_player_width','300'),(199,'autoplay_embed','yes'),(200,'playlistsSection','yes'),(201,'photo_main_list','10'),(202,'photo_home_tabs','30'),(203,'photo_search_result','30'),(204,'photo_channel_page','10'),(205,'photo_user_photos','20'),(206,'photo_user_favorites','20'),(207,'photo_other_limit','8'),(208,'collection_per_page','30'),(209,'collection_home_page','10'),(210,'collection_search_result','20'),(211,'collection_channel_page','10'),(212,'collection_user_collections','20'),(213,'collection_user_favorites','20'),(214,'collection_items_page','20'),(218,'reCaptcha_private_key','6LcQI8ESAAAAALc_oz1xuNsBVRNx554CaJHjcoXt'),(217,'reCaptcha_public_key','6LcQI8ESAAAAALN1vYQovst9c6nlU52iHdqWExp8'),(219,'channel_rating','1'),(220,'own_channel_rating','1'),(221,'collection_rating','1'),(222,'own_collection_rating','1'),(223,'own_video_rating','1'),(225,'comments_per_page','15'),(226,'embed_type','iframe'),(227,'feedsSection','yes'),(228,'enlarge_button','no'),(229,'max_topic_length','1500'),(230,'max_topic_title','300'),(231,'facebook_embed','yes'),(232,'seo_vido_url','1'),(233,'use_cached_pagin','yes'),(234,'cached_pagin_time','5');
/*!40000 ALTER TABLE `cb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_contacts`
--

DROP TABLE IF EXISTS `cb_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_contacts` (
  `contact_id` int(225) NOT NULL AUTO_INCREMENT,
  `userid` int(225) NOT NULL,
  `contact_userid` int(225) NOT NULL,
  `confirmed` enum('yes','no') NOT NULL DEFAULT 'no',
  `contact_group_id` int(225) NOT NULL,
  `request_type` enum('in','out') NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_contacts`
--

LOCK TABLES `cb_contacts` WRITE;
/*!40000 ALTER TABLE `cb_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_conversion_queue`
--

DROP TABLE IF EXISTS `cb_conversion_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_conversion_queue` (
  `cqueue_id` int(11) NOT NULL AUTO_INCREMENT,
  `cqueue_name` varchar(32) NOT NULL,
  `cqueue_ext` varchar(5) NOT NULL,
  `cqueue_tmp_ext` varchar(3) NOT NULL,
  `cqueue_conversion` enum('yes','no','p') NOT NULL DEFAULT 'no',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_started` varchar(32) NOT NULL,
  `time_completed` varchar(32) NOT NULL,
  PRIMARY KEY (`cqueue_id`),
  KEY `cqueue_conversion` (`cqueue_conversion`)
) ENGINE=MyISAM AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_conversion_queue`
--

LOCK TABLES `cb_conversion_queue` WRITE;
/*!40000 ALTER TABLE `cb_conversion_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_conversion_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_counters`
--

DROP TABLE IF EXISTS `cb_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_counters` (
  `counter_id` int(100) NOT NULL AUTO_INCREMENT,
  `section` varchar(200) NOT NULL,
  `query` text NOT NULL,
  `query_md5` varchar(200) NOT NULL,
  `counts` bigint(200) NOT NULL,
  `date_added` varchar(200) NOT NULL,
  PRIMARY KEY (`counter_id`),
  UNIQUE KEY `query_md5` (`query_md5`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_counters`
--

LOCK TABLES `cb_counters` WRITE;
/*!40000 ALTER TABLE `cb_counters` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_countries`
--

DROP TABLE IF EXISTS `cb_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_countries` (
  `country_id` int(80) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `name_en` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_countries`
--

LOCK TABLES `cb_countries` WRITE;
/*!40000 ALTER TABLE `cb_countries` DISABLE KEYS */;
INSERT INTO `cb_countries` VALUES (1,'AF','AFGHANISTAN','Afghanistan','AFG',4),(2,'AL','ALBANIA','Albania','ALB',8),(3,'DZ','ALGERIA','Algeria','DZA',12),(4,'AS','AMERICAN SAMOA','American Samoa','ASM',16),(5,'AD','ANDORRA','Andorra','AND',20),(6,'AO','ANGOLA','Angola','AGO',24),(7,'AI','ANGUILLA','Anguilla','AIA',660),(8,'AQ','ANTARCTICA','Antarctica',NULL,NULL),(9,'AG','ANTIGUA AND BARBUDA','Antigua and Barbuda','ATG',28),(10,'AR','ARGENTINA','Argentina','ARG',32),(11,'AM','ARMENIA','Armenia','ARM',51),(12,'AW','ARUBA','Aruba','ABW',533),(13,'AU','AUSTRALIA','Australia','AUS',36),(14,'AT','AUSTRIA','Austria','AUT',40),(15,'AZ','AZERBAIJAN','Azerbaijan','AZE',31),(16,'BS','BAHAMAS','Bahamas','BHS',44),(17,'BH','BAHRAIN','Bahrain','BHR',48),(18,'BD','BANGLADESH','Bangladesh','BGD',50),(19,'BB','BARBADOS','Barbados','BRB',52),(20,'BY','BELARUS','Belarus','BLR',112),(21,'BE','BELGIUM','Belgium','BEL',56),(22,'BZ','BELIZE','Belize','BLZ',84),(23,'BJ','BENIN','Benin','BEN',204),(24,'BM','BERMUDA','Bermuda','BMU',60),(25,'BT','BHUTAN','Bhutan','BTN',64),(26,'BO','BOLIVIA','Bolivia','BOL',68),(27,'BA','BOSNIA AND HERZEGOVINA','Bosnia and Herzegovina','BIH',70),(28,'BW','BOTSWANA','Botswana','BWA',72),(29,'BV','BOUVET ISLAND','Bouvet Island',NULL,NULL),(30,'BR','BRAZIL','Brazil','BRA',76),(31,'IO','BRITISH INDIAN OCEAN TERRITORY','British Indian Ocean Territory',NULL,NULL),(32,'BN','BRUNEI DARUSSALAM','Brunei Darussalam','BRN',96),(33,'BG','BULGARIA','Bulgaria','BGR',100),(34,'BF','BURKINA FASO','Burkina Faso','BFA',854),(35,'BI','BURUNDI','Burundi','BDI',108),(36,'KH','CAMBODIA','Cambodia','KHM',116),(37,'CM','CAMEROON','Cameroon','CMR',120),(38,'CA','CANADA','Canada','CAN',124),(39,'CV','CAPE VERDE','Cape Verde','CPV',132),(40,'KY','CAYMAN ISLANDS','Cayman Islands','CYM',136),(41,'CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','CAF',140),(42,'TD','CHAD','Chad','TCD',148),(43,'CL','CHILE','Chile','CHL',152),(44,'CN','CHINA','China','CHN',156),(45,'CX','CHRISTMAS ISLAND','Christmas Island',NULL,NULL),(46,'CC','COCOS (KEELING) ISLANDS','Cocos (Keeling) Islands',NULL,NULL),(47,'CO','COLOMBIA','Colombia','COL',170),(48,'KM','COMOROS','Comoros','COM',174),(49,'CG','CONGO','Congo','COG',178),(50,'CD','CONGO, THE DEMOCRATIC REPUBLIC OF THE','Congo, the Democratic Republic of the','COD',180),(51,'CK','COOK ISLANDS','Cook Islands','COK',184),(52,'CR','COSTA RICA','Costa Rica','CRI',188),(53,'CI','COTE D\'IVOIRE','Cote D\'Ivoire','CIV',384),(54,'HR','CROATIA','Croatia','HRV',191),(55,'CU','CUBA','Cuba','CUB',192),(56,'CY','CYPRUS','Cyprus','CYP',196),(57,'CZ','CZECH REPUBLIC','Czech Republic','CZE',203),(58,'DK','DENMARK','Denmark','DNK',208),(59,'DJ','DJIBOUTI','Djibouti','DJI',262),(60,'DM','DOMINICA','Dominica','DMA',212),(61,'DO','DOMINICAN REPUBLIC','Dominican Republic','DOM',214),(62,'EC','ECUADOR','Ecuador','ECU',218),(63,'EG','EGYPT','Egypt','EGY',818),(64,'SV','EL SALVADOR','El Salvador','SLV',222),(65,'GQ','EQUATORIAL GUINEA','Equatorial Guinea','GNQ',226),(66,'ER','ERITREA','Eritrea','ERI',232),(67,'EE','ESTONIA','Estonia','EST',233),(68,'ET','ETHIOPIA','Ethiopia','ETH',231),(69,'FK','FALKLAND ISLANDS (MALVINAS)','Falkland Islands (Malvinas)','FLK',238),(70,'FO','FAROE ISLANDS','Faroe Islands','FRO',234),(71,'FJ','FIJI','Fiji','FJI',242),(72,'FI','FINLAND','Finland','FIN',246),(73,'FR','FRANCE','France','FRA',250),(74,'GF','FRENCH GUIANA','French Guiana','GUF',254),(75,'PF','FRENCH POLYNESIA','French Polynesia','PYF',258),(76,'TF','FRENCH SOUTHERN TERRITORIES','French Southern Territories',NULL,NULL),(77,'GA','GABON','Gabon','GAB',266),(78,'GM','GAMBIA','Gambia','GMB',270),(79,'GE','GEORGIA','Georgia','GEO',268),(80,'DE','GERMANY','Germany','DEU',276),(81,'GH','GHANA','Ghana','GHA',288),(82,'GI','GIBRALTAR','Gibraltar','GIB',292),(83,'GR','GREECE','Greece','GRC',300),(84,'GL','GREENLAND','Greenland','GRL',304),(85,'GD','GRENADA','Grenada','GRD',308),(86,'GP','GUADELOUPE','Guadeloupe','GLP',312),(87,'GU','GUAM','Guam','GUM',316),(88,'GT','GUATEMALA','Guatemala','GTM',320),(89,'GN','GUINEA','Guinea','GIN',324),(90,'GW','GUINEA-BISSAU','Guinea-Bissau','GNB',624),(91,'GY','GUYANA','Guyana','GUY',328),(92,'HT','HAITI','Haiti','HTI',332),(93,'HM','HEARD ISLAND AND MCDONALD ISLANDS','Heard Island and Mcdonald Islands',NULL,NULL),(94,'VA','HOLY SEE (VATICAN CITY STATE)','Holy See (Vatican City State)','VAT',336),(95,'HN','HONDURAS','Honduras','HND',340),(96,'HK','HONG KONG','Hong Kong','HKG',344),(97,'HU','HUNGARY','Hungary','HUN',348),(98,'IS','ICELAND','Iceland','ISL',352),(99,'IN','INDIA','India','IND',356),(100,'ID','INDONESIA','Indonesia','IDN',360),(101,'IR','IRAN, ISLAMIC REPUBLIC OF','Iran, Islamic Republic of','IRN',364),(102,'IQ','IRAQ','Iraq','IRQ',368),(103,'IE','IRELAND','Ireland','IRL',372),(104,'IL','ISRAEL','Israel','ISR',376),(105,'IT','ITALY','Italy','ITA',380),(106,'JM','JAMAICA','Jamaica','JAM',388),(107,'JP','JAPAN','Japan','JPN',392),(108,'JO','JORDAN','Jordan','JOR',400),(109,'KZ','KAZAKHSTAN','Kazakhstan','KAZ',398),(110,'KE','KENYA','Kenya','KEN',404),(111,'KI','KIRIBATI','Kiribati','KIR',296),(112,'KP','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','Korea, Democratic People\'s Republic of','PRK',408),(113,'KR','KOREA, REPUBLIC OF','Korea, Republic of','KOR',410),(114,'KW','KUWAIT','Kuwait','KWT',414),(115,'KG','KYRGYZSTAN','Kyrgyzstan','KGZ',417),(116,'LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC','Lao People\'s Democratic Republic','LAO',418),(117,'LV','LATVIA','Latvia','LVA',428),(118,'LB','LEBANON','Lebanon','LBN',422),(119,'LS','LESOTHO','Lesotho','LSO',426),(120,'LR','LIBERIA','Liberia','LBR',430),(121,'LY','LIBYAN ARAB JAMAHIRIYA','Libyan Arab Jamahiriya','LBY',434),(122,'LI','LIECHTENSTEIN','Liechtenstein','LIE',438),(123,'LT','LITHUANIA','Lithuania','LTU',440),(124,'LU','LUXEMBOURG','Luxembourg','LUX',442),(125,'MO','MACAO','Macao','MAC',446),(126,'MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','Macedonia, the Former Yugoslav Republic of','MKD',807),(127,'MG','MADAGASCAR','Madagascar','MDG',450),(128,'MW','MALAWI','Malawi','MWI',454),(129,'MY','MALAYSIA','Malaysia','MYS',458),(130,'MV','MALDIVES','Maldives','MDV',462),(131,'ML','MALI','Mali','MLI',466),(132,'MT','MALTA','Malta','MLT',470),(133,'MH','MARSHALL ISLANDS','Marshall Islands','MHL',584),(134,'MQ','MARTINIQUE','Martinique','MTQ',474),(135,'MR','MAURITANIA','Mauritania','MRT',478),(136,'MU','MAURITIUS','Mauritius','MUS',480),(137,'YT','MAYOTTE','Mayotte',NULL,NULL),(138,'MX','MEXICO','Mexico','MEX',484),(139,'FM','MICRONESIA, FEDERATED STATES OF','Micronesia, Federated States of','FSM',583),(140,'MD','MOLDOVA, REPUBLIC OF','Moldova, Republic of','MDA',498),(141,'MC','MONACO','Monaco','MCO',492),(142,'MN','MONGOLIA','Mongolia','MNG',496),(143,'MS','MONTSERRAT','Montserrat','MSR',500),(144,'MA','MOROCCO','Morocco','MAR',504),(145,'MZ','MOZAMBIQUE','Mozambique','MOZ',508),(146,'MM','MYANMAR','Myanmar','MMR',104),(147,'NA','NAMIBIA','Namibia','NAM',516),(148,'NR','NAURU','Nauru','NRU',520),(149,'NP','NEPAL','Nepal','NPL',524),(150,'NL','NETHERLANDS','Netherlands','NLD',528),(151,'AN','NETHERLANDS ANTILLES','Netherlands Antilles','ANT',530),(152,'NC','NEW CALEDONIA','New Caledonia','NCL',540),(153,'NZ','NEW ZEALAND','New Zealand','NZL',554),(154,'NI','NICARAGUA','Nicaragua','NIC',558),(155,'NE','NIGER','Niger','NER',562),(156,'NG','NIGERIA','Nigeria','NGA',566),(157,'NU','NIUE','Niue','NIU',570),(158,'NF','NORFOLK ISLAND','Norfolk Island','NFK',574),(159,'MP','NORTHERN MARIANA ISLANDS','Northern Mariana Islands','MNP',580),(160,'NO','NORWAY','Norway','NOR',578),(161,'OM','OMAN','Oman','OMN',512),(162,'PK','PAKISTAN','Pakistan','PAK',586),(163,'PW','PALAU','Palau','PLW',585),(164,'PS','PALESTINIAN TERRITORY, OCCUPIED','Palestinian Territory, Occupied',NULL,NULL),(165,'PA','PANAMA','Panama','PAN',591),(166,'PG','PAPUA NEW GUINEA','Papua New Guinea','PNG',598),(167,'PY','PARAGUAY','Paraguay','PRY',600),(168,'PE','PERU','Peru','PER',604),(169,'PH','PHILIPPINES','Philippines','PHL',608),(170,'PN','PITCAIRN','Pitcairn','PCN',612),(171,'PL','POLAND','Poland','POL',616),(172,'PT','PORTUGAL','Portugal','PRT',620),(173,'PR','PUERTO RICO','Puerto Rico','PRI',630),(174,'QA','QATAR','Qatar','QAT',634),(175,'RE','REUNION','Reunion','REU',638),(176,'RO','ROMANIA','Romania','ROM',642),(177,'RU','RUSSIAN FEDERATION','Russian Federation','RUS',643),(178,'RW','RWANDA','Rwanda','RWA',646),(179,'SH','SAINT HELENA','Saint Helena','SHN',654),(180,'KN','SAINT KITTS AND NEVIS','Saint Kitts and Nevis','KNA',659),(181,'LC','SAINT LUCIA','Saint Lucia','LCA',662),(182,'PM','SAINT PIERRE AND MIQUELON','Saint Pierre and Miquelon','SPM',666),(183,'VC','SAINT VINCENT AND THE GRENADINES','Saint Vincent and the Grenadines','VCT',670),(184,'WS','SAMOA','Samoa','WSM',882),(185,'SM','SAN MARINO','San Marino','SMR',674),(186,'ST','SAO TOME AND PRINCIPE','Sao Tome and Principe','STP',678),(187,'SA','SAUDI ARABIA','Saudi Arabia','SAU',682),(188,'SN','SENEGAL','Senegal','SEN',686),(189,'CS','SERBIA AND MONTENEGRO','Serbia and Montenegro',NULL,NULL),(190,'SC','SEYCHELLES','Seychelles','SYC',690),(191,'SL','SIERRA LEONE','Sierra Leone','SLE',694),(192,'SG','SINGAPORE','Singapore','SGP',702),(193,'SK','SLOVAKIA','Slovakia','SVK',703),(194,'SI','SLOVENIA','Slovenia','SVN',705),(195,'SB','SOLOMON ISLANDS','Solomon Islands','SLB',90),(196,'SO','SOMALIA','Somalia','SOM',706),(197,'ZA','SOUTH AFRICA','South Africa','ZAF',710),(198,'GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','South Georgia and the South Sandwich Islands',NULL,NULL),(199,'ES','SPAIN','Spain','ESP',724),(200,'LK','SRI LANKA','Sri Lanka','LKA',144),(201,'SD','SUDAN','Sudan','SDN',736),(202,'SR','SURINAME','Suriname','SUR',740),(203,'SJ','SVALBARD AND JAN MAYEN','Svalbard and Jan Mayen','SJM',744),(204,'SZ','SWAZILAND','Swaziland','SWZ',748),(205,'SE','SWEDEN','Sweden','SWE',752),(206,'CH','SWITZERLAND','Switzerland','CHE',756),(207,'SY','SYRIAN ARAB REPUBLIC','Syrian Arab Republic','SYR',760),(208,'TW','TAIWAN, PROVINCE OF CHINA','Taiwan, Province of China','TWN',158),(209,'TJ','TAJIKISTAN','Tajikistan','TJK',762),(210,'TZ','TANZANIA, UNITED REPUBLIC OF','Tanzania, United Republic of','TZA',834),(211,'TH','THAILAND','Thailand','THA',764),(212,'TL','TIMOR-LESTE','Timor-Leste',NULL,NULL),(213,'TG','TOGO','Togo','TGO',768),(214,'TK','TOKELAU','Tokelau','TKL',772),(215,'TO','TONGA','Tonga','TON',776),(216,'TT','TRINIDAD AND TOBAGO','Trinidad and Tobago','TTO',780),(217,'TN','TUNISIA','Tunisia','TUN',788),(218,'TR','TURKEY','Turkey','TUR',792),(219,'TM','TURKMENISTAN','Turkmenistan','TKM',795),(220,'TC','TURKS AND CAICOS ISLANDS','Turks and Caicos Islands','TCA',796),(221,'TV','TUVALU','Tuvalu','TUV',798),(222,'UG','UGANDA','Uganda','UGA',800),(223,'UA','UKRAINE','Ukraine','UKR',804),(224,'AE','UNITED ARAB EMIRATES','United Arab Emirates','ARE',784),(225,'GB','UNITED KINGDOM','United Kingdom','GBR',826),(226,'US','UNITED STATES','United States','USA',840),(227,'UM','UNITED STATES MINOR OUTLYING ISLANDS','United States Minor Outlying Islands',NULL,NULL),(228,'UY','URUGUAY','Uruguay','URY',858),(229,'UZ','UZBEKISTAN','Uzbekistan','UZB',860),(230,'VU','VANUATU','Vanuatu','VUT',548),(231,'VE','VENEZUELA','Venezuela','VEN',862),(232,'VN','VIET NAM','Viet Nam','VNM',704),(233,'VG','VIRGIN ISLANDS, BRITISH','Virgin Islands, British','VGB',92),(234,'VI','VIRGIN ISLANDS, U.S.','Virgin Islands, U.s.','VIR',850),(235,'WF','WALLIS AND FUTUNA','Wallis and Futuna','WLF',876),(236,'EH','WESTERN SAHARA','Western Sahara','ESH',732),(237,'YE','YEMEN','Yemen','YEM',887),(238,'ZM','ZAMBIA','Zambia','ZMB',894),(239,'ZW','ZIMBABWE','Zimbabwe','ZWE',716);
/*!40000 ALTER TABLE `cb_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_editors_picks`
--

DROP TABLE IF EXISTS `cb_editors_picks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_editors_picks` (
  `pick_id` int(225) NOT NULL AUTO_INCREMENT,
  `videoid` int(225) NOT NULL,
  `sort` bigint(5) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pick_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_editors_picks`
--

LOCK TABLES `cb_editors_picks` WRITE;
/*!40000 ALTER TABLE `cb_editors_picks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_editors_picks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_email_templates`
--

DROP TABLE IF EXISTS `cb_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_email_templates` (
  `email_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_template_name` varchar(225) NOT NULL,
  `email_template_code` varchar(225) NOT NULL,
  `email_template_subject` mediumtext NOT NULL,
  `email_template` text NOT NULL,
  `email_template_allowed_tags` mediumtext NOT NULL,
  PRIMARY KEY (`email_template_id`),
  UNIQUE KEY `email_template_code` (`email_template_code`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_email_templates`
--

LOCK TABLES `cb_email_templates` WRITE;
/*!40000 ALTER TABLE `cb_email_templates` DISABLE KEYS */;
INSERT INTO `cb_email_templates` VALUES (1,'Share Video Template','share_video_template','[{website_title}] - {username} wants to share a video with you','<html>\r\n<head>\r\n<style type=\"text/css\">\r\n<!--\r\n.title {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #FFFFFF;\r\n	font-size: 16px;\r\n}\r\n.title2 {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #000000;\r\n	font-size: 14px;\r\n}\r\n.messege {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #000000;\r\n	font-size: 12px;\r\n}\r\n#videoThumb{\r\n	width: 120px;\r\n	padding: 2px;\r\n	margin: 3px;\r\n	border: 1px solid #F0F0F0;\r\n	text-align: center;\r\n	vertical-align: middle;\r\n}\r\n#videoThumb img{border:0px}\r\nbody,td,th {\r\n	font-family: tahoma;\r\n	font-size: 11px;\r\n	color: #FFFFFF;\r\n}\r\n.text {\r\n	font-family: tahoma;\r\n	font-size: 11px;\r\n	color: #000000;\r\n	padding: 5px;\r\n}\r\n-->\r\n</style>\r\n</head>\r\n<body>\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">\r\n  <tr>\r\n    <td bgcolor=\"#53baff\" ><span class=\"title\">{website_title}</span>share video</td>\r\n  </tr>\r\n  <tr>\r\n    <td height=\"20\" class=\"messege\">{username} wants to share Video With You\r\n      <div id=\"videoThumb\"><a href=\"{video_link}\"><img src=\"{video_thumb}\"><br>\r\n    watch video</a></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td class=\"text\" ><span class=\"title2\">Video Description</span><br>\r\n      <span class=\"text\">{video_description}</span></td>\r\n  </tr>\r\n  <tr>\r\n    <td><span class=\"title2\">Personal Message</span><br>\r\n      <span class=\"text\">{user_message}\r\n      </span><br>\r\n      <br>\r\n<span class=\"text\">Thanks,</span><br> \r\n<span class=\"text\">{username}</span></td>\r\n  </tr>\r\n  <tr>\r\n    <td bgcolor=\"#53baff\">copyrights {date_year} {website_title}</td>\r\n  </tr>\r\n</table>\r\n</body>\r\n</html>','{website_title},{'),(2,'Email Verification Template','email_verify_template','[{website_title}] - Account activation email','Hello {username},\r\nThank you for joining {website_title}, one last step is required in order to activate your account\r\n\r\n<a href=\'{baseurl}/activation.php?av_username={username}&avcode={avcode}\'>Click Here</a>\r\n{baseurl}/activation.php?av_username={username}&avcode={avcode}\r\n\r\nEmail           : {email}\r\nUsername        : {username}\r\nActivation code : {avcode}\r\n\r\nif above given is not working , please go here and activate it\r\n<a href=\'{baseurl}/activation.php\'>{baseurl}/activation.php</a>\r\n\r\n====================\r\nRegards\r\n{website_title}',''),(3,'Private Message Notification','pm_email_message','[{website_title}] - {sender} has sent you a private message','{sender} has sent you a private message, \r\n\r\n{subject}\r\n\"{content}\"\r\n\r\nclick here to view your inbox <a href=\"{baseurl}/private_message.php?mode=inbox&mid={msg_id}\">{baseurl}/private_message.php?mode=inbox&mid={msg_id}</a>\r\n\r\n{website_title}',''),(4,'Acitvation code request template','avcode_request_template','[{website_title}] - Account activation code request','Hello {username},\r\n\r\nYour Activation Code is : {avcode}\r\n<a href=\'{baseurl}/activation.php?av_username={username}&avcode={avcode}\'>Click Here</a> To goto Activation Page\r\n\r\nDirect Activation\r\n==========================================\r\nClick Here or Copy & Paste the following link in your browser\r\n{baseurl}/activation.php?av_username={username}&avcode={avcode}\r\n\r\nif above given links are not working, please go here and activate it\r\n\r\nEmail           : {email}\r\nUsername        : {username}\r\nActivation code : {avcode}\r\n\r\nif above given is not working , please go here and activate it\r\n<a href=\'{baseurl}/activation.php\'>{baseurl}/activation.php</a>\r\n\r\n----------------\r\nRegards\r\n{website_title}','username,email,avcode,doj'),(5,'Welcome Message Template','welcome_message_template','Welcome {username} to {website_title}','Hello {username},\r\nThanks for joining at {website_title}!, you are now part of our community and we hope you will enjoy your stay\r\n\r\nAll the best,\r\n{website_title}','username,email'),(6,'Password Reset Request','password_reset_request','[{website_title}] - Password reset confirmation','Dear {username}\r\nyou have requested a password reset, please follow the link in order to reset your password\r\n<a href=\"{baseurl}/forgot.php?mode=reset_pass&user={userid}&avcode={avcode}\">{baseurl}/forgot.php?mode=reset_pass&user={userid}&avcode={avcode}</a>\r\n\r\n-----------------------------------------\r\nIF YOU HAVE NOT REQUESTED A PASSWORD RESET - PLEASE IGNORE THIS MESSAGE\r\n-----------------------------------------\r\nRegards\r\n{website_title}','username,userid,avcode'),(7,'Password Reset Details','password_reset_details','[{website_title}] - Password reset details','Dear {username}\r\nyour password has been reset\r\nyour new password is : {password}\r\n\r\n<a href=\"{login_link}\">click here to login to website</a>\r\n<{login_link}>\r\n\r\n---------------\r\nRegards\r\n{website_title}','username,password'),(8,'Forgot username request','forgot_username_request','[{website_title}] - your {website_title} username','Hello,\r\nyour {website_title} username is : {username}\r\n\r\n--------------\r\nRegards\r\n{website_title}','{username}'),(9,'Friend Request Email','friend_request_email','[{website_title}] {username} add you as friend','Hi {reciever},\r\n{sender} added you as a friend on {website_title}. We need to confirm that you know {sender} in order for you to be friends on {website_title}.\r\n\r\n<a href=\"{sender_link}\">View profile of {sender}</a> \r\n<a href=\"{request_link}\">click here to respond to friendship request</a>\r\n\r\nThanks,\r\n{website_title} Team','reciever,sender,sender_link,request_link'),(10,'Friend Confirmation Email','friend_confirmation_email','[{website_title}] - {sender} has confirmed you as a friend','Hi {reciever},\r\n{sender} confirmed you as a friend on {website_title}.\r\n\r\n<a href=\"{sender_link}\">View {sender} profile</a>\r\n\r\nThanks,\r\nThe {website_title} Team','sender,reciever,sender_link'),(11,'Group Invitation','group_invitation','[{website_title}] {sender} has invited you to join group \"{group_name}\"','{sender} invited you to join the {website_title} group \"{group_name}\".\r\n\r\n{group_description}\r\n\r\nTo see more details and confirm this group invitation, follow the link below:\r\n<a href=\"{group_url}\">{group_url}</a>\r\n\r\nThanks,\r\n{website_title}','sender,reciever,group_name,group_url'),(12,'Contact Form','contact_form','[{website_title} - Contact] {reason} from {name}','Name : {name}\r\nEmail : {email}\r\nReason : {reason}\r\n\r\nMessage:\r\n{message}\r\n\r\n===============\r\nIp : {ip_address}\r\ndate : {now}',''),(13,'Video Acitvation Email','video_activation_email','[{website_title}] - Your video has been activated','Hello {username},\r\nYour video has been reviewed and activated by one of our staff, thanks for uploading this video. You can view this video here.\r\n{video_link}\r\n\r\nThanks\r\n{website_title} Team',''),(14,'User Comment Email','user_comment_email','[{website_title}] {username} made comment on your {obj}','{username} has commented on your {obj}\r\n\"{comment}\"\r\n\r\n<a href=\"{obj_link}\">{obj_link}</a>\r\n\r\n{website_title} team',''),(15,'Photo Share Template','photo_share_template','{username} wants to share photo with you','<html>\r\n<head>\r\n<style type=\"text/css\">\r\n<!--\r\n.title {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #FFFFFF;\r\n	font-size: 16px;\r\n}\r\n.title2 {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #000000;\r\n	font-size: 14px;\r\n}\r\n.messege {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #000000;\r\n	font-size: 12px;\r\n}\r\n#videoThumb{\r\n	float:left;\r\n	padding: 2px;\r\n	margin: 3px;\r\n	border: 1px solid #F0F0F0;\r\n	text-align: center;\r\n	vertical-align: middle;\r\n}\r\n#videoThumb img{border:0px}\r\nbody,td,th {\r\n	font-family: tahoma;\r\n	font-size: 11px;\r\n	color: #FFFFFF;\r\n}\r\n.text {\r\n	font-family: tahoma;\r\n	font-size: 11px;\r\n	color: #000000;\r\n	padding: 5px;\r\n}\r\n-->\r\n</style>\r\n</head>\r\n<body>\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">\r\n  <tr>\r\n    <td bgcolor=\"#0099cc\" ><span class=\"title\">{website_title}</span></td>\r\n  </tr>\r\n\r\n  <tr>\r\n    <td height=\"20\" class=\"messege\">{username} wants to share this photo with you<br>\r\n      <div id=\"videoThumb\"><a class=\"text\" title=\"{photo_title}\" href=\"{photo_link}\"><img src=\"{photo_thumb}\"><br>\r\n    View Photo</a></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td class=\"text\" ><span class=\"title2\">Photo Description</span><br>\r\n      <span class=\"text\">{photo_description}</span></td>\r\n  </tr>\r\n  <tr>\r\n    <td><span class=\"title2\">Personal Message</span><br>\r\n      <span class=\"text\">{user_message}\r\n      </span><br>\r\n      <br>\r\n<span class=\"text\">Thanks,</span><br> \r\n<span class=\"text\">{website_title}</span></td>\r\n  </tr>\r\n  <tr>\r\n    <td bgcolor=\"#0099cc\">copyrights {date_year} {website_title}</td>\r\n  </tr>\r\n</table>\r\n</body>\r\n</html>',''),(16,'Video Subscription Email','video_subscription_email','{uploader} has uploaded new video on {website_title}','Hello {username}\r\n\r\nYou have been notified by {website_title} that {uploader} has uploaded new video \r\n\r\nVideo Title : {video_title}\r\nVideo Description : {video_description}\r\n\r\n\r\n<a href=\"{video_link}\">\r\n<img src=\"{video_thumb}\" border=\"0\" height=\"90\" width=\"120\"><br>\r\nclick here to watch this video</a>\r\n\r\n\r\nYou are notified because you are subscribed to {uploader}, you can manage your subscriptions by going to your account and click on manage subscriptions.\r\n{website_title}',''),(17,'Collection Share Template','collection_share_template','{username} wants to share collection with you','<html>\r\n<head>\r\n<style type=\"text/css\">\r\n<!--\r\n.title {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #FFFFFF;\r\n	font-size: 16px;\r\n}\r\n.title2 {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #000000;\r\n	font-size: 14px;\r\n}\r\n.messege {\r\n	font-family:Tahoma, Geneva, sans-serif;\r\n	padding: 5px;\r\n	font-weight:bold;\r\n	color: #000000;\r\n	font-size: 11px;\r\n}\r\n#videoThumb{\r\n	float:left;\r\n	padding: 2px;\r\n	margin: 3px;\r\n	border: 1px solid #F0F0F0;\r\n	text-align: center;\r\n	vertical-align: middle;\r\n}\r\n#videoThumb img{border:0px}\r\nbody,td,th {\r\n	font-family: tahoma;\r\n	font-size: 11px;\r\n	color: #FFFFFF;\r\n}\r\n.text, .text2 {\r\n	font-family: tahoma;\r\n	font-size: 11px;\r\n	color: #000000;\r\n	padding: 5px;\r\n}\r\n\r\n.text2 {\r\n	font-size: 10px;\r\n	padding: 0px;\r\n}\r\n-->\r\n</style>\r\n</head>\r\n<body>\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"5\">\r\n  <tr>\r\n    <td bgcolor=\"#0099cc\" ><span class=\"title\">{website_title}</span></td>\r\n  </tr>\r\n\r\n  <tr>\r\n    <td height=\"20\" class=\"messege\">{username} wants to share this collection with you.<br>\r\n      <div id=\"videoThumb\"><a class=\"text\" title=\"{name}\" href=\"{collection_link}\"><img src=\"{collection_thumb}\"><br>\r\n    View Collection <small class=\'text2\'>({total_items} {type})</small></a></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td class=\"text\" ><span class=\"title2\">Collection Description</span><br>\r\n      <span class=\"text\">{description}</span></td>\r\n  </tr>\r\n  <tr>\r\n    <td><span class=\"title2\">Personal Message</span><br>\r\n      <span class=\"text\">{user_message}\r\n      </span><br>\r\n      <br>\r\n<span class=\"text\">Thanks,</span><br> \r\n<span class=\"text\">{website_title}</span></td>\r\n  </tr>\r\n  <tr>\r\n    <td bgcolor=\"#0099cc\">copyrights {date_year} {website_title}</td>\r\n  </tr>\r\n</table>\r\n</body>\r\n</html>','');
/*!40000 ALTER TABLE `cb_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_favorites`
--

DROP TABLE IF EXISTS `cb_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_favorites` (
  `favorite_id` int(225) NOT NULL AUTO_INCREMENT,
  `type` varchar(4) NOT NULL,
  `id` int(225) NOT NULL,
  `userid` int(225) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_favorites`
--

LOCK TABLES `cb_favorites` WRITE;
/*!40000 ALTER TABLE `cb_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_flags`
--

DROP TABLE IF EXISTS `cb_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_flags` (
  `flag_id` int(225) NOT NULL AUTO_INCREMENT,
  `type` varchar(4) NOT NULL,
  `id` int(225) NOT NULL,
  `userid` int(225) NOT NULL,
  `flag_type` bigint(25) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`flag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_flags`
--

LOCK TABLES `cb_flags` WRITE;
/*!40000 ALTER TABLE `cb_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_group_categories`
--

DROP TABLE IF EXISTS `cb_group_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_group_categories` (
  `category_id` int(225) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL DEFAULT '',
  `category_order` int(5) NOT NULL DEFAULT '1',
  `category_desc` text NOT NULL,
  `date_added` mediumtext NOT NULL,
  `category_thumb` mediumtext NOT NULL,
  `isdefault` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_group_categories`
--

LOCK TABLES `cb_group_categories` WRITE;
/*!40000 ALTER TABLE `cb_group_categories` DISABLE KEYS */;
INSERT INTO `cb_group_categories` VALUES (1,'Uncategorized',1,'Uncategorized','2015-06-17 10:22:24','','yes');
/*!40000 ALTER TABLE `cb_group_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_group_invitations`
--

DROP TABLE IF EXISTS `cb_group_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_group_invitations` (
  `invitation_id` int(225) NOT NULL AUTO_INCREMENT,
  `group_id` int(225) NOT NULL,
  `userid` int(255) NOT NULL,
  `invited` int(225) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invitation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_group_invitations`
--

LOCK TABLES `cb_group_invitations` WRITE;
/*!40000 ALTER TABLE `cb_group_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_group_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_group_members`
--

DROP TABLE IF EXISTS `cb_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_group_members` (
  `group_mid` int(225) NOT NULL AUTO_INCREMENT,
  `group_id` int(225) NOT NULL,
  `userid` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`group_mid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_group_members`
--

LOCK TABLES `cb_group_members` WRITE;
/*!40000 ALTER TABLE `cb_group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_group_posts`
--

DROP TABLE IF EXISTS `cb_group_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_group_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `post_content` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_group_posts`
--

LOCK TABLES `cb_group_posts` WRITE;
/*!40000 ALTER TABLE `cb_group_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_group_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_group_topics`
--

DROP TABLE IF EXISTS `cb_group_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_group_topics` (
  `topic_id` int(225) NOT NULL AUTO_INCREMENT,
  `topic_title` text NOT NULL,
  `userid` int(225) NOT NULL,
  `group_id` int(225) NOT NULL,
  `topic_post` text NOT NULL,
  `date_added` datetime NOT NULL,
  `last_poster` int(225) NOT NULL,
  `last_post_time` datetime NOT NULL,
  `total_views` bigint(225) NOT NULL,
  `total_replies` bigint(225) NOT NULL,
  `topic_icon` varchar(225) NOT NULL,
  `approved` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_group_topics`
--

LOCK TABLES `cb_group_topics` WRITE;
/*!40000 ALTER TABLE `cb_group_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_group_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_group_videos`
--

DROP TABLE IF EXISTS `cb_group_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_group_videos` (
  `group_video_id` int(225) NOT NULL AUTO_INCREMENT,
  `videoid` int(255) NOT NULL,
  `group_id` int(225) NOT NULL,
  `userid` int(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`group_video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_group_videos`
--

LOCK TABLES `cb_group_videos` WRITE;
/*!40000 ALTER TABLE `cb_group_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_group_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_groups`
--

DROP TABLE IF EXISTS `cb_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_groups` (
  `group_id` int(225) NOT NULL AUTO_INCREMENT,
  `group_name` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(255) NOT NULL,
  `group_admins` text NOT NULL,
  `group_description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `group_tags` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `group_url` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `group_privacy` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `video_type` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `post_type` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `active` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `date_added` datetime NOT NULL,
  `featured` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `total_views` bigint(225) NOT NULL,
  `total_videos` int(225) NOT NULL,
  `total_members` int(225) NOT NULL,
  `total_topics` int(225) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_groups`
--

LOCK TABLES `cb_groups` WRITE;
/*!40000 ALTER TABLE `cb_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_languages`
--

DROP TABLE IF EXISTS `cb_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_languages` (
  `language_id` int(9) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `language_regex` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language_active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `language_default` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `language_default` (`language_default`),
  KEY `language_code` (`language_code`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_languages`
--

LOCK TABLES `cb_languages` WRITE;
/*!40000 ALTER TABLE `cb_languages` DISABLE KEYS */;
INSERT INTO `cb_languages` VALUES (5,'en','English','/^en/i','yes','yes');
/*!40000 ALTER TABLE `cb_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_mass_emails`
--

DROP TABLE IF EXISTS `cb_mass_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_mass_emails` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email_subj` varchar(255) NOT NULL,
  `email_from` varchar(255) NOT NULL,
  `email_msg` text NOT NULL,
  `configs` text NOT NULL,
  `sent` bigint(255) NOT NULL,
  `total` bigint(20) NOT NULL,
  `users` text NOT NULL,
  `start_index` bigint(255) NOT NULL,
  `method` enum('browser','background') NOT NULL,
  `status` enum('completed','pending','sending') NOT NULL,
  `date_added` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_mass_emails`
--

LOCK TABLES `cb_mass_emails` WRITE;
/*!40000 ALTER TABLE `cb_mass_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_mass_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_messages`
--

DROP TABLE IF EXISTS `cb_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_messages` (
  `message_id` int(225) NOT NULL AUTO_INCREMENT,
  `message_from` int(20) NOT NULL,
  `message_to` varchar(200) NOT NULL,
  `message_content` mediumtext NOT NULL,
  `message_type` enum('pm','notification') NOT NULL DEFAULT 'pm',
  `message_attachments` mediumtext NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_subject` mediumtext NOT NULL,
  `message_status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `reply_to` int(225) NOT NULL DEFAULT '0',
  `message_box` enum('in','out') NOT NULL DEFAULT 'in',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_messages`
--

LOCK TABLES `cb_messages` WRITE;
/*!40000 ALTER TABLE `cb_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_modules`
--

DROP TABLE IF EXISTS `cb_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_modules` (
  `module_id` int(25) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(25) NOT NULL,
  `module_file` varchar(60) NOT NULL,
  `active` varchar(5) NOT NULL,
  `module_include_file` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_modules`
--

LOCK TABLES `cb_modules` WRITE;
/*!40000 ALTER TABLE `cb_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_pages`
--

DROP TABLE IF EXISTS `cb_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_order` bigint(100) NOT NULL,
  `display` enum('yes','no') NOT NULL DEFAULT 'yes',
  `page_name` varchar(225) NOT NULL,
  `page_title` varchar(225) NOT NULL,
  `page_content` text NOT NULL,
  `userid` int(225) NOT NULL,
  `active` enum('yes','no') NOT NULL,
  `delete_able` enum('yes','no') NOT NULL DEFAULT 'yes',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `active` (`active`,`display`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_pages`
--

LOCK TABLES `cb_pages` WRITE;
/*!40000 ALTER TABLE `cb_pages` DISABLE KEYS */;
INSERT INTO `cb_pages` VALUES (1,1,'yes','About us','About us','<div style=\"margin: auto; width: 98%;\"><font style=\"font-weight: bold;\" size=\"4\">About Us</font><hr noshade=\"noshade\" size=\"1\">\r\n  \r\n  \r\n    <p><span style=\"font-weight: bold;\">ClipBucket </span>is one of the world\'s best video sites . We specialize in short-form\r\noriginal content - from new, emerging talents and established Hollywood\r\nheavyweights alike. We\'re committed to delivering an exceptional\r\nentertainment experience, and we do so by engaging and empowering our\r\naudience every step of the way.</p>\r\n      <p>Everyone can Watch Videos\r\non <span style=\"font-weight: bold;\">ClipBucket</span>. People can see first-hand accounts of current events, find\r\nvideos about their hobbies and interests, and discover the\r\nquirky and unusual. As more people capture special moments on\r\nvideo,<span style=\"font-weight: bold;\">ClipBucket </span>is empowering them to become the broadcasters of\r\ntomorrow.</p>\r\n      <p><span style=\"font-weight: bold;\">ClipBucket </span>not only a video sharing website but\r\nalso has social network features, you can make friends,\r\nand send them videos and private messages. <span style=\"font-weight: bold;\">ClipBucket </span><span style=\"font-weight: bold;\"></span> also has built in\r\nrating system and comment system so that people can discuss on there\r\ninterested videos, not only comment but also, people can rate Comments.</p></div>',1,'yes','no','2010-01-01 08:47:56'),(2,2,'yes','Privacy Policy','Privacy Policy','<h1>ClipBucket Privacy Notice - YT Version\r\n</h1>\r\n<h2>Personal Information</h2>\r\n<ul>\r\n  <li><strong>Browsing ClipBucket</strong> You can watch videos on ClipBucket without having a ClipBucket Account or a  PHPBucket Account. You also can contact us through the ClipBucket Help Center  or by emailing us directly without having to register for an account.</li>\r\n  <li><strong>Your ClipBucket Account.</strong> For some activities on ClipBucket, like uploading videos, posting  comments, flagging videos, or watching restricted videos, you need a  ClipBucket or PHPBucket Account. We ask for some personal information when  you create an account, including your email address and a password,  which is used to protect your account from unauthorized access. A  PHPBucket Account, additionally, allows you to access other PHPBucket  services that require registration.</li>\r\n  <li><strong>Usage Information.</strong> When you use ClipBucket, we may record information about your usage of the  site, such as the channels, groups and favorites you subscribe to,  which other users you communicate with, the videos you watch, the  frequency and size of data transfers, and information you display about  yourself as well as information you click on in ClipBucket (including UI  elements, settings). If you are logged in, we may associate that  information with your ClipBucket Account. In order to ensure the quality  of our service to you, we may place a tag (also called a \"web beacon\")  in HTML-based customer support emails or other communications with you  in order to confirm delivery.</li>\r\n  <li><strong>Content Uploaded to Site.</strong> Any personal information or video content that you voluntarily disclose  online (e.g., video comments, your profile page) may be collected and  used by others. If you download the ClipBucket Uploader, your copy  includes a unique application number. This number, and information  about your installation of the Uploader (version number, language) will  be sent to ClipBucket when the Uploader automatically checks for updates  and will be used to update your version of the Uploader.</li>\r\n</ul>\r\n<h2>Uses</h2>\r\n<ul>\r\n  <li>If  you submit personal information to ClipBucket, we may use that information  to operate, maintain, and improve the features and functionality of  ClipBucket, and to process any flagging activity or other communication  you send to us.</li>\r\n  <li>We do not use your  email address or other personal information to send commercial or  marketing messages without your consent. We may use your email address  without further consent for non-marketing or administrative purposes  (such as notifying you of major ClipBucket changes or for customer service  purposes). You also can choose how often ClipBucket sends you email  updates in your ClipBucket Account settings page.</li>\r\n  <li>We  use cookies, web beacons, and log file information to: (a) store  information so that you will not have to re-enter it during your visit  or the next time you visit ClipBucket; (b) provide custom, personalized  content and information; (c) monitor the effectiveness of our marketing  campaigns; (d) monitor aggregate metrics such as total number of  visitors and pages viewed; and (e) track your entries, submissions, and  status in promotions, sweepstakes, and contests.</li>\r\n</ul>\r\n<h2>Information That is Publicly Available</h2>\r\n<ul>\r\n  <li>When  you create a ClipBucket Account, some information about your ClipBucket  Account and your account activity will be provided to other users of  ClipBucket. This may include the date you opened your ClipBucket Account, the  date you last logged into your ClipBucket Account, your age (if you choose  to make it public), the country and the number of videos you have  watched.</li>\r\n  <li>Your ClipBucket Account name,  not your email address, is displayed to other users when you engage in  certain activities on ClipBucket, such as when you upload videos or send  messages through ClipBucket. Other users can contact you by leaving a  message or comment on the site.</li>\r\n  <li>Any  videos that you submit to ClipBucket may be redistributed through the  internet and other media channels, and may be viewed by other ClipBucket  users or the general public. </li>\r\n  <li>You  may also choose to add personal information which may include your  name, gender, profile picture or other details, that will be visible to  other users on your ClipBucket Account channel page. If you choose to add  certain features to your ClipBucket Account channel page, then these  features and your activity associated with these features will be  displayed to other users and may be aggregated and shared with your  friends or other users. Such shared activity may include your favorite  videos, videos you rated and videos that you have uploaded.</li>\r\n</ul>\r\n<h2>Your Choices</h2>\r\n<ul>\r\n  <li>If  you have a ClipBucket Account, you may update or correct your personal  profile information, email preferences and privacy settings at any time  by visiting your account profile page. </li>\r\n  <li>You  may control the information that is available to other users and your  confirmed friends at any time by editing your ClipBucket Account and the  features that are included on your channel page. If you have enabled  Active Sharing, other users may see that you, as identified by your  account name, not your email address, are watching the same video.</li>\r\n  <li>You  may, of course, decline to submit personal information through ClipBucket,  in which case you can still view videos and explore ClipBucket, but  ClipBucket may not be able to provide certain services to you. Some  advanced ClipBucket features may use other PHPBucket services like PHPBucket  Checkout or AdSense. The privacy notices of those services govern the  use of your personal information associated with them.</li>\r\n</ul>\r\n',1,'no','no','2010-01-01 08:52:46'),(3,3,'yes','Terms of Serivce','Terms of Service','Write your own terms of service...',1,'yes','no','2010-01-01 08:53:57'),(4,4,'yes','Help','Help','<span style=\"font-weight: bold;\">How to use ClipBucket</span><br><ol><li>Articles will be written pretty soon</li></ol>',1,'yes','no','2010-01-01 09:17:36'),(5,5,'no','403 Error','403 Forbidden','<h2>403 Access Denied</h2>\r\nSorry, you cannot access this page...',1,'yes','no','0000-00-00 00:00:00'),(6,6,'no','404 Error','404 Not Found','<h2>404 Not Found</h2>\r\nwe are unable to find requested URL on server..',1,'yes','no','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cb_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_photos`
--

DROP TABLE IF EXISTS `cb_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_photos` (
  `photo_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `photo_key` mediumtext NOT NULL,
  `photo_title` mediumtext NOT NULL,
  `photo_description` mediumtext NOT NULL,
  `photo_tags` mediumtext NOT NULL,
  `userid` int(255) NOT NULL,
  `collection_id` int(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `last_viewed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `views` bigint(255) NOT NULL,
  `allow_comments` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_embedding` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_tagging` enum('yes','no') NOT NULL DEFAULT 'yes',
  `featured` enum('yes','no') NOT NULL DEFAULT 'no',
  `reported` enum('yes','no') NOT NULL DEFAULT 'no',
  `allow_rating` enum('yes','no') NOT NULL DEFAULT 'yes',
  `broadcast` enum('public','private') NOT NULL DEFAULT 'public',
  `active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `total_comments` int(255) NOT NULL,
  `last_commented` datetime NOT NULL,
  `total_favorites` int(255) NOT NULL,
  `rating` int(15) NOT NULL,
  `rated_by` int(25) NOT NULL,
  `voters` mediumtext NOT NULL,
  `filename` varchar(100) NOT NULL,
  `file_directory` varchar(25) NOT NULL,
  `ext` char(5) NOT NULL,
  `downloaded` bigint(255) NOT NULL,
  `server_url` text NOT NULL,
  `owner_ip` varchar(20) NOT NULL,
  `photo_details` varchar(255) NOT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_photos`
--

LOCK TABLES `cb_photos` WRITE;
/*!40000 ALTER TABLE `cb_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_phrases`
--

DROP TABLE IF EXISTS `cb_phrases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_phrases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_iso` varchar(5) NOT NULL DEFAULT 'en',
  `varname` varchar(250) NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10763 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_phrases`
--

LOCK TABLES `cb_phrases` WRITE;
/*!40000 ALTER TABLE `cb_phrases` DISABLE KEYS */;
INSERT INTO `cb_phrases` VALUES (9392,'en','ad_name_error','Please enter a name for the Advertisment'),(9393,'en','ad_code_error','Error : Please enter a code for the Advertisement'),(9394,'en','ad_exists_error1','Advertisement does not exist'),(9395,'en','ad_exists_error2','Error : Advertisement with this name already exist'),(9396,'en','ad_add_msg','Advertisment was added succesfully'),(9397,'en','ad_msg','Ad Has Been '),(9398,'en','ad_update_msg','Advertisment has been Updated'),(9399,'en','ad_del_msg','Advertisement has been Deleted'),(9400,'en','ad_deactive','Deactivated'),(9401,'en','ad_active','Activated'),(9402,'en','ad_placment_delete_msg','Placement has been Removed'),(9403,'en','ad_placement_err1','Placement already exists'),(9404,'en','ad_placement_err2','Please Enter a name for the Placement'),(9405,'en','ad_placement_err3','Please Enter a Code for the Placement'),(9406,'en','ad_placement_msg','Placement has been Added'),(9407,'en','cat_img_error','Please Upload JPEG, GIF or PNG image only'),(9408,'en','cat_exist_error','Category doesn&#8217;t exist'),(9409,'en','cat_add_msg','Category has been added successfully'),(9410,'en','cat_update_msg','Category has been updated'),(9411,'en','grp_err','Group Doesn&#8217;t Exist'),(9412,'en','grp_fr_msg','Group has been set as featured'),(9413,'en','grp_fr_msg1','Selected Groups Have Been Removed From The Featured List'),(9414,'en','grp_ac_msg','Selected Groups Have Been Activated'),(9415,'en','grp_dac_msg','Selected Groups Have Been Dectivated'),(9416,'en','grp_del_msg','Group has been deleted'),(9417,'en','editor_pic_up','Video Has Been Moved Up'),(9418,'en','editor_pic_down','Video Has Been Moved Down'),(9419,'en','plugin_install_msg','Plugin has been installed'),(9420,'en','plugin_no_file_err','No file was found'),(9421,'en','plugin_file_detail_err','Unknown plugin details found'),(9422,'en','plugin_installed_err','Plugin already installed'),(9423,'en','plugin_no_install_err','Plugin is not installed'),(9424,'en','grp_name_error','Please enter group name'),(9425,'en','grp_name_error1','Group Name Already Exists'),(9426,'en','grp_des_error','Please Enter A Little Description For The Group'),(9427,'en','grp_tags_error','Please Enter Tags For The Group'),(9428,'en','grp_url_error','Please enter valid url for the Group'),(9429,'en','grp_url_error1','Please enter Valid URL name'),(9430,'en','grp_url_error2','Group URL Already Exists, Please Choose a Different URL'),(9431,'en','grp_tpc_error','Please enter a topic to add'),(9432,'en','grp_comment_error','You must enter a comment'),(9433,'en','grp_join_error','You have already joined this group'),(9434,'en','grp_prvt_error','This Group Is Private, Please Login to View this Group'),(9435,'en','grp_inact_error','This Group Is Inactive, Please Contact Administrator for the problem'),(9436,'en','grp_join_error1','You Have Not Joined This Group Yet'),(9437,'en','grp_exist_error','Sorry, Group Doesn&#8217;t Exist'),(9438,'en','grp_tpc_error1','This Topic is not approved by the Group Owner'),(9439,'en','grp_cat_error','Please Select A Category For Your group'),(9440,'en','grp_tpc_error2','Please enter a topic to add'),(9441,'en','grp_tpc_error3','Your Topic Requires Approval From The Owner Of This Group'),(9442,'en','grp_tpc_msg','Topic has been added'),(9443,'en','grp_comment_msg','Comment has been added'),(9444,'en','grp_vdo_msg','Videos Deleted'),(9445,'en','grp_vdo_msg1','Videos Added Successfully'),(9446,'en','grp_vdo_msg2','Videos Have Been Approved'),(9447,'en','grp_mem_msg','Member Has Been Deleted'),(9448,'en','grp_mem_msg1','Member Has Been Approved'),(9449,'en','grp_inv_msg','Your Invitation Has Been Sent'),(9450,'en','grp_tpc_msg1','Topic has been deleted'),(9451,'en','grp_tpc_msg2','Topic Has Been Approved'),(9452,'en','grp_fr_msg2','Group has been removed from featured list'),(9453,'en','grp_inv_msg1','Has Invited You To Join '),(9454,'en','grp_av_msg','Group has been activated'),(9455,'en','grp_da_msg','Group has been deactivated'),(9456,'en','grp_post_msg','Post Has Been Deleted'),(9457,'en','grp_update_msg','Group has been updated'),(9458,'en','grp_owner_err','Only Owner Can Add Videos To This Group'),(9459,'en','grp_owner_err1','You are not owner of this group'),(9460,'en','grp_owner_err2','You are the owner of this group. You cannot leave your group.'),(9461,'en','grp_prvt_err1','This group is private, you need invitiation from its owner in order to join'),(9462,'en','grp_rmv_msg','Selected Groups Have Been Removed From Your Account'),(9463,'en','grp_tpc_err4','Sorry, Topic Doesn&#8217;t Exist'),(9464,'en','grp_title_topic','Groups - Topic - '),(9465,'en','grp_add_title','- Add Video'),(9466,'en','usr_sadmin_err','You Cannot Set SuperAdmin Username as Blank'),(9467,'en','usr_cpass_err','Confirm Password Doesn&#8217;t Match'),(9468,'en','usr_pass_err','Old password is incorrect'),(9469,'en','usr_email_err','Please Provide A Valid Email Address'),(9470,'en','usr_cpass_err1','Confirm password is incorrect'),(9471,'en','usr_pass_err1','Password is Incorrect'),(9472,'en','usr_cmt_err','You Must Login First To Comment'),(9473,'en','usr_cmt_err1','Please Type Something In the Comment Box'),(9474,'en','usr_cmt_err2','You cannot comment on your video'),(9475,'en','usr_cmt_err3','You Have Already Posted a Comment on this channel.'),(9476,'en','usr_cmt_err4','Comment Has Been Added'),(9477,'en','usr_cmt_del_msg','Comment Has Been Deleted'),(9478,'en','usr_cmt_del_err','An Error Occured While deleting a Comment'),(9479,'en','usr_cnt_err','You Cannot Add Yourself as a Contact'),(9480,'en','usr_cnt_err1','You Have Already Added This User To Your Contact List'),(9481,'en','usr_sub_err','You are already subscribed to %s'),(9482,'en','usr_exist_err','User Doesnt Exist'),(9483,'en','usr_ccode_err','Verification code you entered was wrong'),(9484,'en','usr_exist_err1','Sorry, No User Exists With This Email'),(9485,'en','usr_exist_err2','Sorry , User Doesn\'t Exist'),(9486,'en','usr_uname_err','Username is empty'),(9487,'en','usr_uname_err2','Username already exists'),(9488,'en','usr_pass_err2','Password Is Empty'),(9489,'en','usr_email_err1','Email is Empty'),(9490,'en','usr_email_err2','Please Enter A Valid Email Address'),(9491,'en','usr_email_err3','Email Address Is Already In Use'),(9492,'en','usr_pcode_err','Postal Codes Only Contain Numbers'),(9493,'en','usr_fname_err','First Name Is Empty'),(9494,'en','usr_lname_err','Last Name Is Empty'),(9495,'en','usr_uname_err3','Username Contains Unallowed Characters'),(9496,'en','usr_pass_err3','Passwords MisMatched'),(9497,'en','usr_dob_err','Please Select Date Of Birth'),(9498,'en','usr_ament_err','Sorry, you need to agree to the terms of use and privacy policy to create an account'),(9499,'en','usr_reg_err','Sorry, Registrations Are Temporarily Not Allowed, Please Try Again Later'),(9500,'en','usr_ban_err','User account is banned, please contact website administrator'),(9501,'en','usr_login_err','Username and Password Didn&#8217;t Match'),(9502,'en','usr_sadmin_msg','Super Admin Has Been Updated'),(9503,'en','usr_pass_msg','Your Password Has Been Changed'),(9504,'en','usr_cnt_msg','This User Has Been Added To Your Contact List'),(9505,'en','usr_sub_msg','You are now subsribed to %s'),(9506,'en','usr_uname_email_msg','We Have Sent you an Email containing Your Username, Please Check It'),(9507,'en','usr_rpass_email_msg','An Email Has Been Sent To You. Please Follow the Instructions there to Reset Your Password'),(9508,'en','usr_pass_email_msg','Password has been changed successfully'),(9509,'en','usr_email_msg','Email Settings Has Been Updated'),(9510,'en','usr_del_msg','User has been deleted'),(9511,'en','usr_dels_msg','Selected Users Have Been Deleted'),(9512,'en','usr_ac_msg','User has been activated'),(9513,'en','usr_dac_msg','User has been deactivated'),(9514,'en','usr_mem_ac','Selected Members Have Been Activated'),(9515,'en','usr_mems_ac','Selected Members Have Been Deactivated'),(9516,'en','usr_fr_msg','User Has Been Made a Featured Member'),(9517,'en','usr_ufr_msg','User Has Been Unfeatured'),(9518,'en','usr_frs_msg','Selected Users Have Been Set As Featured'),(9519,'en','usr_ufrs_msg','Selected Users Have Been Removed From The Featured List'),(9520,'en','usr_uban_msg','User Has Been Banned'),(9521,'en','usr_uuban_msg','User Has Been Unbanned'),(9522,'en','usr_ubans_msg','Selected Members Have Been Banned'),(9523,'en','usr_uubans_msg','Selected Members Have Been Unbanned'),(9524,'en','usr_pass_reset_conf','Password Reset Confirmation'),(9525,'en','usr_dear_user','Dear User'),(9526,'en','usr_pass_reset_msg','You Requested A Password Reset, Follow The Link To Reset Your Password'),(9527,'en','usr_rpass_msg','Password Has Been Reset'),(9528,'en','usr_rpass_req_msg','You Requested A Password Reset, Here is your new password : '),(9529,'en','usr_uname_req_msg','You Requested to Recover Your Username, Here is your username: '),(9530,'en','usr_uname_recovery','Username Recovery Email'),(9531,'en','usr_add_succ_msg','User Has Been Added'),(9532,'en','usr_upd_succ_msg','User has been updated'),(9533,'en','usr_activation_msg','Your account has been activated. Now you can login to your account and upload videos'),(9534,'en','usr_activation_err','This user is already activated'),(9535,'en','usr_activation_em_msg','We have sent you an email containing your activation code, please check your mail box'),(9536,'en','usr_activation_em_err','Email Doesn&#8217;t Exist or a User With This Email is already Activated'),(9537,'en','usr_no_msg_del_err','No Message Was Selected To Delete'),(9538,'en','usr_sel_msg_del_msg','Selected Messages Have Been Deleted'),(9539,'en','usr_pof_upd_msg','Profile has been updated'),(9540,'en','usr_arr_no_ans','no answer'),(9541,'en','usr_arr_elementary','Elementary'),(9542,'en','usr_arr_hi_school','High School'),(9543,'en','usr_arr_some_colg','Some College'),(9544,'en','usr_arr_assoc_deg','Associates Degree'),(9545,'en','usr_arr_bach_deg','Bachelor&#8217;s Degree'),(9546,'en','usr_arr_mast_deg','Master&#8217;s Degree'),(9547,'en','usr_arr_phd','Ph.D.'),(9548,'en','usr_arr_post_doc','Postdoctoral'),(9549,'en','usr_arr_single','Single'),(9550,'en','usr_arr_married','Married'),(9551,'en','usr_arr_comitted','Comitted'),(9552,'en','usr_arr_open_marriage','Open Marriage'),(9553,'en','usr_arr_open_relate','Open Relationship'),(9554,'en','title_crt_new_msg','Compose New Message'),(9555,'en','title_forgot','Forgot Something? Find it now !'),(9556,'en','title_inbox',' - Inbox'),(9557,'en','title_sent',' - Sent Folder'),(9558,'en','title_usr_contact','&#8217;s Contact List'),(9559,'en','title_usr_fav_vids','%s’s Favorite Videos'),(9560,'en','title_view_channel','&#8217;s Channel'),(9561,'en','title_edit_video','Edit Video - '),(9562,'en','vdo_title_err','Please Enter Video Title'),(9563,'en','vdo_des_err','Please Enter Video Description'),(9564,'en','vdo_tags_err','Please Enter Tags For The Video'),(9565,'en','vdo_cat_err','Please Choose Atleast 1 Category'),(9566,'en','vdo_cat_err1','You Can Only Choose Up to 3 Categories'),(9567,'en','vdo_sub_email_msg',' and therefore this message is sent to you automatically that '),(9568,'en','vdo_has_upload_nv','Has Uploaded New Video'),(9569,'en','vdo_del_selected','Selected Videos Have Been Deleted'),(9570,'en','vdo_cheat_msg','Please Don\'t Try To Cheat'),(9571,'en','vdo_limits_warn_msg','Please Don\'t Try To Cross Your Limits'),(9572,'en','vdo_cmt_del_msg','Comment Has Been Deleted'),(9573,'en','vdo_iac_msg','Video Is Inactive - Please Contact Admin For Details'),(9574,'en','vdo_is_in_process','Video Is Being Processed - Please Contact Administrator for further details'),(9575,'en','vdo_upload_allow_err','Uploading Is Not Allowed By Website Owner'),(9576,'en','vdo_download_allow_err','Video Downloading Is Not Allowed'),(9577,'en','vdo_edit_owner_err','You Are Not Video Owner'),(9578,'en','vdo_embed_code_wrong','Embed Code Was Wrong'),(9579,'en','vdo_seconds_err','Wrong Value Entered For Seconds Field'),(9580,'en','vdo_mins_err','Wrong Value Entered For Minutes Field'),(9581,'en','vdo_thumb_up_err','Error In Uploading Thumb'),(9582,'en','class_error_occured','Sorry, An Error Occured'),(9583,'en','class_cat_del_msg','Category has been deleted'),(9584,'en','class_vdo_del_msg','Video has been deleted'),(9585,'en','class_vdo_fr_msg','Video has been marked as &#8220;Featured Video&#8221;'),(9586,'en','class_fr_msg1','Video has been removed from &#8220;Featured Videos&#8221;'),(9587,'en','class_vdo_act_msg','Video has been activated'),(9588,'en','class_vdo_act_msg1','Vidoe has been deactivated'),(9589,'en','class_vdo_update_msg','Video details have been updated'),(9590,'en','class_comment_err','You Must Login Before Postings Comments'),(9591,'en','class_comment_err1','Please Type Something In The Comment Box'),(9592,'en','class_comment_err2','You Cannot Post a Comment on  Your Own Video'),(9593,'en','class_comment_err3','You Have Already Posted a Comment, Please Wait for the others.'),(9594,'en','class_comment_err4','You Have Already Replied To That a Comment, Please Wait for the others.'),(9595,'en','class_comment_err5','You Cannot Post a Reply To Yourself'),(9596,'en','class_comment_msg','Comment Has Been Added'),(9597,'en','class_comment_err6','Please login to rate comment'),(9598,'en','class_comment_err7','You have already rated this comment'),(9599,'en','class_vdo_fav_err','This Video is Already Added To Your Favorites'),(9600,'en','class_vdo_fav_msg','This Video Has Been Added To Your Favorites'),(9601,'en','class_vdo_flag_err','You Have Already Flagged This Video'),(9602,'en','class_vdo_flag_msg','This Video Has Been Flagged As Inappropriate'),(9603,'en','class_vdo_flag_rm','Flag(s) Has/Have Been Removed'),(9604,'en','class_send_msg_err','Please Enter a Username or Select any User to Send Message'),(9605,'en','class_invalid_user','Invalid Username'),(9606,'en','class_subj_err','Message subject was empty'),(9607,'en','class_msg_err','Please Type Something In Message Box'),(9608,'en','class_sent_you_msg','Sent You A Message'),(9609,'en','class_sent_prvt_msg','Sent You A Private Message on '),(9610,'en','class_click_inbox','Please Click here To View Your Inbox'),(9611,'en','class_click_login','Click Here To Login'),(9612,'en','class_email_notify','Email Notification'),(9613,'en','class_msg_has_sent_to','Message Has Been Sent To '),(9614,'en','class_inbox_del_msg','Message Has Been Delete From Inbox '),(9615,'en','class_sent_del_msg','Message Has Been Delete From Sent Folder'),(9616,'en','class_msg_exist_err','Message Doesn\'t Exist'),(9617,'en','class_vdo_del_err','Video does not exist'),(9618,'en','class_unsub_msg','You have been unsubscribed sucessfully'),(9619,'en','class_sub_exist_err','Subscription Does Not Exist'),(9620,'en','class_vdo_rm_fav_msg','Video Has Been Removed From Favourites'),(9621,'en','class_vdo_fav_err1','This Video Is Not In Your Favourites List'),(9622,'en','class_cont_del_msg','Contact Has Been Deleted'),(9623,'en','class_cot_err','Sorry, This Contact Is Not In Your Contact List'),(9624,'en','class_vdo_ep_add_msg','Video Has Been Added To Editor&#8217;s Pick'),(9625,'en','class_vdo_ep_err','Video Is Already In The Editor&#8217;s Pick'),(9626,'en','class_vdo_ep_err1','You Have Already Picked 10 Videos Please Delete Alteast One to Add More'),(9627,'en','class_vdo_ep_msg','Video Has Been Removed From Editor&#8217;s Pick'),(9628,'en','class_vdo_exist_err','Sorry, Video Doesn\'t Exist'),(9629,'en','class_img_gif_err','Please Upload Gif Image Only'),(9630,'en','class_img_png_err','Please Upload Png Image Only'),(9631,'en','class_img_jpg_err','Please Upload Jpg Image Only'),(9632,'en','class_logo_msg','Logo Has Been Changed. Please Clear Cache If You Are Not Able To See the Changed Logo'),(9633,'en','com_forgot_username','Forgot Username | Password'),(9634,'en','com_join_now','Join Now'),(9635,'en','com_my_account','My Account'),(9636,'en','com_manage_vids','Manage Videos'),(9637,'en','com_view_channel','View My Channel'),(9638,'en','com_my_inbox','My Inbox'),(9639,'en','com_welcome','Welcome'),(9640,'en','com_top_mem','Top Members '),(9641,'en','com_vidz','Videos'),(9642,'en','com_sign_up_now','Sign Up Now !'),(9643,'en','com_my_videos','My Videos'),(9644,'en','com_my_channel','My Channel'),(9645,'en','com_my_subs','My Subscriptions'),(9646,'en','com_user_no_contacts','User Does Not Have Any Contact'),(9647,'en','com_user_no_vides','User Does Not Have Any Favourite Video'),(9648,'en','com_user_no_vid_com','User Has No Video Comments'),(9649,'en','com_view_all_contacts','View All Contacts of'),(9650,'en','com_view_fav_all_videos','View All Favourite Videos Of'),(9651,'en','com_login_success_msg','You Have Been Successfully Logged In.'),(9652,'en','com_logout_success_msg','You Have Been Successfully Logged Out.'),(9653,'en','com_not_redirecting','You are now Redirecting .'),(9654,'en','com_not_redirecting_msg','if your are not redirecting'),(9655,'en','com_manage_contacts','Manage Contacts '),(9656,'en','com_send_message','Send Message'),(9657,'en','com_manage_fav','Manage Favorites '),(9658,'en','com_manage_subs','Manage Subscriptions'),(9659,'en','com_subscribe_to','Subscribe to %s&#8217;s channel'),(9660,'en','com_total_subs','Total Subscribtions'),(9661,'en','com_total_vids','Total Videos'),(9662,'en','com_date_subscribed','Date Subscribed'),(9663,'en','com_search_results','Search Results'),(9664,'en','com_advance_results','Advanced Search'),(9665,'en','com_search_results_in','Search Results In'),(9666,'en','videos_being_watched','Recently Viewed...'),(9667,'en','latest_added_videos','Recent Additions'),(9668,'en','most_viewed','Most Viewed'),(9669,'en','recently_added','Recently Added'),(9670,'en','featured','Featured'),(9671,'en','highest_rated','Highest Rated'),(9672,'en','most_discussed','Most Discussed'),(9673,'en','style_change','Style Change'),(9674,'en','rss_feed_latest_title','RSS Feed for Most Recent Videos'),(9675,'en','rss_feed_featured_title','RSS Feed for Featured Videos'),(9676,'en','rss_feed_most_viewed_title','RSS Feed for Most Popular Videos'),(9677,'en','lang_folder','en'),(9678,'en','reg_closed','Registration Closed'),(9679,'en','reg_for','Registration for'),(9680,'en','is_currently_closed','is currently closed'),(9681,'en','about_us','About Us'),(9682,'en','account','Account'),(9683,'en','added','Added'),(9684,'en','advertisements','Advertisements'),(9685,'en','all','All'),(9686,'en','active','Active'),(9687,'en','activate','Activate'),(9688,'en','age','Age'),(9689,'en','approve','Approve'),(9690,'en','approved','Approved'),(9691,'en','approval','Approval'),(9692,'en','books','Books'),(9693,'en','browse','Browse'),(9694,'en','by','by'),(9695,'en','cancel','Cancel'),(9696,'en','categories','Categories'),(9697,'en','category','Category'),(9698,'en','channels','channels'),(9699,'en','check_all','Check All'),(9700,'en','click_here','Click Here'),(9701,'en','comments','Comments'),(9702,'en','community','Community'),(9703,'en','companies','Companies'),(9704,'en','contacts','Contacts'),(9705,'en','contact_us','Contact Us'),(9706,'en','country','Country'),(9707,'en','created','Created'),(9708,'en','date','Date'),(9709,'en','date_added','Date Added'),(9710,'en','date_joined','Date Joined'),(9711,'en','dear','Dear'),(9712,'en','delete','Delete'),(9713,'en','delete_selected','Delete Selected'),(9714,'en','des_title','Description:'),(9715,'en','duration','Duration'),(9716,'en','education','Education'),(9717,'en','email','email'),(9718,'en','embed','Embed'),(9719,'en','embed_code','Embed Code'),(9720,'en','favourite','Favorite'),(9721,'en','favourited','Favorited'),(9722,'en','favourites','Favorites'),(9723,'en','female','Female'),(9724,'en','filter','Filter'),(9725,'en','forgot','Forgot'),(9726,'en','friends','Friends'),(9727,'en','from','From'),(9728,'en','gender','Gender'),(9729,'en','groups','Groups'),(9730,'en','hello','Hello'),(9731,'en','help','Help'),(9732,'en','hi','Hi'),(9733,'en','hobbies','Hobbies'),(9734,'en','Home','Home'),(9735,'en','inbox','Inbox'),(9736,'en','interests','Interests'),(9737,'en','join_now','Join Now'),(9738,'en','joined','Joined'),(9739,'en','join','Join'),(9740,'en','keywords','Keywords'),(9741,'en','latest','Latest'),(9742,'en','leave','Leave'),(9743,'en','location','Location'),(9744,'en','login','Login'),(9745,'en','logout','Logout'),(9746,'en','male','Male'),(9747,'en','members','Members'),(9748,'en','messages','Messages'),(9749,'en','message','Message'),(9750,'en','minutes','minutes'),(9751,'en','most_members','Most Members'),(9752,'en','most_recent','Most Recent'),(9753,'en','most_videos','Most Videos'),(9754,'en','music','Music'),(9755,'en','my_account','My Account'),(9756,'en','next','Next'),(9757,'en','no','No'),(9758,'en','no_user_exists','No User Exists'),(9759,'en','no_video_exists','No Video Exists'),(9760,'en','occupations','Occupations'),(9761,'en','optional','optional'),(9762,'en','owner','Owner'),(9763,'en','password','password'),(9764,'en','please','Please'),(9765,'en','privacy','Privacy'),(9766,'en','privacy_policy','Privacy Policy'),(9767,'en','random','Random'),(9768,'en','rate','Rate'),(9769,'en','request','Request'),(9770,'en','related','Related'),(9771,'en','reply','Reply'),(9772,'en','results','Results'),(9773,'en','relationship','Relationship'),(9774,'en','seconds','seconds'),(9775,'en','select','Select'),(9776,'en','send','Send'),(9777,'en','sent','Sent'),(9778,'en','signup','Signup'),(9779,'en','subject','Subject'),(9780,'en','tags','Tags'),(9781,'en','times','Times'),(9782,'en','to','To'),(9783,'en','type','Type'),(9784,'en','update','Update'),(9785,'en','upload','Upload'),(9786,'en','url','Url'),(9787,'en','verification','Verification'),(9788,'en','videos','Videos'),(9789,'en','viewing','Viewing'),(9790,'en','welcome','Welcome'),(9791,'en','website','Website'),(9792,'en','yes','Yes'),(9793,'en','of','of'),(9794,'en','on','on'),(9795,'en','previous','Previous'),(9796,'en','rating','Rating'),(9797,'en','ratings','Ratings'),(9798,'en','remote_upload','Remote Upload'),(9799,'en','remove','Remove'),(9800,'en','search','Search'),(9801,'en','services','Services'),(9802,'en','show_all','Show All'),(9803,'en','signupup','Sign Up'),(9804,'en','sort_by','Sort'),(9805,'en','subscriptions','Subscriptions'),(9806,'en','subscribers','Subscribers'),(9807,'en','tag_title','Tags'),(9808,'en','time','time'),(9809,'en','top','Top'),(9810,'en','tos_title','Terms of Use'),(9811,'en','username','Username'),(9812,'en','views','Views'),(9813,'en','proccession_wait','Processing, Please Wait'),(9814,'en','mostly_viewed','Most Viewed'),(9815,'en','most_comments','Most Comments'),(9816,'en','group','Group'),(9817,'en','not_logged_in','You are not logged in or you do not have permission to access this page. This could be due to one of several reasons:'),(9818,'en','fill_auth_form','You are not logged in. Fill in the form below and try again.'),(9819,'en','insufficient_privileges','You may not have sufficient privileges to access this page.'),(9820,'en','admin_disabled_you','The site administrator may have disabled your account, or it may be awaiting activation.'),(9821,'en','Recover_Password','Recover Password'),(9822,'en','Submit','Submit'),(9823,'en','Reset_Fields','Reset Fields'),(9824,'en','admin_reg_req','The administrator may have required you to register before you can view this page.'),(9825,'en','lang_change','Language Change'),(9826,'en','lang_changed','Your language has been changed'),(9827,'en','lang_choice','Language'),(9828,'en','if_not_redir','Click here to continue if you are not automatically redirected.'),(9829,'en','style_changed','Your style has been changed'),(9830,'en','style_choice','Style'),(9831,'en','vdo_edit_vdo','Edit Video'),(9832,'en','vdo_stills','Video Stills'),(9833,'en','vdo_watch_video','Watch Video'),(9834,'en','vdo_video_details','Video Details'),(9835,'en','vdo_title','Title'),(9836,'en','vdo_desc','Description'),(9837,'en','vdo_cat','Video Category'),(9838,'en','vdo_cat_msg','You May Select Up To %s Categories'),(9839,'en','vdo_tags_msg','Tags are separated by commas ie Arslan Hassan, Awesome, ClipBucket'),(9840,'en','vdo_br_opt','Broadcast Options'),(9841,'en','vdo_br_opt1','Public - Share your video with Everyone! (Recommended)'),(9842,'en','vdo_br_opt2','Private - Viewable by you and your friends only.'),(9843,'en','vdo_date_loc','Date And Location'),(9844,'en','vdo_date_rec','Date Recorded'),(9845,'en','vdo_for_date','format MM / DD / YYYY '),(9846,'en','vdo_add_eg','e.g London Greenland, Sialkot Mubarak Pura'),(9847,'en','vdo_share_opt','Sharing and privacy options'),(9848,'en','vdo_allow_comm','Allow Comments '),(9849,'en','vdo_dallow_comm','Do Not Allow Comments'),(9850,'en','vdo_comm_vote','Comments Voting'),(9851,'en','vdo_allow_com_vote','Allow Voting on Comments'),(9852,'en','vdo_dallow_com_vote','Do Not Allow on Comments'),(9853,'en','vdo_allow_rating','Yes, Allow Rating on this video'),(9854,'en','vdo_dallow_ratig','No, Do Not Allow Rating on this video'),(9855,'en','vdo_embedding','Embedding'),(9856,'en','vdo_embed_opt1','Yes, People can play this video on other websites'),(9857,'en','vdo_embed_opt2','No, People cannot play this video on other websites'),(9858,'en','vdo_update_title','Update'),(9859,'en','vdo_inactive_msg','Your Account is Inactive. Please Activate it to Upload Videos, To Activate your account Please'),(9860,'en','vdo_click_here','Click Here'),(9861,'en','vdo_continue_upload','Continue to Upload'),(9862,'en','vdo_upload_step1','Video Upload'),(9863,'en','vdo_upload_step2','Video Step %s/2'),(9864,'en','vdo_upload_step3','(Step 2/2)'),(9865,'en','vdo_select_vdo','Select a video to upload.'),(9866,'en','vdo_enter_remote_url','Enter Url Of The Video.'),(9867,'en','vdo_enter_embed_code_msg','Enter Embed Video Code from other websites ie Youtube or Metacafe.'),(9868,'en','vdo_enter_embed_code','Enter Embed Code'),(9869,'en','vdo_enter_druation','Enter Duration'),(9870,'en','vdo_select_vdo_thumb','Select Video Thumb'),(9871,'en','vdo_having_trouble','Having Trouble?'),(9872,'en','vdo_if_having_problem','if you are having problems with the uploader'),(9873,'en','vdo_clic_to_manage_all','Click Here To Manage All Videos'),(9874,'en','vdo_manage_vdeos','Manage Videos '),(9875,'en','vdo_status','Status'),(9876,'en','vdo_rawfile','RawFile'),(9877,'en','vdo_video_upload_complete','Video Upload - Upload Complete'),(9878,'en','vdo_thanks_you_upload_complete_1','Thank you! Your upload is complete'),(9879,'en','vdo_thanks_you_upload_complete_2','This video will be available in'),(9880,'en','vdo_after_it_has_process','after it has finished processing.'),(9881,'en','vdo_embed_this_video_on_web','Embed this video on your website.'),(9882,'en','vdo_copy_and_paste_the_code','Copy and paste the code below to embed this video.'),(9883,'en','vdo_upload_another_video','Upload Another Video'),(9884,'en','vdo_goto_my_videos','Goto My Videos'),(9885,'en','vdo_sperate_emails_by','seperate emails by commas'),(9886,'en','vdo_personal_msg','Personal Message'),(9887,'en','vdo_related_tags','Related Tags'),(9888,'en','vdo_reply_to_this','Reply To This '),(9889,'en','vdo_add_reply','Add Reply'),(9890,'en','vdo_share_video','Share Video'),(9891,'en','vdo_about_this_video','About This Video'),(9892,'en','vdo_post_to_a_services','Post to an Aggregating Service'),(9893,'en','vdo_commentary','Commentary'),(9894,'en','vdo_post_a_comment','Post A Comment'),(9895,'en','grp_add_vdo_msg','Add Videos To Group '),(9896,'en','grp_no_vdo_msg','You Don&#8217;t Have Any Video'),(9897,'en','grp_add_to','Add To Group'),(9898,'en','grp_add_vdos','Add Videos'),(9899,'en','grp_name_title','Group name'),(9900,'en','grp_tag_title','Tags:'),(9901,'en','grp_des_title','Description:'),(9902,'en','grp_tags_msg','Enter one or more tags, separated by spaces.'),(9903,'en','grp_tags_msg1','Enter one or more tags, separated by spaces. Tags  are keywords used to describe your group so it can be easily found by  other users. For example, if you have a group for surfers, you might  tag it: surfing, beach, waves.'),(9904,'en','grp_url_title','Choose a unique group name URL:'),(9905,'en','grp_url_msg','Enter 3-18 characters with no spaces (such as &#8220;skateboarding skates&#8221;), that will become part of your group&#8217;s web address. Please note, the group name URL you pick is permanent and can&#8217;t be changed.'),(9906,'en','grp_cat_tile','Group Category:'),(9907,'en','grp_vdo_uploads','Video Uploads:'),(9908,'en','grp_forum_posting','Forum Posting:'),(9909,'en','grp_join_opt1','Public, anyone can join.'),(9910,'en','grp_join_opt2','Protected, requires founder approval to join.'),(9911,'en','grp_join_opt3','Private, by founder invite only, only members can view group details.'),(9912,'en','grp_vdo_opt1','Post videos immediately.'),(9913,'en','grp_vdo_opt2','Founder approval required before video is available.'),(9914,'en','grp_vdo_opt3','Only Founder can add new videos.'),(9915,'en','grp_post_opt1','Post topics immediately.'),(9916,'en','grp_post_opt2','Founder approval required before topic is available.'),(9917,'en','grp_post_opt3','Only Founder can create a new topic.'),(9918,'en','grp_crt_grp','Create Group'),(9919,'en','grp_thumb_title','Group Thumb'),(9920,'en','grp_upl_thumb','Upload Group Thumb'),(9921,'en','grp_must_be','Must Be'),(9922,'en','grp_90x90','90  x 90 Ratio Will Give Best Quality'),(9923,'en','grp_thumb_warn','Do Not Upload Vulgar or Copyrighted Material'),(9924,'en','grp_del_confirm','Are You Sure You Want To Delete This Group'),(9925,'en','grp_del_success','You Have Successfully Deleted'),(9926,'en','grp_click_go_grps','Click Here To Go To Groups'),(9927,'en','grp_edit_grp_title','Edit Group'),(9928,'en','grp_manage_vdos','Manage Videos'),(9929,'en','grp_manage_mems','Manage Members'),(9930,'en','grp_del_group_title','Delete Group'),(9931,'en','grp_add_vdos_title','Add Videos'),(9932,'en','grp_join_grp_title','Join Group'),(9933,'en','grp_leave_group_title','Leave Group'),(9934,'en','grp_invite_grp_title','Invite Members'),(9935,'en','grp_view_mems','View Members'),(9936,'en','grp_view_vdos','View Videos'),(9937,'en','grp_create_grp_title','Create A New Group'),(9938,'en','grp_most_members','Most Members'),(9939,'en','grp_most_discussed','Most Discussed'),(9940,'en','grp_invite_msg','Invite Users To This Group'),(9941,'en','grp_invite_msg1','Has Invited You To Join'),(9942,'en','grp_invite_msg2','Enter Emails or Usernames (seperate by commas)'),(9943,'en','grp_url_title1','Group url'),(9944,'en','grp_invite_msg3','Send Invitation'),(9945,'en','grp_join_confirm_msg','Are You Sure You Want To Join This Group'),(9946,'en','grp_join_msg_succ','You have successfully joined group'),(9947,'en','grp_click_here_to_go','Click Here To Go To'),(9948,'en','grp_leave_confirm','Are You Sure You Want To Leave This Group'),(9949,'en','grp_leave_succ_msg','You have left the group'),(9950,'en','grp_manage_members_title','Manage Members '),(9951,'en','grp_for_approval','For Approval'),(9952,'en','grp_rm_videos','Remove Videos'),(9953,'en','grp_rm_mems','Remove Members'),(9954,'en','grp_groups_title','Manage Groups'),(9955,'en','grp_joined_title','Manage Joined Groups'),(9956,'en','grp_remove_group','Remove Group'),(9957,'en','grp_bo_grp_found','No Group Found'),(9958,'en','grp_joined_groups','Joined Groups'),(9959,'en','grp_owned_groups','Owned Groups'),(9960,'en','grp_edit_this_grp','Edit This Group'),(9961,'en','grp_topics_title','Topics'),(9962,'en','grp_topic_title','Topic'),(9963,'en','grp_posts_title','Posts'),(9964,'en','grp_discus_title','Discussions'),(9965,'en','grp_author_title','Author'),(9966,'en','grp_replies_title','Replies'),(9967,'en','grp_last_post_title','Last Post '),(9968,'en','grp_viewl_all_videos','View All Videos of This Group'),(9969,'en','grp_add_new_topic','Add New Topic'),(9970,'en','grp_attach_video','Attach Video '),(9971,'en','grp_add_topic','Add Topic'),(9972,'en','grp_please_login','Please login to post topics'),(9973,'en','grp_please_join','Please Join This Group To Post Topics'),(9974,'en','grp_inactive_account','Your Account Is Inactive And Requires Activation From The Group Owner'),(9975,'en','grp_about_this_grp','About This Group '),(9976,'en','grp_no_vdo_err','This Group Has No Vidoes'),(9977,'en','grp_posted_by','Posted by'),(9978,'en','grp_add_new_comment','Add New Comment'),(9979,'en','grp_add_comment','Add Comment'),(9980,'en','grp_pls_login_comment','Please Login To Post Comments'),(9981,'en','grp_pls_join_comment','Please Join This Group To Post Comments'),(9982,'en','usr_activation_title','User Activation'),(9983,'en','usr_actiavation_msg','Enter Your Username and Activation Code that has been sent to your email.'),(9984,'en','usr_actiavation_msg1','Request Activation Code'),(9985,'en','usr_activation_code_tl','Activation Code'),(9986,'en','usr_compose_msg','Compose Message'),(9987,'en','usr_inbox_title','Inbox'),(9988,'en','usr_sent_title','Sent'),(9989,'en','usr_to_title','To: (Enter Username)'),(9990,'en','usr_or_select_frm_list','or select from contact list'),(9991,'en','usr_attach_video','Attach Video'),(9992,'en','user_attached_video','Attached Video'),(9993,'en','usr_send_message','Send Message'),(9994,'en','user_no_message','No Message'),(9995,'en','user_delete_message_msg','Delete This Message'),(9996,'en','user_forgot_message','Forgot password'),(9997,'en','user_forgot_message_2','Dont Worry, recover it now'),(9998,'en','user_pass_reset_msg','Password Reset'),(9999,'en','user_pass_forgot_msg','if you have forgot your password, please enter you username and verification code in the box, and password reset instructions will be sent to your mail box.'),(10000,'en','user_veri_code','Verification Code'),(10001,'en','user_reocover_user','Recover Username'),(10002,'en','user_user_forgot_msg','Forgot Username?'),(10003,'en','user_recover','Recover'),(10004,'en','user_reset','Reset'),(10005,'en','user_inactive_msg','Your account is inactive, please activate your account by going to <a href=\"./activation.php\">activation page</a>'),(10006,'en','user_dashboard','Dash Board'),(10007,'en','user_manage_prof_chnnl','Manage Profile &amp; Channel'),(10008,'en','user_manage_friends','Manage Friends &amp; Contacts'),(10009,'en','user_prof_channel','Profile/Channel'),(10010,'en','user_message_box','Message Box'),(10011,'en','user_new_messages','New Messages'),(10012,'en','user_goto_inbox','Go to Inbox'),(10013,'en','user_goto_sentbox','Go to Sent Box'),(10014,'en','user_compose_new','Compose New Messages'),(10015,'en','user_total_subs_users','Total Subscribed Users'),(10016,'en','user_you_have','You Have'),(10017,'en','user_fav_videos','Favorite Videos'),(10018,'en','user_your_vids_watched','Your Videos Watched'),(10019,'en','user_times','Times'),(10020,'en','user_you_have_watched','You Have Watched'),(10021,'en','user_channel_profiles','Channel &amp; Profile'),(10022,'en','user_channel_views','Channel Views'),(10023,'en','user_channel_comm','Channel Comments '),(10024,'en','user_manage_prof','Manage Profile / Channel'),(10025,'en','user_you_created','You Have Created'),(10026,'en','user_you_joined','You Have Joined'),(10027,'en','user_create_group','Create New Group'),(10028,'en','user_manage_my_account','Manage My Account '),(10029,'en','user_manage_my_videos','Manage My Videos'),(10030,'en','user_manage_my_channel','Manage My Channel'),(10031,'en','user_sent_box','My sent items'),(10032,'en','user_manage_channel','Manage Channel'),(10033,'en','user_manage_my_contacts','Manage My Contacts'),(10034,'en','user_manage_contacts','Manage Contacts'),(10035,'en','user_manage_favourites','Manage Favourite Videos'),(10036,'en','user_mem_login','Members Login'),(10037,'en','user_already_have','Please Login Here if You Already have an account of'),(10038,'en','user_forgot_username','Forgot Username'),(10039,'en','user_forgot_password','Forgot Password'),(10040,'en','user_create_your','Create Your '),(10041,'en','user_all_fields_req','All Fields Are Required'),(10042,'en','user_valid_email_addr','Valid Email Address'),(10043,'en','user_allowed_format','Letters A-Z or a-z , Numbers 0-9 and Underscores _'),(10044,'en','user_confirm_pass','Confirm Password'),(10045,'en','user_reg_msg_0','Register as '),(10046,'en','user_reg_msg_1','member, its free and easy just fill out the form below'),(10047,'en','user_date_of_birth','Date Of Birth'),(10048,'en','user_enter_text_as_img','Enter Text As Seen In The Image'),(10049,'en','user_refresh_img','Refresh Image'),(10050,'en','user_i_agree_to_the','I Agree to  <a href=\"%s\" target=\"_blank\">Terms of Service</a> and <a href=\"%s\" target=\"_blank\" >Privacy Policy'),(10051,'en','user_thanks_for_reg','Thank You For Registering on '),(10052,'en','user_email_has_sent','An email has been sent to your inbox containing Your Account'),(10053,'en','user_and_activation','&amp; Activation'),(10054,'en','user_details_you_now','Details. You may now do the following things on our network'),(10055,'en','user_upload_share_vds','Upload, Share Videos'),(10056,'en','user_make_friends','Make Friends'),(10057,'en','user_send_messages','Send Messages'),(10058,'en','user_grow_your_network','Grow Your Networks by Inviting more Friends'),(10059,'en','user_rate_comment','Rate and Comment Videos'),(10060,'en','user_make_customize','Make and Customize Your Channel'),(10061,'en','user_to_upload_vid','To Upload Video, You Need to Activate your account first, activation details has been sent to your email account, it may take sometimes to reach your inbox'),(10062,'en','user_click_to_login','Click here To Login To Your Account'),(10063,'en','user_view_my_channel','View My Channel'),(10064,'en','user_change_pass','Change Password'),(10065,'en','user_email_settings','Email Settings'),(10066,'en','user_profile_settings','Profile Settings'),(10067,'en','user_usr_prof_chnl_edit','User Profile &amp; Channel Edit'),(10068,'en','user_personal_info','Personal Information'),(10069,'en','user_fname','First Name'),(10070,'en','user_lname','Last Name'),(10071,'en','user_gender','Gender'),(10072,'en','user_relat_status','Relationship Status'),(10073,'en','user_display_age','Display Age'),(10074,'en','user_about_me','About Me'),(10075,'en','user_website_url','Website Url'),(10076,'en','user_eg_website','e.g www.cafepixie.com'),(10077,'en','user_prof_info','Professional Information'),(10078,'en','user_education','Education'),(10079,'en','user_school_colleges','Schools / Colleges'),(10080,'en','user_occupations','Occupation(s)'),(10081,'en','user_companies','Companies'),(10082,'en','user_sperate_by_commas','seperate with commas'),(10083,'en','user_interests_hobbies','Interests and Hobbies'),(10084,'en','user_fav_movs_shows','Favorite Movies &amp; Shows'),(10085,'en','user_fav_music','Favorite Music'),(10086,'en','user_fav_books','Favorite Books'),(10087,'en','user_user_avatar','User Avatar'),(10088,'en','user_upload_avatar','Upload Avatar'),(10089,'en','user_channel_info','Channel Info'),(10090,'en','user_channel_title','Channel Title'),(10091,'en','user_channel_description','Channel Description'),(10092,'en','user_channel_permission','Channel Permissions'),(10093,'en','user_allow_comments_msg','users can comment'),(10094,'en','user_dallow_comments_msg','users cannot comment'),(10095,'en','user_allow_rating','Allow Rating'),(10096,'en','user_dallow_rating','Do Not Allow Rating'),(10097,'en','user_allow_rating_msg1','users can rate'),(10098,'en','user_dallow_rating_msg1','users cannot rate'),(10099,'en','user_channel_feature_vid','Channel Featured Video'),(10100,'en','user_select_vid_for_fr','Select Video To set as Featured'),(10101,'en','user_chane_channel_bg','Change Channel Background'),(10102,'en','user_remove_bg','Remove Background'),(10103,'en','user_currently_you_d_have_pic','Currently You Don&#8217;t Have a Background Picture'),(10104,'en','user_change_email','Change Email'),(10105,'en','user_email_address','Email Address'),(10106,'en','user_new_email','New Email'),(10107,'en','user_notify_me','Notify Me When User Sends Me A Message'),(10108,'en','user_old_pass','Old Password'),(10109,'en','user_new_pass','New Password'),(10110,'en','user_c_new_pass','Confirm New Password'),(10111,'en','user_doesnt_exist','User Doesn&#8217;t Exist'),(10112,'en','user_do_not_have_contact','User Does Not Have Any Contacts'),(10113,'en','user_no_fav_video_exist','User does not have any Favorite Videos selected'),(10114,'en','user_have_no_vide','User doesn\'t have any videos'),(10115,'en','user_s_channel','%s&#8217;s Channel '),(10116,'en','user_last_login','Last Login'),(10117,'en','user_send_message','Send Message'),(10118,'en','user_add_contact','Add Contact'),(10119,'en','user_dob','DoB'),(10120,'en','user_movies_shows','Movies &amp; Shows'),(10121,'en','user_add_comment','Add Comment '),(10122,'en','user_view_all_comments','View All Comments'),(10123,'en','user_no_fr_video','User Has Not Selected Any Video To Set As Featured'),(10124,'en','user_view_all_video_of','View All Videos of '),(10125,'en','menu_home','Home'),(10126,'en','menu_videos','Videos'),(10127,'en','menu_upload','Upload'),(10128,'en','menu_signup','SignUp'),(10129,'en','menu_account','Account'),(10130,'en','menu_groups','Groups'),(10131,'en','menu_channels','Channels'),(10132,'en','menu_community','Community'),(10133,'en','menu_inbox','Inbox'),(10134,'en','vdo_cat_err2','You cannot select more than %d categories'),(10135,'en','user_subscribe_message','Hello %subscriber%\nYou Have Subscribed To %user% and therefore this message is sent to you automatically, because %user% Has Uploaded a New Video\n\n%website_title%'),(10136,'en','user_subscribe_subject','%user% has uploaded a new video'),(10137,'en','you_already_logged','You are already logged in'),(10138,'en','you_not_logged_in','You are not logged in'),(10139,'en','invalid_user','Invalid User'),(10140,'en','vdo_cat_err3','Please select at least 1 category'),(10141,'en','embed_code_invalid_err','Invalid video embed code'),(10142,'en','invalid_duration','Invalid duration'),(10143,'en','vid_thumb_changed','Video default thumb has been changed'),(10144,'en','vid_thumb_change_err','Video thumbnail was not found'),(10145,'en','upload_vid_thumbs_msg','All video thumbs have been uploaded'),(10146,'en','video_thumb_delete_msg','Video thumb has been deleted'),(10147,'en','video_thumb_delete_err','Could not delete video thumb'),(10148,'en','no_comment_del_perm','You dont have permission to delete this comment'),(10149,'en','my_text_context','My test context'),(10150,'en','user_contains_disallow_err','Username contains disallowed characters'),(10151,'en','add_cat_erro','Category already exists'),(10152,'en','add_cat_no_name_err','Please enter a name for the category'),(10153,'en','cat_default_err','Default cannot be deleted, please choose another category as &#8220;default&#8221; and then delete this one'),(10154,'en','pic_upload_vali_err','Please upload valid JPG, GIF or PNG image'),(10155,'en','cat_dir_make_err','Unable to create the category thumb directory'),(10156,'en','cat_set_default_ok','Category has been set as default'),(10157,'en','vid_thumb_removed_msg','Video thumbs have been removed'),(10158,'en','vid_files_removed_msg','Video files have been removed'),(10159,'en','vid_log_delete_msg','Video log has been deleted'),(10160,'en','vdo_multi_del_erro','Videos has have been deleted'),(10161,'en','add_fav_message','This %s has been added to your favorites'),(10162,'en','obj_not_exists','%s does not exist'),(10163,'en','already_fav_message','This %s is already added to your favorites'),(10164,'en','obj_report_msg','This %s has been reported'),(10165,'en','obj_report_err','You have already reported this %s'),(10166,'en','user_no_exist_wid_username','&#8216;%s&#8217; does not exist'),(10167,'en','share_video_no_user_err','Please enter usernames or emails to send this %s'),(10168,'en','uploaded','Uploaded'),(10169,'en','today','Today'),(10170,'en','yesterday','Yesterday'),(10171,'en','thisweek','This Week'),(10172,'en','lastweek','Last Week'),(10173,'en','thismonth','This Month'),(10174,'en','lastmonth','Last Month'),(10175,'en','thisyear','This Year'),(10176,'en','lastyear','Last Year'),(10177,'en','favorites','Favorites'),(10178,'en','alltime','All Time'),(10179,'en','insufficient_privileges_loggin','You cannot access this page Click Here to Login or Register'),(10180,'en','profile_title','Profile Title'),(10181,'en','show_dob','Show Date of Birth'),(10182,'en','profile_tags','Profile Tags'),(10183,'en','profile_desc','Profile Description'),(10184,'en','online_status','User Status'),(10185,'en','show_profile','Show Profile'),(10186,'en','allow_ratings','Allow Profile Ratings'),(10187,'en','postal_code','Postal Code'),(10188,'en','temp_file_load_err','Unable to load tempalte file &#8216;%s&#8217; in directory &#8216;%s&#8217;'),(10189,'en','no_date_provided','No date provided'),(10190,'en','second','second'),(10191,'en','minute','minute'),(10192,'en','bad_date','Never'),(10193,'en','users_videos','%s&#8217;s Videos'),(10194,'en','please_login_subscribe','Please login to Subsribe %s'),(10195,'en','users_subscribers','%s&#8217;s Subscribers'),(10196,'en','user_no_subscribers','%s has no subsribers'),(10197,'en','user_subscriptions','%s&#8217;s Subscriptions'),(10198,'en','user_no_subscriptions','%s has no subscriptions'),(10199,'en','usr_avatar_bg_update','User avatar and background have been updated'),(10200,'en','user_email_confirm_email_err','Confirm email mismatched'),(10201,'en','email_change_msg','Email has been changed successfully'),(10202,'en','no_edit_video','You cannot edit this video'),(10203,'en','confirm_del_video','Are you sure you want to delete this video ?'),(10204,'en','remove_fav_video_confirm','Are you sure you want to remove this video from your favorites ?'),(10205,'en','fav_remove_msg','%s has been removed from your favorites'),(10206,'en','unknown_favorite','Unknown favorite %s'),(10207,'en','vdo_multi_del_fav_msg','Videos have been removed from your favorites'),(10208,'en','unknown_sender','Unknown Sender'),(10209,'en','please_enter_message','Please enter something for message'),(10210,'en','unknown_reciever','Unknown reciever'),(10211,'en','no_pm_exist','Private message does not exist'),(10212,'en','pm_sent_success','Private message has been sent successfully'),(10213,'en','msg_delete_inbox','Message has been deleted from inbox'),(10214,'en','msg_delete_outbox','Message has been deleted from your outbox'),(10215,'en','private_messags_deleted','Private messages have been deleted'),(10216,'en','ban_users','Ban Users'),(10217,'en','spe_users_by_comma','separate usernames by comma'),(10218,'en','user_ban_msg','User block list has been updated'),(10219,'en','no_user_ban_msg','No user is banned from your account!'),(10220,'en','thnx_sharing_msg','Thanks for sharing this %s'),(10221,'en','no_own_commen_rate','You cannot rate your own comment'),(10222,'en','no_comment_exists','Comment does not exist'),(10223,'en','thanks_rating_comment','Thanks for rating comment'),(10224,'en','please_login_create_playlist','Please login to creat playlists'),(10225,'en','user_have_no_playlists','User has no playlists'),(10226,'en','play_list_with_this_name_arlready_exists','Playlist with name &#8216;%s&#8217; already exists'),(10227,'en','please_enter_playlist_name','Please enter playlist name'),(10228,'en','new_playlist_created','New playlist has been created'),(10229,'en','playlist_not_exist','Playlist does not exist'),(10230,'en','playlist_item_not_exist','Playlist item does not exist'),(10231,'en','playlist_item_delete','Playlist item has been deleted'),(10232,'en','play_list_updated','Playlist has been updated'),(10233,'en','you_dont_hv_permission_del_playlist','You do not have permission to delete the playlist'),(10234,'en','playlist_delete_msg','Playlist has been deleted'),(10235,'en','playlist_name','Playlist Name'),(10236,'en','add_new_playlist','Add Playlist'),(10237,'en','this_thing_added_playlist','This %s has been added to playlist'),(10238,'en','this_already_exist_in_pl','This %s already exists in your playlist'),(10239,'en','edit_playlist','Edit Playlist'),(10240,'en','remove_playlist_item_confirm','Are you sure you want to remove this from your playlist'),(10241,'en','remove_playlist_confirm','Are you sure you want to delete this playlist?'),(10242,'en','avcode_incorrect','Activation code is incorrect'),(10243,'en','group_join_login_err','Please login in order to join this group'),(10244,'en','manage_playlist','Manage playlist'),(10245,'en','my_notifications','My notifications'),(10246,'en','users_contacts','%s&#8217;s contacts'),(10247,'en','type_flags_removed','%s flags have been removed'),(10248,'en','terms_of_serivce','Terms of services'),(10249,'en','users','Users'),(10250,'en','login_to_mark_as_spam','Please login to mark as spam'),(10251,'en','no_own_commen_spam','You cannot mark your own comment as spam'),(10252,'en','already_spammed_comment','You have already marked this comment as spam'),(10253,'en','spam_comment_ok','Comment has been marked as spam'),(10254,'en','arslan_hassan','Arslan Hassan'),(10255,'en','you_not_allowed_add_grp_vids','You are not member of this group so cannot add videos'),(10256,'en','sel_vids_updated','Selected videos have been updated'),(10257,'en','unable_find_download_file','Unable to find download file'),(10258,'en','you_cant_edit_group','You cannot edit this group'),(10259,'en','you_cant_invite_mems','You cannot invite members'),(10260,'en','you_cant_moderate_group','You cannot moderate this group'),(10261,'en','page_doesnt_exist','Page does not exist'),(10262,'en','pelase_select_img_file_for_vdo','Please select image file for video thumb'),(10263,'en','new_mem_added','New member has been added'),(10264,'en','this_vdo_not_working','This video might not work properly'),(10265,'en','email_template_not_exist','Email template does not exist'),(10266,'en','email_subj_empty','Email subject was empty'),(10267,'en','email_msg_empty','Email message was empty'),(10268,'en','email_tpl_has_updated','Email Template has been updated'),(10269,'en','page_name_empty','Page name was empty'),(10270,'en','page_title_empty','Page title was empty'),(10271,'en','page_content_empty','Page content was empty'),(10272,'en','new_page_added_successfully','New page has been added successfully'),(10273,'en','page_updated','Page has been updated'),(10274,'en','page_deleted','Page has been deleted successfully'),(10275,'en','page_activated','Page has been activated'),(10276,'en','page_deactivated','Page has been deactivated'),(10277,'en','you_cant_delete_this_page','You cannot delete this page'),(10278,'en','ad_placement_err4','Placement does not exist'),(10279,'en','grp_details_updated','Group details have been updated'),(10280,'en','you_cant_del_topic','You cannot delete this topic'),(10281,'en','you_cant_del_user_topics','You cannot delete user topics'),(10282,'en','topics_deleted','Topics have been deleted'),(10283,'en','you_cant_delete_grp_topics','You cannot delete group topics'),(10284,'en','you_not_allowed_post_topics','You are not allowed to post topics'),(10285,'en','you_cant_add_this_vdo','You cannot add this video'),(10286,'en','video_added','Video has been added'),(10287,'en','you_cant_del_this_vdo','You cannot remove this video'),(10288,'en','video_removed','Video has been removed'),(10289,'en','user_not_grp_mem','User is not group member'),(10290,'en','user_already_group_mem','User has already joined this group'),(10291,'en','invitations_sent','Invitations have been sent'),(10292,'en','you_not_grp_mem','You are not a member of this group'),(10293,'en','you_cant_delete_this_grp','You cannot delete this group'),(10294,'en','grp_deleted','Group has been deleted'),(10295,'en','you_cant_del_grp_mems','You cannot delete group members'),(10296,'en','mems_deleted','Members have been deleted'),(10297,'en','you_cant_del_grp_vdos','You cannot delete group videos'),(10298,'en','thnx_for_voting','Thanks for voting'),(10299,'en','you_hv_already_rated_vdo','You have already rated this video'),(10300,'en','please_login_to_rate','Please login to rate'),(10301,'en','you_not_subscribed','You are not subscribed'),(10302,'en','you_cant_delete_this_user','You cannot delete this user&#8221;'),(10303,'en','you_dont_hv_perms','You don\'t have sufficient permissions'),(10304,'en','user_subs_hv_been_removed','User subscriptions have been removed'),(10305,'en','user_subsers_hv_removed','User subscribers have been removed'),(10306,'en','you_already_sent_frend_request','You have already sent friend request'),(10307,'en','friend_added','Friend has been added'),(10308,'en','friend_request_sent','Friend request has been sent'),(10309,'en','friend_confirm_error','Either the user has not requested your friend request or you have already confirmed it'),(10310,'en','friend_confirmed','Friend has been confirmed'),(10311,'en','friend_request_not_found','No friend request found'),(10312,'en','you_cant_confirm_this_request','You cannot confirm this request'),(10313,'en','friend_request_already_confirmed','Friend request is already confirmed'),(10314,'en','user_no_in_contact_list','User is not in your contact list'),(10315,'en','user_removed_from_contact_list','User has been removed from your contact list'),(10316,'en','cant_find_level','Cannot find level'),(10317,'en','please_enter_level_name','Please enter level name'),(10318,'en','level_updated','Level has been updated'),(10319,'en','level_del_sucess','User level has been deleted, all users of this level has been transfered to %s'),(10320,'en','level_not_deleteable','This level is not deletable'),(10321,'en','pass_mismatched','Passwords Mismatched'),(10322,'en','user_blocked','User has been blocked'),(10323,'en','user_already_blocked','User is already blocked'),(10324,'en','you_cant_del_user','You cannot block this user'),(10325,'en','user_vids_hv_deleted','User videos have been deleted'),(10326,'en','user_contacts_hv_removed','User contacts have been removed'),(10327,'en','all_user_inbox_deleted','All User inbox messages have been deleted'),(10328,'en','all_user_sent_messages_deleted','All user sent messages have been deleted'),(10329,'en','pelase_enter_something_for_comment','Please type something in a comment box'),(10330,'en','please_enter_your_name','Please enter your name'),(10331,'en','please_enter_your_email','Please enter your email'),(10332,'en','template_activated','Template has been activated'),(10333,'en','error_occured_changing_template','An error occured while changing the template'),(10334,'en','phrase_code_empty','Phrase code was empty'),(10335,'en','phrase_text_empty','Phrase text was empty'),(10336,'en','language_does_not_exist','Language does not exist'),(10337,'en','name_has_been_added','%s has been added'),(10338,'en','name_already_exists','&#8216;%s&#8217; already exist'),(10339,'en','lang_doesnt_exist','language does not exist'),(10340,'en','no_file_was_selected','No file was selected'),(10341,'en','err_reading_file_content','Error reading file content'),(10342,'en','cant_find_lang_name','Cant find language name'),(10343,'en','cant_find_lang_code','Cant find language code'),(10344,'en','no_phrases_found','No phrases were found'),(10345,'en','language_already_exists','Language already exists'),(10346,'en','lang_added','Language has been added successfully'),(10347,'en','error_while_upload_file','Error occured while uploading language file'),(10348,'en','default_lang_del_error','This is the default language, please select another language as &#8220;default&#8221; and then delete this pack'),(10349,'en','lang_deleted','Language pack has been deleted'),(10350,'en','lang_name_empty','Language name was empty'),(10351,'en','lang_code_empty','Language code was empty'),(10352,'en','lang_regex_empty','Language regular expression was empty'),(10353,'en','lang_code_already_exist','Language code already exists'),(10354,'en','lang_updated','Language has been updated'),(10355,'en','player_activated','Player has been activated'),(10356,'en','error_occured_while_activating_player','An error occured while activating player'),(10357,'en','plugin_has_been_s','Plugin has been %s'),(10358,'en','plugin_uninstalled','Plugin has been Uninstalled'),(10359,'en','perm_code_empty','Permission code is empty'),(10360,'en','perm_name_empty','Permission name is empty'),(10361,'en','perm_already_exist','Permission already exists'),(10362,'en','perm_type_not_valid','Permission type is not valid'),(10363,'en','perm_added','New Permission has been added'),(10364,'en','perm_deleted','Permission has been deleted'),(10365,'en','perm_doesnt_exist','Permission does not exist'),(10366,'en','acitvation_html_message','Please enter your username and activation code in order to activate your account, please check your inbox for the Activation code, if you didn\'t get one, please request it by filling the next form'),(10367,'en','acitvation_html_message2','Please enter your email address to request your activation code'),(10368,'en','admin_panel','Admin Panel'),(10369,'en','moderate_videos','Moderate Videos'),(10370,'en','moderate_users','Moderate Users'),(10371,'en','revert_back_to_admin','Revert back to admin'),(10372,'en','more_options','More Options'),(10373,'en','downloading_string','Downloading %s ...'),(10374,'en','download_redirect_msg','<a href=\"%s\">click here if you don\'t redirect automatically</a> - <a href=\"%s\"> Click Here to Go Back to Video Page</a>'),(10375,'en','account_details','Account Details'),(10376,'en','profile_details','Profile Details'),(10377,'en','update_profile','Update Profile'),(10378,'en','please_select_img_file','Please select image file'),(10379,'en','or','or'),(10380,'en','pelase_enter_image_url','Please Enter Image URL'),(10381,'en','user_bg','Channel Background'),(10382,'en','user_bg_img','Channel Background Image'),(10383,'en','please_enter_bg_color','Please Enter Background Color'),(10384,'en','bg_repeat_type','Background Repeat Type (if using image as a background)'),(10385,'en','fix_bg','Fix Background'),(10386,'en','delete_this_img','Delete this image'),(10387,'en','current_email','Current Email'),(10388,'en','confirm_new_email','Confirm New Email'),(10389,'en','no_subs_found','No subscriptions found'),(10390,'en','video_info_all_fields_req','Video Information - All fields are required'),(10391,'en','update_group','Update Group'),(10392,'en','default','Default'),(10393,'en','grp_info_all_fields_req','Group Information - All Fields Are Required'),(10394,'en','date_recorded_location','Date recorded &amp; Location'),(10395,'en','update_video','Update Video'),(10396,'en','click_here_to_recover_user','Click here to recover username'),(10397,'en','click_here_reset_pass','Click here to reset password'),(10398,'en','remember_me','Remember Me'),(10399,'en','howdy_user','Howdy %s'),(10400,'en','notifications','Notifications'),(10401,'en','playlists','Playlists'),(10402,'en','friend_requests','Friend Requests'),(10403,'en','after_meny_guest_msg','Welcome Guest ! Please <a href=\"%s\">Login</a> or <a href=\"%s\">Register</a>'),(10404,'en','being_watched','Being Watched'),(10405,'en','change_style_of_listing','Change Style of Listing'),(10406,'en','website_members','%s Members'),(10407,'en','guest_homeright_msg','Watch, Upload, Share and more'),(10408,'en','reg_for_free','Register for free'),(10409,'en','rand_vids','Random Videos'),(10410,'en','t_10_users','Top 10 Users'),(10411,'en','pending','Pending'),(10412,'en','confirm','Confirm'),(10413,'en','no_contacts','No Contacts'),(10414,'en','you_dont_hv_any_grp','You do not have any groups'),(10415,'en','you_dont_joined_any_grp','You have not joined any groups'),(10416,'en','leave_groups','Leave Groups'),(10417,'en','manage_grp_mems','Manage Group Members'),(10418,'en','pending_mems','Pending Members'),(10419,'en','active_mems','Active Members'),(10420,'en','disapprove','Disapprove'),(10421,'en','manage_grp_vids','Manage Group Videos'),(10422,'en','pending_vids','Pending Videos'),(10423,'en','no_pending_vids','No Pending Videos'),(10424,'en','no_active_videos','No Active Videos'),(10425,'en','active_videos','Active Videos'),(10426,'en','manage_playlists','Manage Playlists'),(10427,'en','total_items','Total Items'),(10428,'en','play_now','PLAY NOW'),(10429,'en','no_video_in_playlist','This playlist has no video'),(10430,'en','view','View'),(10431,'en','you_dont_hv_fav_vids','You do not have any favorite videos'),(10432,'en','private_messages','Private Messages'),(10433,'en','new_private_msg','New private message'),(10434,'en','search_for_s','Search For %s'),(10435,'en','signup_success_usr_ok','<h2 style=\"margin: 5px 5px 8px; font-family: Arial,Verdana,sans-serif;\">Just One More Step</h2>     	<p style=\"margin: 0px 5px; line-height: 18px; font-size: 11px;\">Your are just one step behind from becoming an official memeber of our website.  Please check your email, we have sent you a confirmation email which contains a confirmation link from our website, Please click it to complete your registration.</p>'),(10436,'en','signup_success_usr_emailverify','<h2 style=\"font-family:Arial,Verdana,sans-serif; margin:5px 5px 8px;\">Welcome To our community</h2>\r\n    	<p style=\"margin:0px 5px; line-height:18px; font-size:11px;\">Your email has been confirmed, Please <strong><a href=\"%s\">click here to login</a></strong> and continue as our registered member.</p>'),(10437,'en','if_you_already_hv_account','if you already have an account, please login here '),(10438,'en','signup_message_under_login',' <p>Our website is the home for video online:</p>\r\n          \r\n            <ul><li><strong>Watch</strong> millions  of videos</li><li><strong>Share favorites</strong> with friends and family</li>\r\n            <li><strong>Connect with other users</strong> who share your interests</li><li><strong>Upload your videos</strong> to a worldwide audience\r\n\r\n</li></ul>'),(10439,'en','new_mems_signup_here','New Members Signup Here'),(10440,'en','register_as_our_website_member','Register as a member, it\'s free and easy just '),(10441,'en','video_complete_msg','<h2>Video Upload Has Been Completed</h2>\r\n<span class=\"header1\">Thank you! Your upload is complete.</span><br>\r\n<span class=\"tips\">This video will be available in <a href=\"%s\"><strong>My Videos</strong></a> after it has finished processing.</span>  \r\n<div class=\"upload_link_button\" align=\"center\">\r\n    <ul>\r\n        <li><a href=\"%s\" >Upload Another Video</a></li>\r\n        <li><a href=\"%s\" >Go to My Videos</a></li>\r\n    </ul>\r\n<div class=\'clearfix\'></div>\r\n</div>\r\n'),(10442,'en','upload_right_guide',' <div>\r\n            <div>\r\n              <p>\r\n                <strong>\r\n                <strong>Important:</strong>\r\n                Do not upload any TV shows, music videos, music concerts, or  commercials without permission unless they consist entirely of content  you created yourself.</strong></p>\r\n                <p>The \r\n                <a href=\"#\">Copyright Tips page</a> and the \r\n                <a href=\"#\">Community Guidelines</a> can help you determine whether your video infringes someone else\'s copyright.</p>\r\n                <p>By clicking \"Upload Video\", you are representing that this video does not violate Our website\'s \r\n                <a id=\"terms-of-use-link\" href=\"#\">Terms of Use</a> \r\n                and that you own all copyrights in this video or have authorization to upload it.</p>\r\n            </div>\r\n        </div>'),(10443,'en','report_this_user','Report This User'),(10444,'en','add_to_favs','My Favorite!'),(10445,'en','report_this','Report'),(10446,'en','share_this','Share this'),(10447,'en','add_to_playlist','Add to Playlist'),(10448,'en','view_profile','View Profile'),(10449,'en','subscribe','Subscribe'),(10450,'en','uploaded_by_s','Uploaded by %s'),(10451,'en','more','More'),(10452,'en','link_this_video','Link This Video'),(10453,'en','click_to_download_video','Click Here To Download This Video'),(10454,'en','name','Name'),(10455,'en','email_wont_display','Email (Won\'t display)'),(10456,'en','please_login_to_comment','Please login to comment'),(10457,'en','marked_as_spam_comment_by_user','Marked as spam, commented by <em>%s</em>'),(10458,'en','spam','Spam'),(10459,'en','user_commented_time','<a href=\"%s\">%s</a> commented %s'),(10460,'en','no_comments','No one has commented on this %s yet'),(10461,'en','view_video','View Video'),(10462,'en','topic_icon','Topic Icon'),(10463,'en','group_options','Group option'),(10464,'en','info','Info'),(10465,'en','basic_info','Basic Info'),(10466,'en','group_owner','Group Owner'),(10467,'en','total_mems','Total Members'),(10468,'en','total_topics','Total Topics'),(10469,'en','grp_url','Group URL'),(10470,'en','more_details','More Details'),(10471,'en','view_all_mems','View All Members'),(10472,'en','view_all_vids','View All Videos'),(10473,'en','topic_title','Topic Title'),(10474,'en','last_reply','Last Reply'),(10475,'en','topic_by_user','<a href=\"%s\">%s</a></span> by <a href=\"%s\">%s</a>'),(10476,'en','no_topics','No Topics'),(10477,'en','last_post_time_by_user','%s<br />\r\nby <a href=\"%s\">%s'),(10478,'en','profile_views','Profile views'),(10479,'en','last_logged_in','Last logged in'),(10480,'en','last_active','Last active'),(10481,'en','total_logins','Total logins'),(10482,'en','total_videos_watched','Total videos watched'),(10483,'en','view_group','View Group'),(10484,'en','you_dont_hv_any_pm','No messages to display'),(10485,'en','date_sent','Date sent'),(10486,'en','show_hide','show - hide'),(10487,'en','quicklists','Quicklists'),(10488,'en','are_you_sure_rm_grp','Are you sure you want to remove this group ?'),(10489,'en','are_you_sure_del_grp','Are you sure you want to delete this group?'),(10490,'en','change_avatar','Change Avatar'),(10491,'en','change_bg','Change Background'),(10492,'en','uploaded_videos','Uploaded Videos'),(10493,'en','video_playlists','Video Playlists'),(10494,'en','add_contact_list','Add Contact List'),(10495,'en','topic_post','Topic Post'),(10496,'en','invite','Invite'),(10497,'en','time_ago','%s %s ago'),(10498,'en','from_now','%s %s from now'),(10499,'en','lang_has_been_activated','Language has been activated'),(10500,'en','lang_has_been_deactivated','Language has been deactivated'),(10501,'en','lang_default_no_actions','Language is default so you cannot perform actions on it'),(10502,'en','private_video_error','This video is private, only uploader friends can view this video'),(10503,'en','email_send_confirm','An email has been sent to our web administrator, we will respond you soon'),(10504,'en','name_was_empty','Name was empty'),(10505,'en','invalid_email','Invalid Email'),(10506,'en','pelase_enter_reason','Reason'),(10507,'en','please_enter_something_for_message','Please enter something in message box'),(10508,'en','comm_disabled_for_vid','Comments Disabled For This Video'),(10509,'en','coments_disabled_profile','Comments disabled for this profile'),(10510,'en','file_size_exceeds','File size exceeds \'%s kbs\''),(10511,'en','vid_rate_disabled','Video rating is disabled'),(10512,'en','chane_lang','- Change Language -'),(10513,'en','recent','Recent'),(10514,'en','viewed','Viewed'),(10515,'en','top_rated','Top Rated'),(10516,'en','commented','Commented'),(10517,'en','searching_keyword_in_obj','Searching \'%s\' in %s'),(10518,'en','no_results_found','No results found'),(10519,'en','please_enter_val_bw_min_max','Please enter \'%s\' value between \'%s\' and \'%s\''),(10520,'en','no_new_subs_video','No new videos found in subscriptions'),(10521,'en','inapp_content','Inappropriate Content'),(10522,'en','copyright_infring','Copyright infringement'),(10523,'en','sexual_content','Sexual Content'),(10524,'en','violence_replusive_content','Violence or repulsive content'),(10525,'en','disturbing','Disturbing'),(10526,'en','other','Other'),(10527,'en','pending_requests','Pending requests'),(10528,'en','friend_add_himself_error','You cannot add yourself as a friend'),(10529,'en','contact_us_msg','Your comments are important to us and we will address them as quickly as possible. Provision of the information requested on this form is voluntary. The information is being collected to provide additional information requested by you and assists us in improving our services.'),(10530,'en','Successful','Successful'),(10531,'en','required_fields','Required fields'),(10532,'en','more_fields','More fields'),(10533,'en','remote_upload_file','uploading file <span id=\\\"remoteFileName\\\"></span>, please wait...'),(10534,'en','please_enter_remote_file_url','Please enter remote file url'),(10535,'en','remoteDownloadStatusDiv','<div class=\"remoteDownloadStatus\" id=\"remoteDownloadStatus\" >Downloaded \r\n                <span id=\"status\">-- of --</span> @ \r\n                <span id=\"dspeed\">-- Kpbs</span>, EST \r\n                <span id=\"eta\">--:--</span>, Time took \r\n                <span id=\"time_took\">--:--</span>\r\n            </div>'),(10536,'en','upload_data_now','Upload Data Now!'),(10537,'en','save_data','Save Data'),(10538,'en','saving','Saving...'),(10539,'en','upload_file','Upload File'),(10540,'en','grab_from_youtube','Grab from youtube'),(10541,'en','upload_video_button','Browse videos'),(10542,'en','upload_videos_can_be','<span style=\\\"font-weight: bold; font-size: 13px;\\\">Videos can be</span>     <ul>         <li>High Definition</li>         <li>Up to %s in size</li>         <li>Up to %s in length</li>         <li>A wide variety of formats</li>     </ul>'),(10543,'en','photo_not_exist','Photo does not exist.'),(10544,'en','photo_not_exists','Photo does not exist.'),(10545,'en','photo_success_deleted','Photo has been deleted successfully.'),(10546,'en','cant_edit_photo','You can not edit this photo.'),(10547,'en','you_hv_already_rated_photo','You have already rated this photo.'),(10548,'en','photo_rate_disabled','Photo rating is disabled.'),(10549,'en','need_photo_details','Need photo details.'),(10550,'en','embedding_is_disabled','Embedding is disabled by user.'),(10551,'en','photo_activated','Photo is activated.'),(10552,'en','photo_deactivated','Photo is deactivated.'),(10553,'en','photo_featured','Photo is marked featured.'),(10554,'en','photo_unfeatured','Photo is marked unfeatured.'),(10555,'en','photo_updated_successfully','Photo is updated successfully.'),(10556,'en','success_delete_file','%s files has been deleted successfully.'),(10557,'en','no_watermark_found','Can not find watermark file.'),(10558,'en','watermark_updated','Watermark is updated'),(10559,'en','upload_png_watermark','Please upload 24-bit PNG file.'),(10560,'en','photo_non_readable','Photo is not readable.'),(10561,'en','wrong_mime_type','Wrong MIME type provided.'),(10562,'en','you_dont_have_photos','You dont have any photos'),(10563,'en','you_dont_have_fav_photos','You dont have any favorite photos'),(10564,'en','manage_orphan_photos','Manage Orphan Photos'),(10565,'en','manage_favorite_photos','Manage Favorite Photos'),(10566,'en','manage_photos','Manage Photos'),(10567,'en','you_dont_have_orphan_photos','You dont have any orphan photos'),(10568,'en','item_not_exist','Item does not exist.'),(10569,'en','collection_not_exist','Collection does not exist'),(10570,'en','selected_collects_del','Selected collections have been deleted.'),(10571,'en','manage_collections','Manage Collections'),(10572,'en','create_collection','Create Collection'),(10573,'en','selected_items_removed','Selected %s have been deleted.'),(10574,'en','edit_collection','Edit Collection'),(10575,'en','manage_collection_items','Manage Collection Items'),(10576,'en','manage_favorite_collections','Manage Favorite Collections'),(10577,'en','total_fav_collection_removed','%s collections have been removed from favorites.'),(10578,'en','total_photos_deleted','%s photos have been deleted successfully.'),(10579,'en','total_fav_photos_removed','%s photos have been removed from favorites.'),(10580,'en','photos_upload','Photo Upload'),(10581,'en','no_items_found_in_collect','No item found in this collection'),(10582,'en','You dont have any favorite collection','You dont have any favorite collections'),(10583,'en','manage_items','Manage Items'),(10584,'en','add_new_collection','Add New Collection'),(10585,'en','update_collection','Update Collection'),(10586,'en','update_photo','Update Photo'),(10587,'en','no_collection_found','You dont have any collection'),(10588,'en','photo_title','Photo Title'),(10589,'en','photo_caption','Photo Caption'),(10590,'en','photo_tags','Photo Tags'),(10591,'en','collection','Collection'),(10592,'en','photo','Photo'),(10593,'en','pic_allow_embed','Enable photo embedding'),(10594,'en','pic_dallow_embed','Disable photo embedding'),(10595,'en','pic_allow_rating','Enable photo rating'),(10596,'en','pic_dallow_rating','Disable photo rating'),(10597,'en','add_more','Add More'),(10598,'en','download_photo','Download Photo'),(10599,'en','collect_name_er','Collection name is empty'),(10600,'en','collect_descp_er','Collection description is empty'),(10601,'en','collect_tag_er','Collection tags are empty'),(10602,'en','collect_cat_er','Select collection category'),(10603,'en','collect_borad_pub','Make collection public'),(10604,'en','collect_allow_public_up','Public Upload'),(10605,'en','collect_pub_up_dallow','Disallow other users to add items.'),(10606,'en','collect_pub_up_allow','Allow other users to add items.'),(10607,'en','collection_name','Collection name'),(10608,'en','collection_description','Collection description'),(10609,'en','collection_tags','Collection tags'),(10610,'en','collect_category','Collection category'),(10611,'en','collect_added_msg','Collection has been added'),(10612,'en','collect_not_exist','Collection does not exist'),(10613,'en','no_upload_opt','No uploading option allowed by {title}, please contact website administrator.'),(10614,'en','Uploaded Photos','Uploaded photos'),(10615,'en','Favorite Photos','Favorite photos'),(10616,'en','Orphan Photos','Orphan photos'),(10617,'en','photos','Photos'),(10618,'en','cat_all','All'),(10619,'en','upload_desktop_msg','Upload videos directly from your desktop and share it online with our community '),(10620,'en','upload_remote_video_msg','Upload videos from other websites or server, simply enter its URL and click on Upload or you can enter Youtube Url and click Grab from youtube to upload video directly from youtube without entering its details'),(10621,'en','embed_video_msg','Embed videos from different website using their \"video embed code\" , simply enter embed code, enter video duration and select its thumb, fill in the required details and click on upload.'),(10622,'en','link_video_msg','If you would like to upload a video without having to wait for upload and proccessing phase to complete, simply put your video URL here along with a few other details and enjoy.'),(10623,'en','browse_photos','Browse photos'),(10624,'en','photo_is_saved_now','Photo collection has been saved'),(10625,'en','photo_success_heading','Photo collection has been updated successfully'),(10626,'en','share_embed','Shared / Embed'),(10627,'en','item_added_in_collection','%s successfully added in collection.'),(10628,'en','object_exists_collection','%s already exist in collection.'),(10629,'en','collect_tag_hint','alpha bravo charlie, ptv classics, hasb-e-haal'),(10630,'en','collect_broad_pri','Make collection private'),(10631,'en','collect_item_removed','%s is removed from collection.'),(10632,'en','most_downloaded','Most downloaded'),(10633,'en','total_videos','Total videos'),(10634,'en','collection_featured','Collection featured.'),(10635,'en','collection_unfeatured','Collection unfeatured.'),(10636,'en','upload_right_guide_photo','<strong>Important: Do not upload any photo that can be construed as Obscenity, copyrighted material, harassment, or spam.</strong>\r\n<p>By continuing \"Your Upload\", you are representing that these photos do not violate Our website\'s <a id=\"terms-of-use-link\" href=\"%s\"><span style=\"color:orange;\">Terms of Use</span></a> and that you own all copyrights of these photos or have authorization to upload it.</p>'),(10637,'en','upload_right_guide_vid','<strong>Important: Do not upload any video that can be construed as Obscenity, copyrighted material, harassment, or spam.</strong>\r\n<p>By continuing \"Your Upload\", you are representing that these videos do not violate Our website\'s <a id=\"terms-of-use-link\" href=\"%s\"><span style=\"color:orange;\">Terms of Use</span></a> and that you own all copyrights of these videos or have authorization to upload it.</p>'),(10638,'en','collection_deactivated','Collection deactivated.'),(10639,'en','collection_activated','Collection activated.'),(10640,'en','collection_updated','Collection updated.'),(10641,'en','cant_edit_collection','You can not edit this collection'),(10642,'en','object_not_in_collect','%s does not exist in this collection'),(10643,'en','object_does_not_exists','%s does not exist.'),(10644,'en','cant_perform_action_collect','You can not perform such actions on this collection.'),(10645,'en','collection_deleted','Collection deleted successfully.'),(10646,'en','collection_not_exists','Collection does not exist.'),(10647,'en','collect_items_deleted','Collection items deleted successfully.'),(10648,'en','photo_title_err','Please enter valid photo title'),(10649,'en','rand_photos','Random photos'),(10650,'en','this_has_set_profile_item','This %s has been set as your profile item'),(10651,'en','profile_item_removed','Profile item has been removed'),(10652,'en','make_profile_item','Make profile item'),(10653,'en','remove_profile_item','Remove profile item'),(10654,'en','content_type_empty','Content Type is empty. Please tell us what type of content you want.'),(10655,'en','watch_video_page','Watch on video page'),(10656,'en','watch_on_photo_page','Watch this on photo page'),(10657,'en','found_no_videos','Found no videos'),(10658,'en','found_no_photos','Found no photos'),(10659,'en','collections','Collections'),(10660,'en','related_videos','Related Videos'),(10661,'en','this_video_found_in_no_collection','This video is found in following collections'),(10662,'en','more_from','More from %s'),(10663,'en','this_collection','Collection : %s'),(10664,'en','vdo_broadcast_unlisted','Unlisted (anyone with the link and/or password can view)'),(10665,'en','video_link','Video link'),(10666,'en','channel_settings','Channel settings'),(10667,'en','channel_account_settings','Channel & Account Settings'),(10668,'en','account_settings','Account settings'),(10669,'en','allow_subscription','Allow subscription'),(10670,'en','allow_subscription_hint','Allow members to subscribe to your channel?'),(10671,'en','channel_title','Channel title'),(10672,'en','channel_desc','Channel description'),(10673,'en','show_my_friends','Show my friends'),(10674,'en','show_my_videos','Show my videos'),(10675,'en','show_my_photos','Show my photos'),(10676,'en','show_my_subscriptions','Show my subscriptions'),(10677,'en','show_my_subscribers','Show my subscribers'),(10678,'en','profile_basic_info','Basic info'),(10679,'en','profile_education_interests','Education, Hobbies, etc'),(10680,'en','channel_profile_settings','Channel & Profile Settings'),(10681,'en','show_my_collections','Show my collections'),(10682,'en','user_doesnt_any_collection','User doesn\'t have any collections.'),(10683,'en','unsubscribe','Unsubscribe'),(10684,'en','you_have_already_voted_channel','You have already voted this channel'),(10685,'en','channel_rating_disabled','Channel voting is disabled'),(10686,'en','user_activity','User activity'),(10687,'en','you_cant_view_profile','You don\'t have permission to view this channel :/'),(10688,'en','only_friends_view_channel','Only %s\'s friends can view this channel'),(10689,'en','collect_type','Collection type'),(10690,'en','add_to_my_collection','Add this to my collection'),(10691,'en','total_collections','Total collections'),(10692,'en','total_photos','Total photos'),(10693,'en','comments_made','Comments made'),(10694,'en','block_users','Block users'),(10695,'en','tp_del_confirm','Are you sure you want to delete this topic?'),(10696,'en','you_need_owners_approval_to_view_group','You need owners approval in order to view this group'),(10697,'en','you_cannot_rate_own_collection','You cannot rate your own collection'),(10698,'en','collection_rating_not_allowed','Collection rating is now allowed'),(10699,'en','you_cant_rate_own_video','You cannot rate your own video'),(10700,'en','you_cant_rate_own_channel','You cannot rate your own channel'),(10701,'en','you_cannot_rate_own_photo','You cannot rate your own photo'),(10702,'en','cant_pm_banned_user','You cannot send private messages to %s'),(10703,'en','you_are_not_allowed_to_view_user_channel','You are not allowed to view %s\'s channel'),(10704,'en','you_cant_send_pm_yourself','You cannot send private messages to yourself'),(10705,'en','please_enter_confimation_ode','Please enter verification code'),(10706,'en','vdo_brd_confidential','Confidential (Only for specified users)'),(10707,'en','video_password','Video password'),(10708,'en','set_video_password','Enter video password to make it \"password protected\"'),(10709,'en','video_pass_protected','This video is password protected, you must enter a valid password in order to view this video'),(10710,'en','please_enter_video_password','Please enter valid password in order to watch this video'),(10711,'en','video_is_password_protected','%s is password protected'),(10712,'en','invalid_video_password','Invalid video password'),(10713,'en','logged_users_only','Logged only (only logged in users can watch)'),(10714,'en','specify_video_users','Enter username who can watch this video , separated by comma'),(10715,'en','video_users','Video users'),(10716,'en','not_logged_video_error','You cannot watch this video because you are not logged in'),(10717,'en','no_user_subscribed_to_uploader','No user has subscribed to %s'),(10718,'en','subs_email_sent_to_users','Subscription email has been sent to %s user%s'),(10719,'en','user_has_uploaded_new_photo','%s has uploaded a new photo'),(10720,'en','please_provide_valid_userid','please provide valid userid'),(10721,'en','user_joined_us','%s has joined %s , say hello to %s'),(10722,'en','user_has_uploaded_new_video','%s has uploaded a new video'),(10723,'en','user_has_created_new_group','%s has created a new group'),(10724,'en','total_members','Total members'),(10725,'en','watch_video','Watch video'),(10726,'en','view_photo','View photo'),(10727,'en','user_has_joined_group','%s has joined a new group'),(10728,'en','user_is_now_friend_with_other','%s and %s are now friends'),(10729,'en','user_has_created_new_collection','%s has created a new collection'),(10730,'en','view_collection','View collection'),(10731,'en','user_has_favorited_video','%s has added a video to favorites'),(10732,'en','activity','Activity'),(10733,'en','no_activity','%s has no recent activity'),(10734,'en','feed_has_been_deleted','Activity feed has been deleted'),(10735,'en','you_cant_del_this_feed','You cannot delete this feed'),(10736,'en','you_cant_sub_yourself','You cannot subscribe yourself'),(10737,'en','manage_my_album','Manage my album'),(10738,'en','you_dont_have_permission_to_update_this_video','You don\'t have permission to update this video'),(10739,'en','group_is_public','Group is public'),(10740,'en','collection_thumb','Collection thumb'),(10741,'en','collection_is_private','Collction is private'),(10742,'en','edit_type_collection','Editing %s'),(10743,'en','comm_disabled_for_collection','Comments disabled for this collection'),(10744,'en','share_this_type','Share this %s'),(10745,'en','seperate_usernames_with_comma','Seperate usernames with comma'),(10746,'en','view_all','View all'),(10747,'en','album_privacy_updated','Album privacy has been updated'),(10748,'en','you_dont_have_any_videos','You do not have any videos'),(10749,'en','update_blocked_use','Blocked user-list has been updated'),(10750,'en','you_dont_have_fav_collections','You do not have any favorite collection'),(10751,'en','remote_play','Remote play'),(10752,'en','remote_upload_example','e.g http://clipbucket.com/sample.flv http://www.youtube.com/watch?v=QfRAHfquzM0'),(10753,'en','update_blocked_user_list','Update blocked users list'),(10754,'en','group_is_private','Group is private'),(10755,'en','no_user_associated_with_email','No user is associated with this email address'),(10756,'en','pass_changed_success','<div class=\"simple_container\">\r\n    	<h2 style=\"margin: 5px 5px 8px; font-family: Arial,Verdana,sans-serif;\">Password has been changed, please check your email</h2>     	<p style=\"margin: 0px 5px; line-height: 18px; font-size: 11px;\">You password has been successfully changed, please check your inbox for the newly generated password, once you login please change it accordingly by going to your account and click on change password.</p>\r\n </div>'),(10757,'en','add_as_friend','Add as friend'),(10758,'en','block_user','Block user'),(10759,'en','send_message','Send message'),(10760,'en','no_item_was_selected_to_delete','No item was selected to delete'),(10761,'en','playlist_items_have_been_removed','Playlist items have been removed'),(10762,'en','you_not_grp_mem_or_approved','You have not joined or an approved member of this group');
/*!40000 ALTER TABLE `cb_phrases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_playlist_items`
--

DROP TABLE IF EXISTS `cb_playlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_playlist_items` (
  `playlist_item_id` int(225) NOT NULL AUTO_INCREMENT,
  `object_id` int(225) NOT NULL,
  `playlist_id` int(225) NOT NULL,
  `playlist_item_type` varchar(10) NOT NULL,
  `userid` int(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_playlist_items`
--

LOCK TABLES `cb_playlist_items` WRITE;
/*!40000 ALTER TABLE `cb_playlist_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_playlist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_playlists`
--

DROP TABLE IF EXISTS `cb_playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_playlists` (
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(225) NOT NULL,
  `userid` int(11) NOT NULL,
  `playlist_type` varchar(10) NOT NULL,
  `category` enum('normal','favorites','likes','history','quicklist','watch_later') NOT NULL DEFAULT 'normal',
  `description` mediumtext NOT NULL,
  `tags` mediumtext NOT NULL,
  `privacy` enum('public','private','unlisted') NOT NULL DEFAULT 'public',
  `allow_comments` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_rating` enum('yes','no') NOT NULL DEFAULT 'yes',
  `total_comments` int(255) NOT NULL,
  `total_items` int(255) NOT NULL,
  `rating` int(3) NOT NULL,
  `rated_by` int(255) NOT NULL,
  `voters` text NOT NULL,
  `last_update` text NOT NULL,
  `runtime` int(200) NOT NULL,
  `first_item` text NOT NULL,
  `cover` text NOT NULL,
  `played` int(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_playlists`
--

LOCK TABLES `cb_playlists` WRITE;
/*!40000 ALTER TABLE `cb_playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_plugin_config`
--

DROP TABLE IF EXISTS `cb_plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_plugin_config` (
  `plugin_config_id` int(223) NOT NULL AUTO_INCREMENT,
  `plugin_id_code` varchar(25) NOT NULL,
  `plugin_config_name` text NOT NULL,
  `plugin_config_value` text NOT NULL,
  `player_type` enum('built-in','plugin') NOT NULL DEFAULT 'built-in',
  `player_admin_file` text NOT NULL,
  `player_include_file` text NOT NULL,
  PRIMARY KEY (`plugin_config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_plugin_config`
--

LOCK TABLES `cb_plugin_config` WRITE;
/*!40000 ALTER TABLE `cb_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_plugins`
--

DROP TABLE IF EXISTS `cb_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_plugins` (
  `plugin_id` int(255) NOT NULL AUTO_INCREMENT,
  `plugin_file` text NOT NULL,
  `plugin_folder` text NOT NULL,
  `plugin_version` float NOT NULL,
  `plugin_license_type` varchar(10) NOT NULL DEFAULT 'GPL',
  `plugin_license_key` varchar(5) NOT NULL,
  `plugin_license_code` text NOT NULL,
  `plugin_active` enum('yes','no') NOT NULL,
  PRIMARY KEY (`plugin_id`),
  KEY `plugin_active` (`plugin_active`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_plugins`
--

LOCK TABLES `cb_plugins` WRITE;
/*!40000 ALTER TABLE `cb_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_sessions`
--

DROP TABLE IF EXISTS `cb_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_sessions` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(100) NOT NULL,
  `session_user` int(11) NOT NULL,
  `session_string` varchar(60) NOT NULL,
  `session_value` varchar(32) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `session_date` datetime NOT NULL,
  `current_page` text NOT NULL,
  `referer` text NOT NULL,
  `agent` text NOT NULL,
  `last_active` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `session` (`session`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_sessions`
--

LOCK TABLES `cb_sessions` WRITE;
/*!40000 ALTER TABLE `cb_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_stats`
--

DROP TABLE IF EXISTS `cb_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_stats` (
  `stat_id` int(255) NOT NULL AUTO_INCREMENT,
  `date_added` date NOT NULL,
  `video_stats` text NOT NULL,
  `user_stats` text NOT NULL,
  `group_stats` text NOT NULL,
  PRIMARY KEY (`stat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_stats`
--

LOCK TABLES `cb_stats` WRITE;
/*!40000 ALTER TABLE `cb_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_subscriptions`
--

DROP TABLE IF EXISTS `cb_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_subscriptions` (
  `subscription_id` int(225) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `subscribed_to` mediumtext NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subscription_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_subscriptions`
--

LOCK TABLES `cb_subscriptions` WRITE;
/*!40000 ALTER TABLE `cb_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_template`
--

DROP TABLE IF EXISTS `cb_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_template` (
  `template_id` int(20) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(25) NOT NULL,
  `template_dir` varchar(30) NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_template`
--

LOCK TABLES `cb_template` WRITE;
/*!40000 ALTER TABLE `cb_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_user_categories`
--

DROP TABLE IF EXISTS `cb_user_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_user_categories` (
  `category_id` int(225) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL DEFAULT '',
  `category_order` int(5) NOT NULL DEFAULT '1',
  `category_desc` text NOT NULL,
  `date_added` mediumtext NOT NULL,
  `category_thumb` mediumtext NOT NULL,
  `isdefault` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_user_categories`
--

LOCK TABLES `cb_user_categories` WRITE;
/*!40000 ALTER TABLE `cb_user_categories` DISABLE KEYS */;
INSERT INTO `cb_user_categories` VALUES (1,'Basic User',1,'','2015-06-17 10:22:24','','yes'),(2,'Gurus',1,'','2015-06-17 10:22:24','','no'),(3,'Comedian',1,'','2015-06-17 10:22:24','','no');
/*!40000 ALTER TABLE `cb_user_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_user_levels`
--

DROP TABLE IF EXISTS `cb_user_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_user_levels` (
  `user_level_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_level_active` enum('yes','no') NOT NULL DEFAULT 'yes',
  `user_level_name` varchar(100) NOT NULL,
  `user_level_is_default` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`user_level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_user_levels`
--

LOCK TABLES `cb_user_levels` WRITE;
/*!40000 ALTER TABLE `cb_user_levels` DISABLE KEYS */;
INSERT INTO `cb_user_levels` VALUES (4,'yes','Guest','yes'),(2,'yes','Registered User','yes'),(3,'yes','Inactive User','yes'),(1,'yes','Administrator','yes'),(5,'yes','Global Moderator','yes'),(6,'yes','Anonymous','yes');
/*!40000 ALTER TABLE `cb_user_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_user_levels_permissions`
--

DROP TABLE IF EXISTS `cb_user_levels_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_user_levels_permissions` (
  `user_level_permission_id` int(22) NOT NULL AUTO_INCREMENT,
  `user_level_id` int(22) NOT NULL,
  `admin_access` enum('yes','no') NOT NULL DEFAULT 'no',
  `allow_video_upload` enum('yes','no') NOT NULL DEFAULT 'yes',
  `view_video` enum('yes','no') NOT NULL DEFAULT 'yes',
  `view_channel` enum('yes','no') NOT NULL DEFAULT 'yes',
  `view_group` enum('yes','no') NOT NULL DEFAULT 'yes',
  `view_videos` enum('yes','no') NOT NULL DEFAULT 'yes',
  `avatar_upload` enum('yes','no') NOT NULL DEFAULT 'yes',
  `video_moderation` enum('yes','no') NOT NULL DEFAULT 'no',
  `member_moderation` enum('yes','no') NOT NULL DEFAULT 'no',
  `ad_manager_access` enum('yes','no') NOT NULL DEFAULT 'no',
  `manage_template_access` enum('yes','no') NOT NULL DEFAULT 'no',
  `group_moderation` enum('yes','no') NOT NULL DEFAULT 'no',
  `web_config_access` enum('yes','no') NOT NULL DEFAULT 'no',
  `view_channels` enum('yes','no') NOT NULL DEFAULT 'yes',
  `view_groups` enum('yes','no') NOT NULL DEFAULT 'yes',
  `playlist_access` enum('yes','no') NOT NULL DEFAULT 'yes',
  `allow_channel_bg` enum('yes','no') NOT NULL DEFAULT 'yes',
  `private_msg_access` enum('yes','no') NOT NULL DEFAULT 'yes',
  `edit_video` enum('yes','no') NOT NULL DEFAULT 'yes',
  `download_video` enum('yes','no') NOT NULL DEFAULT 'yes',
  `admin_del_access` enum('yes','no') NOT NULL DEFAULT 'no',
  `photos_moderation` enum('yes','no') NOT NULL DEFAULT 'no',
  `collection_moderation` enum('yes','no') NOT NULL DEFAULT 'no',
  `plugins_moderation` enum('yes','no') NOT NULL DEFAULT 'no',
  `tool_box` enum('yes','no') NOT NULL DEFAULT 'no',
  `plugins_perms` text NOT NULL,
  `allow_manage_user_level` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`user_level_permission_id`),
  KEY `user_level_id` (`user_level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_user_levels_permissions`
--

LOCK TABLES `cb_user_levels_permissions` WRITE;
/*!40000 ALTER TABLE `cb_user_levels_permissions` DISABLE KEYS */;
INSERT INTO `cb_user_levels_permissions` VALUES (1,1,'yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','yes','','yes'),(2,2,'no','yes','yes','yes','yes','yes','yes','no','no','no','no','no','no','yes','yes','yes','yes','yes','yes','yes','no','no','no','no','no','','no'),(3,3,'no','no','yes','yes','yes','yes','no','no','no','no','no','no','no','yes','yes','yes','yes','yes','yes','yes','no','no','no','no','no','','no'),(4,4,'no','yes','yes','yes','yes','yes','no','no','no','no','no','no','no','yes','yes','yes','yes','yes','yes','yes','no','no','no','no','no','','no'),(5,5,'yes','yes','yes','yes','yes','yes','yes','yes','yes','no','no','no','no','yes','yes','yes','yes','yes','yes','yes','no','no','no','no','no','','no'),(6,6,'no','yes','no','no','no','no','yes','no','no','no','no','no','no','no','no','no','yes','no','no','yes','no','no','no','no','no','','no');
/*!40000 ALTER TABLE `cb_user_levels_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_user_permission_types`
--

DROP TABLE IF EXISTS `cb_user_permission_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_user_permission_types` (
  `user_permission_type_id` int(225) NOT NULL AUTO_INCREMENT,
  `user_permission_type_name` varchar(225) NOT NULL,
  `user_permission_type_desc` mediumtext NOT NULL,
  PRIMARY KEY (`user_permission_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_user_permission_types`
--

LOCK TABLES `cb_user_permission_types` WRITE;
/*!40000 ALTER TABLE `cb_user_permission_types` DISABLE KEYS */;
INSERT INTO `cb_user_permission_types` VALUES (1,'Viewing Permission',''),(2,'Uploading Permission',''),(3,'Administrator Permission',''),(4,'General Permission','');
/*!40000 ALTER TABLE `cb_user_permission_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_user_permissions`
--

DROP TABLE IF EXISTS `cb_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_user_permissions` (
  `permission_id` int(225) NOT NULL AUTO_INCREMENT,
  `permission_type` int(225) NOT NULL,
  `permission_name` varchar(225) NOT NULL,
  `permission_code` varchar(225) NOT NULL,
  `permission_desc` mediumtext NOT NULL,
  `permission_default` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_code` (`permission_code`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_user_permissions`
--

LOCK TABLES `cb_user_permissions` WRITE;
/*!40000 ALTER TABLE `cb_user_permissions` DISABLE KEYS */;
INSERT INTO `cb_user_permissions` VALUES (34,3,'Allow manage user levels','allow_manage_user_level','Allow user to edit user levels','no'),(12,3,'Admin Access','admin_access','User can access admin panel','no'),(13,1,'View Video','view_video','User can view videos','yes'),(11,2,'Allow Video Upload','allow_video_upload','Allow user to upload videos','yes'),(14,1,'View Channel','view_channel','User Can View Channel','yes'),(15,1,'View Group','view_group','User Can View Group','yes'),(16,1,'View Videos Page','view_videos','User Can view videos page','yes'),(17,2,'Allow Avatar Upload','avatar_upload','User can upload video','yes'),(19,3,'Video Moderation','video_moderation','User Can Moderate Videos','no'),(20,3,'Member Moderation','member_moderation','User Can Moderate Members','no'),(21,3,'Advertisment Manager','ad_manager_access','User can change advertisment','no'),(22,3,'Manage Templates','manage_template_access','User can manage website templates','no'),(23,3,'Groups Moderation','group_moderation','User can moderate group','no'),(24,3,'Website Configurations','web_config_access','User can change website settings','no'),(25,1,'View channels','view_channels','User can channels','yes'),(26,1,'View Groups','view_groups','User can view groups','yes'),(28,4,'Playlist Access','playlist_access','User can access playlists','yes'),(29,2,'Allow Channel Background','allow_channel_bg','Allow user to change channel background','yes'),(30,4,'Private Messages','private_msg_access','User can use private messaging system','yes'),(31,4,'Edit Video','edit_video','User can edit video','yes'),(32,4,'Download Video','download_video','User can download videos','yes'),(33,3,'Admin Delete Access','admin_del_access','User can delete comments if has admin access','no'),(35,3,'Allow photo moderation','photos_moderation','Allow user to moderation photos from admin panel','yes'),(36,3,'Collection modetaion','collection_moderation','Allow users to moderate collection','yes'),(37,3,'Plugins moderation','plugins_moderation','Allow user to moderate plugins','yes'),(38,3,'Tool Box','tool_box','Allow users to access tool box','yes');
/*!40000 ALTER TABLE `cb_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_user_profile`
--

DROP TABLE IF EXISTS `cb_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_user_profile` (
  `user_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `show_my_collections` enum('yes','no') NOT NULL DEFAULT 'yes',
  `userid` bigint(20) NOT NULL,
  `profile_title` mediumtext NOT NULL,
  `profile_desc` mediumtext NOT NULL,
  `featured_video` mediumtext NOT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `avatar` varchar(225) NOT NULL DEFAULT 'no_avatar.jpg',
  `show_dob` enum('no','yes') DEFAULT 'no',
  `postal_code` varchar(20) NOT NULL DEFAULT '',
  `time_zone` tinyint(4) NOT NULL DEFAULT '0',
  `profile_tags` mediumtext,
  `web_url` varchar(200) NOT NULL DEFAULT '',
  `hometown` varchar(100) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `online_status` enum('online','offline','custom') NOT NULL DEFAULT 'online',
  `show_profile` enum('all','members','friends') NOT NULL DEFAULT 'all',
  `allow_comments` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allow_ratings` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allow_subscription` enum('yes','no') NOT NULL DEFAULT 'yes',
  `content_filter` enum('Nothing','On','Off') NOT NULL DEFAULT 'Nothing',
  `icon_id` bigint(20) NOT NULL DEFAULT '0',
  `browse_criteria` mediumtext,
  `about_me` mediumtext NOT NULL,
  `education` varchar(3) DEFAULT NULL,
  `schools` mediumtext NOT NULL,
  `occupation` mediumtext NOT NULL,
  `companies` mediumtext NOT NULL,
  `relation_status` varchar(15) DEFAULT NULL,
  `hobbies` mediumtext NOT NULL,
  `fav_movies` mediumtext NOT NULL,
  `fav_music` mediumtext NOT NULL,
  `fav_books` mediumtext NOT NULL,
  `background` mediumtext NOT NULL,
  `profile_video` int(255) NOT NULL,
  `profile_item` varchar(25) NOT NULL,
  `rating` tinyint(2) NOT NULL,
  `voters` text NOT NULL,
  `rated_by` int(150) NOT NULL,
  `show_my_videos` enum('yes','no') NOT NULL DEFAULT 'yes',
  `show_my_photos` enum('yes','no') NOT NULL DEFAULT 'yes',
  `show_my_subscriptions` enum('yes','no') NOT NULL DEFAULT 'yes',
  `show_my_subscribers` enum('yes','no') NOT NULL DEFAULT 'yes',
  `show_my_friends` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`user_profile_id`),
  KEY `ind_status_id` (`userid`),
  FULLTEXT KEY `profile_tags` (`profile_tags`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_user_profile`
--

LOCK TABLES `cb_user_profile` WRITE;
/*!40000 ALTER TABLE `cb_user_profile` DISABLE KEYS */;
INSERT INTO `cb_user_profile` VALUES (1,'yes',1,'','','','','','no_avatar.jpg','yes','',0,'','','','','online','all','Yes','Yes','yes','Nothing',0,NULL,'','0','','','','0','','','','','',0,'',0,'',2,'yes','yes','yes','yes','yes');
/*!40000 ALTER TABLE `cb_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_users`
--

DROP TABLE IF EXISTS `cb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_users` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` int(20) NOT NULL,
  `featured_video` mediumtext NOT NULL,
  `username` text NOT NULL,
  `user_session_key` varchar(32) NOT NULL,
  `user_session_code` int(5) NOT NULL,
  `password` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `usr_status` enum('Ok','ToActivate') NOT NULL DEFAULT 'ToActivate',
  `msg_notify` enum('yes','no') NOT NULL DEFAULT 'yes',
  `avatar` varchar(225) NOT NULL DEFAULT '',
  `avatar_url` text NOT NULL,
  `sex` enum('male','female') NOT NULL DEFAULT 'male',
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `country` varchar(20) NOT NULL DEFAULT 'PK',
  `level` int(6) NOT NULL DEFAULT '2',
  `avcode` mediumtext NOT NULL,
  `doj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_logged` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_visits` bigint(20) NOT NULL DEFAULT '0',
  `session` varchar(32) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `signup_ip` varchar(15) NOT NULL DEFAULT '',
  `time_zone` tinyint(4) NOT NULL DEFAULT '0',
  `featured` enum('No','Yes') NOT NULL DEFAULT 'No',
  `featured_date` datetime NOT NULL,
  `profile_hits` bigint(20) DEFAULT '0',
  `total_watched` bigint(20) NOT NULL DEFAULT '0',
  `total_videos` bigint(20) NOT NULL,
  `total_comments` bigint(20) NOT NULL,
  `total_photos` bigint(255) NOT NULL,
  `total_collections` bigint(255) NOT NULL,
  `comments_count` bigint(20) NOT NULL,
  `last_commented` datetime NOT NULL,
  `voted` int(11) NOT NULL DEFAULT '0',
  `ban_status` enum('yes','no') NOT NULL DEFAULT 'no',
  `upload` varchar(20) NOT NULL DEFAULT '1',
  `subscribers` bigint(225) NOT NULL DEFAULT '0',
  `total_subscriptions` bigint(255) NOT NULL,
  `background` mediumtext NOT NULL,
  `background_color` varchar(25) NOT NULL,
  `background_url` text NOT NULL,
  `background_repeat` enum('no-repeat','repeat','repeat-x','repeat-y') NOT NULL DEFAULT 'repeat',
  `background_attachement` enum('yes','no') NOT NULL DEFAULT 'no',
  `total_groups` bigint(20) NOT NULL,
  `last_active` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banned_users` text NOT NULL,
  `welcome_email_sent` enum('yes','no') NOT NULL DEFAULT 'no',
  `total_downloads` bigint(255) NOT NULL,
  `album_privacy` enum('public','private','friends') NOT NULL DEFAULT 'private',
  `likes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `ind_status_doj` (`doj`),
  KEY `ind_status_id` (`userid`),
  KEY `ind_hits_doj` (`profile_hits`,`doj`),
  KEY `username` (`username`(255),`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_users`
--

LOCK TABLES `cb_users` WRITE;
/*!40000 ALTER TABLE `cb_users` DISABLE KEYS */;
INSERT INTO `cb_users` VALUES (1,2,'','admin','777750fea4d3bd585bf47dc1873619fc',10192,'38d8e594a1ddbd29fdba0de385d4fefa','admin@example.com','Ok','yes','0','','male','1989-10-14','PK',1,'08c5a7bd48','2015-06-17 01:22:29','2015-06-17 10:22:29',2,'pub6e7fq5oj76vakuov2j03hm1','172.17.42.1','172.17.42.1',0,'No','2009-12-03 15:14:20',0,0,0,0,0,0,0,'2011-02-07 12:56:46',0,'no','0',0,1,'0','','','no-repeat','yes',0,'2011-02-13 23:43:25','','yes',0,'private',0);
/*!40000 ALTER TABLE `cb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_validation_re`
--

DROP TABLE IF EXISTS `cb_validation_re`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_validation_re` (
  `re_id` int(25) NOT NULL AUTO_INCREMENT,
  `re_name` varchar(60) NOT NULL,
  `re_code` varchar(60) NOT NULL,
  `re_syntax` text NOT NULL,
  PRIMARY KEY (`re_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_validation_re`
--

LOCK TABLES `cb_validation_re` WRITE;
/*!40000 ALTER TABLE `cb_validation_re` DISABLE KEYS */;
INSERT INTO `cb_validation_re` VALUES (1,'Username','username','^^[a-zA-Z0-9_]+$'),(2,'Email','email','^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,10})$'),(3,'Field Text','field_text','^^[_a-z0-9-]+$');
/*!40000 ALTER TABLE `cb_validation_re` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_video`
--

DROP TABLE IF EXISTS `cb_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_video` (
  `videoid` bigint(20) NOT NULL AUTO_INCREMENT,
  `videokey` mediumtext NOT NULL,
  `video_password` varchar(255) NOT NULL,
  `video_users` text NOT NULL,
  `username` text NOT NULL,
  `userid` int(11) NOT NULL,
  `title` text,
  `flv` mediumtext NOT NULL,
  `file_name` varchar(32) NOT NULL,
  `file_directory` varchar(25) NOT NULL,
  `description` text,
  `tags` mediumtext NOT NULL,
  `category` varchar(200) NOT NULL DEFAULT '0',
  `category_parents` text NOT NULL,
  `broadcast` varchar(10) NOT NULL DEFAULT '',
  `location` mediumtext,
  `datecreated` date DEFAULT NULL,
  `country` mediumtext,
  `allow_embedding` char(3) NOT NULL DEFAULT '',
  `rating` int(15) NOT NULL DEFAULT '0',
  `rated_by` varchar(20) NOT NULL DEFAULT '0',
  `voter_ids` mediumtext NOT NULL,
  `allow_comments` char(3) NOT NULL DEFAULT '',
  `comment_voting` char(3) NOT NULL DEFAULT '',
  `comments_count` int(15) NOT NULL DEFAULT '0',
  `last_commented` datetime NOT NULL,
  `featured` char(3) NOT NULL DEFAULT 'no',
  `featured_date` datetime NOT NULL,
  `featured_description` mediumtext NOT NULL,
  `allow_rating` char(3) NOT NULL DEFAULT '',
  `active` char(3) NOT NULL DEFAULT '0',
  `favourite_count` varchar(15) NOT NULL DEFAULT '0',
  `playlist_count` varchar(15) NOT NULL DEFAULT '0',
  `views` bigint(22) NOT NULL DEFAULT '0',
  `last_viewed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flagged` varchar(3) NOT NULL DEFAULT 'no',
  `duration` varchar(20) NOT NULL DEFAULT '00',
  `status` enum('Successful','Processing','Failed') NOT NULL DEFAULT 'Processing',
  `failed_reason` enum('none','max_duration','max_file','invalid_format','invalid_upload') NOT NULL DEFAULT 'none',
  `flv_file_url` text,
  `default_thumb` int(3) NOT NULL DEFAULT '1',
  `aspect_ratio` varchar(10) NOT NULL,
  `embed_code` text NOT NULL,
  `refer_url` text NOT NULL,
  `downloads` bigint(255) NOT NULL,
  `uploader_ip` varchar(20) NOT NULL,
  `mass_embed_status` enum('no','pending','approved') NOT NULL DEFAULT 'no',
  `is_hd` enum('yes','no') NOT NULL DEFAULT 'no',
  `unique_embed_code` varchar(50) NOT NULL,
  `remote_play_url` text NOT NULL,
  `server_ip` varchar(20) NOT NULL,
  `file_server_path` text NOT NULL,
  `files_thumbs_path` text NOT NULL,
  `file_thumbs_count` varchar(30) NOT NULL,
  `has_hq` enum('yes','no') NOT NULL DEFAULT 'no',
  `has_mobile` enum('yes','no') NOT NULL DEFAULT 'no',
  `filegrp_size` varchar(30) NOT NULL,
  `process_status` bigint(30) NOT NULL DEFAULT '0',
  `has_hd` enum('yes','no') NOT NULL DEFAULT 'no',
  `video_version` varchar(30) NOT NULL DEFAULT '2.6',
  `extras` varchar(225) NOT NULL,
  PRIMARY KEY (`videoid`),
  KEY `status` (`status`,`active`,`broadcast`,`userid`),
  KEY `userid` (`userid`),
  KEY `videoid` (`videoid`,`videokey`(255)),
  FULLTEXT KEY `description` (`description`,`title`)
) ENGINE=MyISAM AUTO_INCREMENT=960 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_video`
--

LOCK TABLES `cb_video` WRITE;
/*!40000 ALTER TABLE `cb_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_video_categories`
--

DROP TABLE IF EXISTS `cb_video_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_video_categories` (
  `category_id` int(225) NOT NULL AUTO_INCREMENT,
  `parent_id` int(255) NOT NULL DEFAULT '0',
  `category_name` varchar(30) NOT NULL DEFAULT '',
  `category_order` int(5) NOT NULL DEFAULT '1',
  `category_desc` text NOT NULL,
  `date_added` mediumtext NOT NULL,
  `category_thumb` mediumtext NOT NULL,
  `isdefault` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_video_categories`
--

LOCK TABLES `cb_video_categories` WRITE;
/*!40000 ALTER TABLE `cb_video_categories` DISABLE KEYS */;
INSERT INTO `cb_video_categories` VALUES (1,0,'Uncategorized',1,'','2015-06-17 10:22:24','','yes');
/*!40000 ALTER TABLE `cb_video_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_video_favourites`
--

DROP TABLE IF EXISTS `cb_video_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_video_favourites` (
  `fav_id` int(11) NOT NULL AUTO_INCREMENT,
  `videoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fav_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_video_favourites`
--

LOCK TABLES `cb_video_favourites` WRITE;
/*!40000 ALTER TABLE `cb_video_favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_video_favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_video_files`
--

DROP TABLE IF EXISTS `cb_video_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_video_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(2) NOT NULL,
  `file_conversion_log` text NOT NULL,
  `encoder` char(16) NOT NULL,
  `command_used` text NOT NULL,
  `src_path` text NOT NULL,
  `src_name` char(64) NOT NULL,
  `src_ext` char(8) NOT NULL,
  `src_format` char(32) NOT NULL,
  `src_duration` char(10) NOT NULL,
  `src_size` char(10) NOT NULL,
  `src_bitrate` char(6) NOT NULL,
  `src_video_width` char(5) NOT NULL,
  `src_video_height` char(5) NOT NULL,
  `src_video_wh_ratio` char(10) NOT NULL,
  `src_video_codec` char(16) NOT NULL,
  `src_video_rate` char(10) NOT NULL,
  `src_video_bitrate` char(10) NOT NULL,
  `src_video_color` char(16) NOT NULL,
  `src_audio_codec` char(16) NOT NULL,
  `src_audio_bitrate` char(10) NOT NULL,
  `src_audio_rate` char(10) NOT NULL,
  `src_audio_channels` char(16) NOT NULL,
  `output_path` text NOT NULL,
  `output_format` char(32) NOT NULL,
  `output_duration` char(10) NOT NULL,
  `output_size` char(10) NOT NULL,
  `output_bitrate` char(6) NOT NULL,
  `output_video_width` char(5) NOT NULL,
  `output_video_height` char(5) NOT NULL,
  `output_video_wh_ratio` char(10) NOT NULL,
  `output_video_codec` char(16) NOT NULL,
  `output_video_rate` char(10) NOT NULL,
  `output_video_bitrate` char(10) NOT NULL,
  `output_video_color` char(16) NOT NULL,
  `output_audio_codec` char(16) NOT NULL,
  `output_audio_bitrate` char(10) NOT NULL,
  `output_audio_rate` char(10) NOT NULL,
  `output_audio_channels` char(16) NOT NULL,
  `hd` enum('yes','no') NOT NULL DEFAULT 'no',
  `hq` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `src_bitrate` (`src_bitrate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_video_files`
--

LOCK TABLES `cb_video_files` WRITE;
/*!40000 ALTER TABLE `cb_video_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_video_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cb_video_views`
--

DROP TABLE IF EXISTS `cb_video_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cb_video_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` varchar(255) NOT NULL,
  `video_views` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cb_video_views`
--

LOCK TABLES `cb_video_views` WRITE;
/*!40000 ALTER TABLE `cb_video_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `cb_video_views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-17 10:23:11
