-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: gpl_1
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 會員',7,'add_user'),(26,'Can change 會員',7,'change_user'),(27,'Can delete 會員',7,'delete_user'),(28,'Can view 會員',7,'view_user'),(29,'Can add 信用卡庫',8,'add_ucreditcard'),(30,'Can change 信用卡庫',8,'change_ucreditcard'),(31,'Can delete 信用卡庫',8,'delete_ucreditcard'),(32,'Can view 信用卡庫',8,'view_ucreditcard'),(33,'Can add 影片庫',9,'add_filmlibrary'),(34,'Can change 影片庫',9,'change_filmlibrary'),(35,'Can delete 影片庫',9,'delete_filmlibrary'),(36,'Can view 影片庫',9,'view_filmlibrary');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$4HMQQwWmWRxA$CEK5QNIVbSNYcrWjN5AfspnaufliAkEYyXHrVD8NOfk=','2020-03-18 11:55:11.259745',1,'chesteryan','','','',1,1,'2020-03-16 15:13:59.009086');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-16 15:29:42.702602','2','',3,'',7,1),(2,'2020-03-16 15:29:53.748872','1','Ucreditcard object (1)',3,'',8,1),(3,'2020-03-17 08:45:13.567454','1','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\", \"\\u8a02\\u95b1\\u5c0d\\u8c61\", \"\\u81ea\\u6211\\u4ecb\\u7d39\", \"\\u4fe1\\u7528\\u5361\\u865f\"]}}]',7,1),(4,'2020-03-17 08:47:43.921030','6','Ucreditcard object (6)',3,'',8,1),(5,'2020-03-17 08:59:09.424416','8','Ucreditcard object (8)',3,'',8,1),(6,'2020-03-17 08:59:24.922173','1','boss',3,'',7,1),(7,'2020-03-17 09:00:18.234956','3','boss',1,'[{\"added\": {}}]',7,1),(8,'2020-03-17 12:34:00.875303','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(9,'2020-03-17 12:44:09.928507','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(10,'2020-03-17 12:44:40.972532','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(11,'2020-03-17 13:07:35.947883','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(12,'2020-03-17 13:07:53.640870','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(13,'2020-03-17 13:08:57.950572','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(14,'2020-03-17 13:09:32.499241','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(15,'2020-03-17 13:11:03.174979','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(16,'2020-03-17 13:11:33.154826','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(17,'2020-03-18 08:50:43.393859','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(18,'2020-03-18 08:50:58.463020','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(19,'2020-03-18 08:53:13.871267','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(20,'2020-03-18 08:53:27.554926','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(21,'2020-03-18 08:55:19.056253','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(22,'2020-03-18 08:56:45.643241','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(23,'2020-03-18 08:57:06.348974','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(24,'2020-03-18 08:58:15.151781','3','boss',2,'[{\"changed\": {\"fields\": [\"\\u5927\\u982d\\u7167\"]}}]',7,1),(25,'2020-03-18 11:55:30.868344','9','Ucreditcard object (9)',3,'',8,1),(26,'2020-03-18 15:34:27.560452','7','',3,'',7,1),(27,'2020-03-18 15:34:27.561713','6','',3,'',7,1),(28,'2020-03-18 15:34:27.562705','5','',3,'',7,1),(29,'2020-03-18 15:34:27.563624','4','',3,'',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'index','filmlibrary'),(8,'index','ucreditcard'),(7,'index','user'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-16 15:09:47.766750'),(2,'auth','0001_initial','2020-03-16 15:09:47.829666'),(3,'admin','0001_initial','2020-03-16 15:09:47.955298'),(4,'admin','0002_logentry_remove_auto_add','2020-03-16 15:09:47.997213'),(5,'admin','0003_logentry_add_action_flag_choices','2020-03-16 15:09:48.004167'),(6,'contenttypes','0002_remove_content_type_name','2020-03-16 15:09:48.044603'),(7,'auth','0002_alter_permission_name_max_length','2020-03-16 15:09:48.065116'),(8,'auth','0003_alter_user_email_max_length','2020-03-16 15:09:48.084077'),(9,'auth','0004_alter_user_username_opts','2020-03-16 15:09:48.091346'),(10,'auth','0005_alter_user_last_login_null','2020-03-16 15:09:48.113107'),(11,'auth','0006_require_contenttypes_0002','2020-03-16 15:09:48.114735'),(12,'auth','0007_alter_validators_add_error_messages','2020-03-16 15:09:48.121402'),(13,'auth','0008_alter_user_username_max_length','2020-03-16 15:09:48.146439'),(14,'auth','0009_alter_user_last_name_max_length','2020-03-16 15:09:48.170853'),(15,'auth','0010_alter_group_name_max_length','2020-03-16 15:09:48.184278'),(16,'auth','0011_update_proxy_permissions','2020-03-16 15:09:48.192950'),(17,'index','0001_initial','2020-03-16 15:09:48.246440'),(18,'sessions','0001_initial','2020-03-16 15:09:48.280893'),(19,'index','0002_auto_20200316_2326','2020-03-16 15:26:35.235102'),(20,'index','0003_auto_20200317_1645','2020-03-17 08:45:49.222780'),(21,'index','0004_auto_20200317_1723','2020-03-17 09:23:56.220032'),(22,'index','0005_auto_20200317_2031','2020-03-17 12:31:55.722547'),(23,'index','0006_auto_20200317_2044','2020-03-17 12:44:25.452394'),(24,'index','0007_auto_20200317_2107','2020-03-17 13:07:25.788008'),(25,'index','0008_auto_20200317_2110','2020-03-17 13:10:53.871951'),(26,'index','0009_auto_20200318_1652','2020-03-18 08:52:48.267787'),(27,'index','0010_auto_20200318_1657','2020-03-18 08:57:43.835160'),(28,'index','0011_auto_20200318_2032','2020-03-18 12:32:07.737039');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fnw70xbn7ijwnv846u23pyyk7mr9vr8z','MGRmMTVhODM1MmViOTVhM2ExMDUyNGZmMWI0NTFjYjdkZmRlM2QwZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5YzU2ZTA3YjZlY2E3M2UyYmEzODczYjg3ZTBiOGRlYTJhZDQ4NmY3IiwidWlkIjozLCJ1bmFtZSI6ImJvc3MifQ==','2020-03-18 09:00:37.261199'),('on5l8co5rehyx7cdkwicel36hr7qk3d6','Y2YxNjVmZmZiMTQ4ZGFkOTUwZWUwMzVkZTY5Y2IwMGU5YmQyY2E5ZDp7InVpZCI6MywidW5hbWUiOiJib3NzIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjljNTZlMDdiNmVjYTczZTJiYTM4NzNiODdlMGI4ZGVhMmFkNDg2ZjcifQ==','2020-03-19 11:55:11.261068');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FilmLibrary`
--

LOCK TABLES `FilmLibrary` WRITE;
/*!40000 ALTER TABLE `FilmLibrary` DISABLE KEYS */;
/*!40000 ALTER TABLE `FilmLibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ucreditcard`
--

DROP TABLE IF EXISTS `Ucreditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ucreditcard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cc_number` varchar(25) DEFAULT NULL,
  `cc_expiry` date DEFAULT NULL,
  `cc_code` varchar(4) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_id` (`user_id`),
  CONSTRAINT `Ucreditcard_user_id_93d0daac_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ucreditcard`
--

LOCK TABLES `Ucreditcard` WRITE;
/*!40000 ALTER TABLE `Ucreditcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ucreditcard` ENABLE KEYS */;
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
  `ugender` varchar(2) DEFAULT NULL,
  `uphoto` varchar(100) DEFAULT NULL,
  `uintro` longtext,
  `ucredit` varchar(16) DEFAULT NULL,
  `ufriend` varchar(30) DEFAULT NULL,
  `usubs` varchar(30) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'boss','boss','2020-02-01','boss@boss.com','男','timeofleave-profile_image-cb45878cb95ac61f-50x50.png','','','boss','',1);
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

-- Dump completed on 2020-03-18 23:41:25
