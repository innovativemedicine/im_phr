USE phr_db_dev;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `answer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `answer_text` longtext NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (0,0,'0'),(1,0,'1'),(2,0,'2'),(3,0,'3'),(4,0,'4'),(5,0,'5'),(6,0,'6'),(7,0,'7'),(8,0,'8'),(9,0,'9'),(10,0,'10'),(12,0,'Without Any difficulty'),(13,0,'With Some difficulty'),(14,0,'With Much difficulty'),(15,0,'Unable to do'),(23,0,'Other, specify'),(44,0,'[scale]');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `question_text` longtext NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,2,1,'BASDAI','How would you describe the overall level of fatigue/tiredness you have experienced?'),(2,0,1,'BASDAI','How would you describe the overall level of inflammatory neck, back or hip pain you have had?'),(3,0,1,'BASDAI','How would you describe the overall level of pain/swelling in joints other than neck, back or hips you have had?'),(4,0,1,'BASDAI','How would you describe the overall level of discomfort you have had from any areas tender to touch or pressure?'),(5,0,1,'BASDAI','How would you describe the overall level of morning stiffness you have had from the time you wake up?'),(6,0,1,'BASDAI','How long does your morning stiffness last from the time you wake up?'),(7,0,2,'BASFI','Putting on your socks or tights without help or aids (e.g., sock aids)'),(8,0,2,'BASFI','Bending forward from the waist to pick up a pen from the floor without aid'),(9,0,2,'BASFI','Reaching up to a high shelf without help or aids (e.g., helping hand)'),(10,0,2,'BASFI','Getting up out of an armless dining room chair without using your hands or any other help'),(11,0,2,'BASFI','Getting up off the floor without help from lying on your back'),(12,0,2,'BASFI','Standing unsupported for 10 minutes without discomfort'),(13,0,2,'BASFI','Climbing 12-15 steps without using a handrail or walking aid (one foot on each step)'),(14,0,2,'BASFI','Looking over your shoulder without turning your body'),(15,0,2,'BASFI','Doing physically demanding activities (e.g., physiotherapy exercises, gardening or sports)'),(16,0,2,'BASFI','Doing a full day,s activities whether it be at home or at work'),(17,0,3,'Health Assessment Questionnaire','Dress yourself, including tying shoelaces and doing up buttons?'),(18,0,3,'Health Assessment Questionnaire','Shampoo your hair?'),(19,0,3,'Health Assessment Questionnaire','Stand up from a chair without armrests?'),(20,0,3,'Health Assessment Questionnaire','Get in and out of bed?'),(21,0,3,'Health Assessment Questionnaire','Cut your meat?'),(22,0,3,'Health Assessment Questionnaire','Lift a full cup or glass to your mouth?'),(23,0,3,'Health Assessment Questionnaire','Open a new milk carton?'),(24,0,3,'Health Assessment Questionnaire','Walk outdoor on flat ground?'),(25,0,3,'Health Assessment Questionnaire','Climb up five steps?'),(26,0,3,'Health Assessment Questionnaire','Cane'),(27,0,3,'Health Assessment Questionnaire','Devices used for dressing ( button hook, zipper pull, long-handed shoe horn, etc )'),(28,0,3,'Health Assessment Questionnaire','Walker'),(29,0,3,'Health Assessment Questionnaire','Specially adapted utensils ( such as for eating, cooking )'),(30,0,3,'Health Assessment Questionnaire','Crutches'),(31,0,3,'Health Assessment Questionnaire','Specially adapted chair'),(32,0,3,'Health Assessment Questionnaire','Wheelchair'),(33,0,3,'Health Assessment Questionnaire','Other, specify'),(34,0,3,'Health Assessment Questionnaire','Dressing & Grooming'),(35,0,3,'Health Assessment Questionnaire','Eating'),(36,0,3,'Health Assessment Questionnaire','Arising'),(37,0,3,'Health Assessment Questionnaire','Walking'),(38,0,3,'Health Assessment Questionnaire','Wash and dry your body?'),(39,0,3,'Health Assessment Questionnaire','Take a bath?'),(40,0,3,'Health Assessment Questionnaire','Get on and off the toilet?'),(41,0,3,'Health Assessment Questionnaire','Reach and get down 2.5 kilo / 5 pound object (such as a bag of sugar) from just above your head?'),(42,0,3,'Health Assessment Questionnaire','Bend down to pick up clothing from the floor?'),(43,0,3,'Health Assessment Questionnaire','Open car doors?'),(44,0,3,'Health Assessment Questionnaire','Open jars which have been previously opened?'),(45,0,3,'Health Assessment Questionnaire','Turn water facets/taps on and off?'),(46,0,3,'Health Assessment Questionnaire','Run errands and shop?'),(47,0,3,'Health Assessment Questionnaire','Get in and out of a car?'),(48,0,3,'Health Assessment Questionnaire','Do chores such as vacuuming and yardwork?'),(49,0,3,'Health Assessment Questionnaire','Raised toilet seat'),(50,0,3,'Health Assessment Questionnaire','Bathtub bar'),(51,0,3,'Health Assessment Questionnaire','Bathtub seat'),(52,0,3,'Health Assessment Questionnaire','Long-handed appliances to reach'),(53,0,3,'Health Assessment Questionnaire','Jar opener ( for jars previously opened )'),(54,0,3,'Health Assessment Questionnaire','Long-handed appliances in bathroom ( such as brush for washing yourself )'),(55,0,3,'Health Assessment Questionnaire','Other, specify'),(56,0,3,'Health Assessment Questionnaire','Hygiene'),(57,0,3,'Health Assessment Questionnaire','Gripping and opening things'),(58,0,3,'Health Assessment Questionnaire','Reach'),(59,0,3,'Health Assessment Questionnaire','Errands and chores'),(60,0,3,'Health Assessment Questionnaire','How much pain have you had because of your illness IN THE PAST WEEK( 0-No Pain   100-Severe Pain )'),(61,0,3,'Health Assessment Questionnaire','How much fatigue have you had IN THE PAST WEEK( 0-No Fatigue   100-Severe Fatigue )'),(62,0,4,'PGA','Considering all the ways your arthritis affects you, rate how well you are doing on the following scale');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;