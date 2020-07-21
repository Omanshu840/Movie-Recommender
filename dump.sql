-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: movierecommender
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `angry`
--

DROP TABLE IF EXISTS `angry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angry` (
  `mid` int(11) NOT NULL,
  `mname` varchar(40) DEFAULT NULL,
  `imglink` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angry`
--

LOCK TABLES `angry` WRITE;
/*!40000 ALTER TABLE `angry` DISABLE KEYS */;
INSERT INTO `angry` VALUES (1,'Skyfall','/static/images/angry/Skyfall.jpg'),(2,'John Wick 3 - Parabellum','/static/images/angry/JohnWick3.jpeg'),(3,'Dark Knight Rises','/static/images/angry/DarkKnight3.jpeg'),(4,'The Avengers End Game','/static/images/angry/AvengersEndGame.jpeg'),(5,'Tiger Jinda Hai','/static/images/angry/TigerZindaHai.jpg'),(6,'Tanhaji','/static/images/angry/Tanhaji.jpg'),(7,'Saw','/static/images/angry/Saw.jpeg'),(8,'Kill Bill: Volume1','/static/images/angry/KillBillVolume1.jpg'),(9,'Mad Max: Fury Road','/static/images/angry/MadMaxFuryRoad.jpg'),(10,'Chhapaak','/static/images/angry/Chappakk.png'),(11,'Taanashah','/static/images/angry/Taanashah.jpg'),(12,'6 Underground','/static/images/angry/6Underground.jpg'),(13,'Dredd','/static/images/angry/Dredd.jpeg');
/*!40000 ALTER TABLE `angry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `happy`
--

DROP TABLE IF EXISTS `happy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `happy` (
  `mid` int(11) NOT NULL,
  `mname` varchar(40) DEFAULT NULL,
  `imglink` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `happy`
--

LOCK TABLES `happy` WRITE;
/*!40000 ALTER TABLE `happy` DISABLE KEYS */;
INSERT INTO `happy` VALUES (1,'Drishyam','/static/images/happy/Drishyam.jpg'),(2,'Shutter Island','/static/images/happy/Shutterisland.jpg'),(3,'Wazir','/static/images/happy/wazir.jpg'),(4,'Parasite','/static/images/happy/Parasite.jpg'),(5,'Badla','/static/images/happy/Badla.jpeg'),(6,'The Perfection','/static/images/happy/the-perfection.jpeg'),(7,'The Sixth Sence','/static/images/happy/TheSixthSenseFolder.jpg'),(8,'Seven','/static/images/happy/se7en.jpg'),(9,'Psycho','/static/images/happy/Psycho.jpg'),(10,'Kahaani','/static/images/happy/kahani.jpg'),(11,'Special 26','/static/images/happy/special26.jpeg'),(12,'A wednesday','/static/images/happy/AWednesday.jpg'),(13,'Ghajini','/static/images/happy/Gajani.jpg');
/*!40000 ALTER TABLE `happy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neutral`
--

DROP TABLE IF EXISTS `neutral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neutral` (
  `mid` int(11) NOT NULL,
  `mname` varchar(40) DEFAULT NULL,
  `imglink` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neutral`
--

LOCK TABLES `neutral` WRITE;
/*!40000 ALTER TABLE `neutral` DISABLE KEYS */;
INSERT INTO `neutral` VALUES (1,'Bruce Almighty','/static/images/neutral/BruceAlmighty.jpg'),(2,'Forrest Gump','/static/images/neutral/ForrestGump.jpg'),(3,'Click','/static/images/neutral/Click.jpg'),(4,'Groundhog Day','/static/images/neutral/GroundHogDay.jpg'),(5,'The Bucket List','/static/images/neutral/TheBucketList.jpg'),(6,'Bhaag Milkha Bhaag','/static/images/neutral/BhaagMilkhaBhaag.jpg'),(7,'Chak De! India','/static/images/neutral/ChakDeIndia.jpg'),(8,'Lakshya','/static/images/neutral/Lakshya.jpg'),(9,'Wake Up Sid','/static/images/neutral/WakeUpSid.jpg'),(10,'Lagaan: Once Upon a Time in India','/static/images/neutral/Lagaan.jpg'),(11,'Udaan','/static/images/neutral/Udaan.jpg'),(12,'Airlift','/static/images/neutral/Airlift.jpg');
/*!40000 ALTER TABLE `neutral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `Rid` int(11) NOT NULL AUTO_INCREMENT,
  `ans` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sad`
--

DROP TABLE IF EXISTS `sad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sad` (
  `mid` int(11) NOT NULL,
  `mname` varchar(40) DEFAULT NULL,
  `imglink` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sad`
--

LOCK TABLES `sad` WRITE;
/*!40000 ALTER TABLE `sad` DISABLE KEYS */;
INSERT INTO `sad` VALUES (1,'This Is Spinal Tap','/static/images/sad/ThisIsSpinalTap.jpg'),(2,'Airplane!','/static/images/sad/Airplane!.jpg'),(3,'Dumb & Dumber','/static/images/sad/Dumb&DumbererTo.jpg'),(4,'Happy Feet Two','/static/images/sad/HappyFeetTwo.jpg'),(5,'Shaun Of The Dead','/static/images/sad/ShaunoftheDead.jpg'),(6,'The Great Dictator','/static/images/sad/TheGreatDictator.jpg'),(7,'City Lights','/static/images/sad/CityLights.jpg'),(8,'Dhamaal','/static/images/sad/Dhamaal.jpg'),(9,'Phir Hera Pheri','/static/images/sad/PhirHeraPheri.jpg'),(10,'Golmaal3','/static/images/sad/Golmaal3.jpg'),(11,'Housefull','/static/images/sad/Housefull.jpg'),(12,'De Dana Dan','/static/images/sad/DeDanaDan.jpg'),(13,'Chhichhore','/static/images/sad/Chichore.jpg');
/*!40000 ALTER TABLE `sad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-21 11:34:27
