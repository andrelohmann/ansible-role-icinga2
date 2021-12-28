--
-- Table structure for table `icingaweb_group`
--

DROP TABLE IF EXISTS `icingaweb_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icingaweb_group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent` int unsigned DEFAULT NULL,
  `ctime` timestamp NULL DEFAULT NULL,
  `mtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`),
  KEY `fk_icingaweb_group_parent_id` (`parent`),
  CONSTRAINT `fk_icingaweb_group_parent_id` FOREIGN KEY (`parent`) REFERENCES `icingaweb_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icingaweb_group`
--

LOCK TABLES `icingaweb_group` WRITE;
/*!40000 ALTER TABLE `icingaweb_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `icingaweb_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icingaweb_group_membership`
--

DROP TABLE IF EXISTS `icingaweb_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icingaweb_group_membership` (
  `group_id` int unsigned NOT NULL,
  `username` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ctime` timestamp NULL DEFAULT NULL,
  `mtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`,`username`),
  CONSTRAINT `fk_icingaweb_group_membership_icingaweb_group` FOREIGN KEY (`group_id`) REFERENCES `icingaweb_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icingaweb_group_membership`
--

LOCK TABLES `icingaweb_group_membership` WRITE;
/*!40000 ALTER TABLE `icingaweb_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `icingaweb_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icingaweb_rememberme`
--

DROP TABLE IF EXISTS `icingaweb_rememberme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icingaweb_rememberme` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `passphrase` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `random_iv` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `http_user_agent` text COLLATE utf8mb4_bin NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `ctime` timestamp NULL DEFAULT NULL,
  `mtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icingaweb_rememberme`
--

LOCK TABLES `icingaweb_rememberme` WRITE;
/*!40000 ALTER TABLE `icingaweb_rememberme` DISABLE KEYS */;
/*!40000 ALTER TABLE `icingaweb_rememberme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icingaweb_user`
--

DROP TABLE IF EXISTS `icingaweb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icingaweb_user` (
  `name` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `password_hash` varbinary(255) NOT NULL,
  `ctime` timestamp NULL DEFAULT NULL,
  `mtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icingaweb_user`
--

LOCK TABLES `icingaweb_user` WRITE;
/*!40000 ALTER TABLE `icingaweb_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `icingaweb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icingaweb_user_preference`
--

DROP TABLE IF EXISTS `icingaweb_user_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icingaweb_user_preference` (
  `username` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) NOT NULL,
  `ctime` timestamp NULL DEFAULT NULL,
  `mtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`,`section`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icingaweb_user_preference`
--

LOCK TABLES `icingaweb_user_preference` WRITE;
/*!40000 ALTER TABLE `icingaweb_user_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `icingaweb_user_preference` ENABLE KEYS */;
UNLOCK TABLES;
