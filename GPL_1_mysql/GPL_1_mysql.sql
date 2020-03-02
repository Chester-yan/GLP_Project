-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: GPL_1
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add creditcard',7,'add_creditcard'),(26,'Can change creditcard',7,'change_creditcard'),(27,'Can delete creditcard',7,'delete_creditcard'),(28,'Can view creditcard',7,'view_creditcard'),(29,'Can add film library',8,'add_filmlibrary'),(30,'Can change film library',8,'change_filmlibrary'),(31,'Can delete film library',8,'delete_filmlibrary'),(32,'Can view film library',8,'view_filmlibrary'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$WmyFTwSzr0pc$+iKVj73PTJAtgRS17l768Vtb5mJaYmBtdArmiBie0r4=','2020-02-24 06:20:51.226353',1,'chesteryan','','','chesterdesigner@gmail.com',1,1,'2020-02-02 05:20:51.737511');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-02-11 10:04:57.553547','1','chester',1,'[{\"added\": {}}]',9,1),(2,'2020-02-11 10:05:30.493373','2','king',1,'[{\"added\": {}}]',9,1),(3,'2020-02-11 10:06:09.704986','3','wang',1,'[{\"added\": {}}]',9,1),(4,'2020-02-11 10:06:42.202805','4','stanely',1,'[{\"added\": {}}]',9,1),(5,'2020-02-11 10:36:27.226344','1','chester',2,'[{\"changed\": {\"fields\": [\"\\u6027\\u5225\"]}}]',9,1),(6,'2020-02-11 10:36:48.916880','2','king',2,'[{\"changed\": {\"fields\": [\"\\u6027\\u5225\"]}}]',9,1),(7,'2020-02-11 10:36:55.977187','4','stanely',2,'[{\"changed\": {\"fields\": [\"\\u6027\\u5225\"]}}]',9,1),(8,'2020-02-11 10:37:02.275740','3','wang',2,'[{\"changed\": {\"fields\": [\"\\u6027\\u5225\"]}}]',9,1),(9,'2020-02-13 06:51:26.643622','5','boss',3,'',9,1),(10,'2020-02-13 07:00:21.038170','6','boss',3,'',9,1),(11,'2020-02-13 07:05:16.947822','7','boss',3,'',9,1),(12,'2020-02-13 07:05:50.830443','8','boss',3,'',9,1),(13,'2020-02-13 07:06:16.966177','9','boss',3,'',9,1),(14,'2020-02-13 07:07:57.808254','10','boss',3,'',9,1),(15,'2020-02-14 08:40:08.862753','11','boss',3,'',9,1),(16,'2020-02-17 07:15:11.256118','12','boss',3,'',9,1),(17,'2020-02-17 07:18:29.701423','13','boss',3,'',9,1),(18,'2020-02-17 07:20:32.452684','14','boss',3,'',9,1),(19,'2020-02-17 07:24:43.258051','15','boss',3,'',9,1),(20,'2020-02-17 07:32:28.099981','16','boss',3,'',9,1),(21,'2020-02-17 13:11:31.679376','17','boss',3,'',9,1),(22,'2020-02-17 13:12:00.443235','18','boss',3,'',9,1),(23,'2020-02-17 13:14:58.760213','19','boss',3,'',9,1),(24,'2020-02-17 13:21:40.309966','20','boss',3,'',9,1),(25,'2020-02-17 13:21:40.311204','21','cclso',3,'',9,1),(26,'2020-02-17 13:47:01.298549','22','boss',3,'',9,1),(27,'2020-02-17 13:47:44.193288','23','boss',3,'',9,1),(28,'2020-02-18 11:56:56.608974','24','boss',3,'',9,1),(29,'2020-02-18 12:07:45.362649','25','boss',3,'',9,1),(30,'2020-02-18 15:59:22.201298','26','boss',3,'',9,1),(31,'2020-02-24 06:21:24.541869','27','boss',3,'',9,1),(32,'2020-02-24 06:35:28.943178','28','boss',3,'',9,1),(33,'2020-02-24 08:01:07.957335','29','boss',3,'',9,1),(34,'2020-02-24 08:18:19.032080','31','boss',3,'',9,1),(35,'2020-02-24 08:23:51.535068','32','boss',3,'',9,1),(36,'2020-02-24 08:46:16.290912','33','kkkk',3,'',9,1),(37,'2020-02-24 08:51:14.122623','34','kkkk',3,'',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'index','creditcard'),(8,'index','filmlibrary'),(9,'index','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-02-02 05:10:39.578645'),(2,'auth','0001_initial','2020-02-02 05:10:39.623373'),(3,'admin','0001_initial','2020-02-02 05:10:39.721045'),(4,'admin','0002_logentry_remove_auto_add','2020-02-02 05:10:39.751876'),(5,'admin','0003_logentry_add_action_flag_choices','2020-02-02 05:10:39.757533'),(6,'contenttypes','0002_remove_content_type_name','2020-02-02 05:10:39.788689'),(7,'auth','0002_alter_permission_name_max_length','2020-02-02 05:10:39.804058'),(8,'auth','0003_alter_user_email_max_length','2020-02-02 05:10:39.823561'),(9,'auth','0004_alter_user_username_opts','2020-02-02 05:10:39.829982'),(10,'auth','0005_alter_user_last_login_null','2020-02-02 05:10:39.846194'),(11,'auth','0006_require_contenttypes_0002','2020-02-02 05:10:39.847606'),(12,'auth','0007_alter_validators_add_error_messages','2020-02-02 05:10:39.852845'),(13,'auth','0008_alter_user_username_max_length','2020-02-02 05:10:39.872985'),(14,'auth','0009_alter_user_last_name_max_length','2020-02-02 05:10:39.892321'),(15,'auth','0010_alter_group_name_max_length','2020-02-02 05:10:39.908382'),(16,'auth','0011_update_proxy_permissions','2020-02-02 05:10:39.914333'),(17,'sessions','0001_initial','2020-02-02 05:10:39.921003');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0y7mci3oqr41nyp4fdplpo9ynxhcpv7s','YTRhMTM4MTIwOTQ5ZDQ3ZDk2YzE5ZGViMGI3NWYxNzQ2Zjg2YjJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3In0=','2020-02-16 14:11:15.272051'),('5dwpqnn76sx850d1ylr2e6hji89oesrf','YTRhMTM4MTIwOTQ5ZDQ3ZDk2YzE5ZGViMGI3NWYxNzQ2Zjg2YjJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3In0=','2020-02-12 06:30:56.683864'),('7096bgtd95he0v8ggrikpoibh22tajts','YTRhMTM4MTIwOTQ5ZDQ3ZDk2YzE5ZGViMGI3NWYxNzQ2Zjg2YjJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3In0=','2020-02-11 06:05:17.605322'),('9qhcll6wt6mr79n70va7o2092xfs0ms5','OTBiYzY2YTYyM2QwZWY3OGQ5MmI1NDU5ZGJhN2ZiNDVlYjE2MzA3Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3IiwidWlkIjozMCwidW5hbWUiOiJib3NzIn0=','2020-02-26 11:27:47.930475'),('ddlokg3pjjixynuddga4uibjgw6cvqfb','YTRhMTM4MTIwOTQ5ZDQ3ZDk2YzE5ZGViMGI3NWYxNzQ2Zjg2YjJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3In0=','2020-02-16 08:55:28.005727'),('jv25r2ci10e9mii4l6p9fl8ukq86kcih','YTA4YzBiOWNkZjVkNGIwNzU5M2M3MTM1YjJkNGM4MTgwNWUzM2M4MTp7InVuYW1lIjoxLCJ1cHdkIjoiYzA2MzAifQ==','2020-02-19 04:04:39.392142'),('la4ewy1b24dcksx5uugvvbqehy8v3033','MGNiZDFmMmQzMmQwNTZmODIxZjZhY2E1MmQ4MDg2ZTM2MTk5ZmM2ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3IiwidW5hbWUiOiJib3NzIiwidXB3ZCI6ImJvc3MiLCJ1aWQiOjI3fQ==','2020-02-19 15:59:43.991570'),('mu72i4rdauct8akacw447m0gui1ky2q2','YTRhMTM4MTIwOTQ5ZDQ3ZDk2YzE5ZGViMGI3NWYxNzQ2Zjg2YjJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3In0=','2020-02-24 16:45:55.356401'),('nxs8frhz69fyyvn8zexhvtnlk2r3cgx9','YTRhMTM4MTIwOTQ5ZDQ3ZDk2YzE5ZGViMGI3NWYxNzQ2Zjg2YjJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3In0=','2020-02-15 07:19:01.280042'),('phwal30zwufrxcidqak0kkm88p0qtjtr','YTRhMTM4MTIwOTQ5ZDQ3ZDk2YzE5ZGViMGI3NWYxNzQ2Zjg2YjJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3In0=','2020-02-14 06:51:04.976310'),('w4ls3urn8z59p36bild22f8wq230950q','ZTc1MDgxY2U2NDY4MjFhNjkxOTljMzc0ZmE1MTRkNzNhYzkyMDUyMDp7fQ==','2020-02-20 05:29:41.253359'),('xo8a04inmi7qn1spfixbecy9mjdskq8j','YTRhMTM4MTIwOTQ5ZDQ3ZDk2YzE5ZGViMGI3NWYxNzQ2Zjg2YjJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3In0=','2020-02-20 04:21:03.287290'),('ya94bff03e8f46536mpqbswl27fjt21a','ZDQwYjIxYzBmNjY5OTk1OWJhMDdkZDc2YjczYTYxNjg3ZmE5NjA3Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzhiNGJhMjQ3MWUwYTdlODdlMjI0ZmQ2ZGZjMmQzMWE1MThmMjc3IiwidW5hbWUiOjEsInVwd2QiOiJjMDYzMCJ9','2020-02-19 03:55:16.028133');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FilmLibrary`
--

DROP TABLE IF EXISTS `FilmLibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FilmLibrary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `ftype` varchar(10) NOT NULL,
  `fintro` longtext NOT NULL,
  `fquality` varchar(10) NOT NULL,
  `fauthor` varchar(30) NOT NULL,
  `fdate` datetime(6) NOT NULL,
  `ftime` time(6) NOT NULL,
  `flike` int NOT NULL,
  `fcommet` longtext NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FilmLibrary_user_id_be7ed763_fk_user_id` (`user_id`),
  CONSTRAINT `FilmLibrary_user_id_be7ed763_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FilmLibrary`
--

LOCK TABLES `FilmLibrary` WRITE;
/*!40000 ALTER TABLE `FilmLibrary` DISABLE KEYS */;
/*!40000 ALTER TABLE `FilmLibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `upwd` varchar(20) NOT NULL,
  `ubd` date NOT NULL,
  `uemail` varchar(254) NOT NULL,
  `uphoto` varchar(100) DEFAULT NULL,
  `uintro` longtext NOT NULL,
  `ucredit` varchar(16) DEFAULT NULL,
  `ufriend` varchar(30) DEFAULT NULL,
  `usubs` varchar(30) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `ugender` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'chester','c0630','1987-06-30','chester@ggg.com','','',NULL,NULL,NULL,1,'M'),(2,'king','kkk','1998-05-22','kign@king.com','','',NULL,NULL,NULL,1,'W'),(3,'wang','www','1997-08-10','wang@www.com','','',NULL,NULL,NULL,1,'W'),(4,'stanely','sss','1999-08-12','stanely@sss.com','','',NULL,NULL,NULL,1,'M'),(30,'boss','boss','2020-01-01','boss@boss.com','','',NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-26 17:55:01
