CREATE DATABASE  IF NOT EXISTS `bruins_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bruins_project`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bruins_project
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `captain`
--

DROP TABLE IF EXISTS `captain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captain` (
  `CaptainID` int NOT NULL AUTO_INCREMENT,
  `PlayerID` int DEFAULT NULL,
  `PlayerName` varchar(100) DEFAULT NULL,
  `CaptainType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CaptainID`),
  KEY `PlayerID` (`PlayerID`),
  CONSTRAINT `captain_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `players` (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captain`
--

LOCK TABLES `captain` WRITE;
/*!40000 ALTER TABLE `captain` DISABLE KEYS */;
INSERT INTO `captain` VALUES (1,12,'Brad Marchand','Captain'),(2,21,'Charlie McAvoy','Alternate'),(3,15,'David Pastrnak','Alternate');
/*!40000 ALTER TABLE `captain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `CoachID` int NOT NULL AUTO_INCREMENT,
  `CoachName` varchar(100) NOT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Seasons` int DEFAULT NULL,
  PRIMARY KEY (`CoachID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Jim Montgomery','Head Coach',2),(2,'Joe Sacco','Assistant Coach',10),(3,'Chris Kelly','Assistant Coach',3),(4,'John McLean','Assistant Coach',2),(5,'Bob Essensa','Goalie Coach',21),(6,'Tom Ford','Skating and Skills',NULL),(7,'David Breen','Skating and Skills',2),(8,'Mathew Myers','Video Coordinator',NULL);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `GameNumber` int NOT NULL,
  `RosterNumber` int DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL,
  `Opponent` varchar(50) DEFAULT NULL,
  `HomeAway` tinyint DEFAULT NULL,
  `OpponentScore` int DEFAULT NULL,
  `BruinsScore` int DEFAULT NULL,
  `Result` tinyint DEFAULT NULL,
  `Regulation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GameNumber`),
  KEY `RosterNumber` (`RosterNumber`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`RosterNumber`) REFERENCES `roster` (`RosterNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,1,'Wed Oct 11','Blackhawks',1,1,3,1,'Regulation'),(2,2,'Sat Oct 14','Predators',1,2,3,1,'Regulation'),(3,1,'Thu Oct 19','Sharks',0,1,3,1,'Regulation'),(4,2,'Sat Oct 21','Kings',0,2,4,1,'Regulation'),(5,3,'Sun Oct 22','Ducks',0,1,3,1,'Regulation'),(6,3,'Tue Oct 24','Blackhawks',0,0,3,1,'Regulation'),(7,3,'Thu Oct 26','Ducks',1,4,3,0,'Overtime'),(8,3,'Sat Oct 28','Red Wings',1,1,4,1,'Regulation'),(9,1,'Mon Oct 30','Panthers',1,2,3,1,'Overtime'),(10,1,'Thu Nov 2','Maple Leafs',1,2,3,1,'Shootout'),(11,1,'Sat Nov 4','Red Wings',0,5,4,0,'Regulation'),(12,1,'Mon Nov 6','Stars',0,2,3,1,'Regulation'),(13,1,'Thu Nov 9','Islanders',1,2,5,1,'Regulation'),(14,1,'Sat Nov 11','Canadiens',0,3,2,0,'Overtime'),(15,2,'Tue Nov 14','Sabres',0,2,5,1,'Regulation'),(16,1,'Sat Nov 18','Canadiens',1,2,5,1,'Regulation'),(17,2,'Mon Nov 20','Lightning',0,5,4,0,'Overtime'),(18,2,'Wed Nov 22','Panthers',0,1,3,1,'Regulation'),(19,2,'Fri Nov 24','Red Wings',1,5,2,0,'Regulation'),(20,2,'Sat Nov 25','Rangers',0,7,4,0,'Regulation'),(21,2,'Mon Nov 27','Blue Jackets',0,5,2,0,'Regulation'),(22,3,'Thu Nov 30','Sharks',1,0,3,1,'Regulation'),(23,1,'Sat Dec 2','Maple Leafs',0,3,4,1,'Overtime'),(24,2,'Sun Dec 3','Blue Jackets',1,1,3,1,'Regulation'),(25,3,'Thu Dec 7','Sabres',1,3,1,0,'Regulation'),(26,1,'Sat Dec 9','Coyotes',1,3,5,1,'Regulation'),(27,3,'Wed Dec 13','Devils',0,2,1,0,'Overtime'),(28,1,'Fri Dec 15','Islanders',0,4,5,1,'Shootout'),(29,1,'Sat Dec 16','Rangers',1,2,1,0,'Overtime'),(30,2,'Tue Dec 19','Wild',1,4,3,0,'Overtime'),(31,3,'Fri Dec 22','Jets',0,5,1,0,'Regulation'),(32,1,'Sat Dec 23','Wild',0,3,2,0,'Regulation'),(33,2,'Wed Dec 27','Sabres',0,1,4,1,'Regulation'),(34,1,'Sat Dec 30','Devils',1,2,5,1,'Regulation'),(35,3,'Sun Dec 31','Red Wings',0,3,5,1,'Regulation'),(36,2,'Tue Jan 2','Blue Jackets',0,1,4,1,'Regulation'),(37,2,'Thu Jan 4','Penguins',1,6,5,0,'Regulation'),(38,3,'Sat Jan 6','Lightning',1,3,7,1,'Regulation'),(39,2,'Mon Jan 8','Avalanche',0,4,3,0,'Shootout'),(40,2,'Tue Jan 9','Coyotes',0,4,3,0,'Overtime'),(41,2,'Thu Jan 11','Golden Knights',0,2,1,0,'Overtime'),(42,3,'Sat Jan 13','Blues',0,3,4,1,'Overtime'),(43,1,'Mon Jan 15','Devils',1,0,3,1,'Regulation'),(44,1,'Thu Jan 18','Avalanche',1,2,5,1,'Regulation'),(45,3,'Sat Jan 20','Canadiens',1,4,9,1,'Regulation'),(46,1,'Mon Jan 22','Jets',1,1,4,1,'Regulation'),(47,2,'Wed Jan 24','Hurricanes',1,3,2,0,'Regulation'),(48,1,'Thu Jan 25','Senators',0,2,3,1,'Overtime'),(49,2,'Sat Jan 27','Fliers',0,2,6,1,'Regulation'),(50,3,'Tue Feb 6','Flames',1,1,1,0,'Regulation'),(51,1,'Thu Feb 8','Canucks',1,0,4,1,'Regulation'),(52,2,'Sat Feb 10','Capitals',1,3,0,0,'Regulation'),(53,2,'Tue Feb 13','Lightning',1,3,2,0,'Shootout'),(54,1,'Thu Feb 15','Kraken',1,4,1,0,'Regulation'),(55,2,'Sat Feb 17','Kings',1,5,4,0,'Overtime'),(56,3,'Mon Feb 19','Stars',1,3,4,1,'Shootout'),(57,1,'Wed Feb 21','Oilers',0,5,6,1,'Overtime'),(58,2,'Thu Feb 22','Flames',0,3,2,0,'Overtime'),(59,1,'Sat Feb 24','Kanucks',0,3,2,0,'Overtime'),(60,1,'Mon Feb 26','Kraken',0,4,3,0,'Shootout');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `PlayerID` int NOT NULL AUTO_INCREMENT,
  `PlayerName` varchar(100) NOT NULL,
  `JerseyNumber` int NOT NULL,
  `PositionID` varchar(5) NOT NULL,
  `Height` varchar(20) DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `Shoots` varchar(5) DEFAULT NULL,
  `Birthplace` varchar(100) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  UNIQUE KEY `JerseyNumber` (`JerseyNumber`),
  KEY `PositionID` (`PositionID`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`PositionID`) REFERENCES `positions` (`PositionID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Johnny Beecher',19,'F1','6\' 3\"',209,'L','Elmira, NY','2001-04-05'),(2,'Jesper Boqvist',70,'F1','6\' 1\"',184,'L','Falun, Sweden','1998-10-30'),(3,'Patrick Brown',38,'F1','6\' 1\"',218,'R','Bloomfield Hills, MI','1992-05-29'),(4,'Charlie Coyle',13,'F1','6\' 3\"',218,'R','Weymouth, MA','1992-03-02'),(5,'Trent Frederic',11,'F1','6\' 3\"',220,'L','Saint Louis, MO','1998-02-11'),(6,'Morgan Geekie',39,'F1','6\' 3\"',202,'R','Strathclair, CAN','1998-07-20'),(7,'Jakub Lauko',94,'F1','6\' 1\"',193,'L','Prague, Czechia','2000-03-28'),(8,'Matthew Poitras',51,'F1','5\' 11\"',180,'R','Brooklin, CAN','2004-03-10'),(9,'Pavel Zacha',18,'F1','6\' 4\"',207,'L','Brno, Czechia','1997-04-06'),(10,'Jake DeBrusk',74,'F2','6\' 1\"',198,'L','Edmonton, CAN','1996-10-17'),(11,'Danton Heinen',43,'F2','6\' 2\"',195,'L','Langley, CAN','1995-07-05'),(12,'Brad Marchand',63,'F2','5\' 9\"',176,'L','Halifax, CAN','1988-05-11'),(13,'James van Riemsdyk',21,'F2','6\' 3\"',208,'L','Middletown, NJ','1989-05-04'),(14,'Justin Brazeau',55,'F3','6\' 5\"',220,'R','New Liskeard, CAN','1998-02-02'),(15,'David Pastrnak',88,'F3','6\' 0\"',196,'L','Havirov, Czechia','1996-05-25'),(16,'Brandon Carlo',25,'D2','6\' 5\"',217,'R','Colorado Springs, CO','1996-11-26'),(17,'Derek Forbort',28,'D1','6\' 4\"',216,'L','Duluth, MN','1992-03-04'),(18,'Matt Grzelcyk',48,'D1','5\' 10\"',180,'L','Charlestown, MA','1994-05-01'),(19,'Hampus Lindholm',27,'D1','6\' 4\"',224,'L','Helsingborg, Sweden','1994-01-20'),(20,'Mason Lohrei',6,'D2','6\' 4\"',210,NULL,'Madison, WI','2001-01-17'),(21,'Charlie McAvoy',73,'D2','6\' 1\"',209,'R','Long Beach, NY','1997-12-21'),(22,'Ian Mitchell',14,'D2','5\' 11\"',193,'R','St. Albert, CAN','1999-01-18'),(23,'Kevin Shattenkirk',12,'D2','6\' 0\"',203,'R','New Rochelle, NY','1989-01-29'),(24,'Parker Wotherspoon',29,'D1','6\' 1\"',195,'L','Surrey, CAN','1997-08-24'),(25,'Jeremy Swayman',1,'G1','6\' 3\"',195,'L','Anchorage, AK','1998-11-24'),(26,'Linus Ullmark',35,'G1','6\' 4\"',213,'L','Lugnvik, Sweden','1993-07-31');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `PositionID` varchar(2) NOT NULL,
  `PositionName` varchar(50) NOT NULL,
  PRIMARY KEY (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES ('D1','Left Defence'),('D2','Right Defence'),('F1','Center'),('F2','Left Wing'),('F3','Right Wing'),('G1','Goalie');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roster`
--

DROP TABLE IF EXISTS `roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roster` (
  `RosterNumber` int NOT NULL,
  `Forward1` int DEFAULT NULL,
  `Forward2` int DEFAULT NULL,
  `Forward3` int DEFAULT NULL,
  `Forward4` int DEFAULT NULL,
  `Forward5` int DEFAULT NULL,
  `Forward6` int DEFAULT NULL,
  `Forward7` int DEFAULT NULL,
  `Forward8` int DEFAULT NULL,
  `Forward9` int DEFAULT NULL,
  `Forward10` int DEFAULT NULL,
  `Forward11` int DEFAULT NULL,
  `Forward12` int DEFAULT NULL,
  `Defense1` int DEFAULT NULL,
  `Defense2` int DEFAULT NULL,
  `Defense3` int DEFAULT NULL,
  `Defense4` int DEFAULT NULL,
  `Defense5` int DEFAULT NULL,
  `Defense6` int DEFAULT NULL,
  `Goalie1` int DEFAULT NULL,
  `Goalie2` int DEFAULT NULL,
  `HeadCoach` int DEFAULT NULL,
  `AssistantCoach1` int DEFAULT NULL,
  `AssistantCoach2` int DEFAULT NULL,
  PRIMARY KEY (`RosterNumber`),
  KEY `Forward1` (`Forward1`),
  KEY `Forward2` (`Forward2`),
  KEY `Forward3` (`Forward3`),
  KEY `Forward4` (`Forward4`),
  KEY `Forward5` (`Forward5`),
  KEY `Forward6` (`Forward6`),
  KEY `Forward7` (`Forward7`),
  KEY `Forward8` (`Forward8`),
  KEY `Forward9` (`Forward9`),
  KEY `Forward10` (`Forward10`),
  KEY `Forward11` (`Forward11`),
  KEY `Forward12` (`Forward12`),
  KEY `Defense1` (`Defense1`),
  KEY `Defense2` (`Defense2`),
  KEY `Defense3` (`Defense3`),
  KEY `Defense4` (`Defense4`),
  KEY `Defense5` (`Defense5`),
  KEY `Defense6` (`Defense6`),
  KEY `Goalie1` (`Goalie1`),
  KEY `Goalie2` (`Goalie2`),
  KEY `HeadCoach` (`HeadCoach`),
  KEY `AssistantCoach1` (`AssistantCoach1`),
  KEY `AssistantCoach2` (`AssistantCoach2`),
  CONSTRAINT `roster_ibfk_1` FOREIGN KEY (`Forward1`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_10` FOREIGN KEY (`Forward10`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_11` FOREIGN KEY (`Forward11`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_12` FOREIGN KEY (`Forward12`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_13` FOREIGN KEY (`Defense1`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_14` FOREIGN KEY (`Defense2`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_15` FOREIGN KEY (`Defense3`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_16` FOREIGN KEY (`Defense4`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_17` FOREIGN KEY (`Defense5`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_18` FOREIGN KEY (`Defense6`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_19` FOREIGN KEY (`Goalie1`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_2` FOREIGN KEY (`Forward2`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_20` FOREIGN KEY (`Goalie2`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_21` FOREIGN KEY (`HeadCoach`) REFERENCES `coach` (`CoachID`),
  CONSTRAINT `roster_ibfk_22` FOREIGN KEY (`AssistantCoach1`) REFERENCES `coach` (`CoachID`),
  CONSTRAINT `roster_ibfk_23` FOREIGN KEY (`AssistantCoach2`) REFERENCES `coach` (`CoachID`),
  CONSTRAINT `roster_ibfk_3` FOREIGN KEY (`Forward3`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_4` FOREIGN KEY (`Forward4`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_5` FOREIGN KEY (`Forward5`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_6` FOREIGN KEY (`Forward6`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_7` FOREIGN KEY (`Forward7`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_8` FOREIGN KEY (`Forward8`) REFERENCES `players` (`PlayerID`),
  CONSTRAINT `roster_ibfk_9` FOREIGN KEY (`Forward9`) REFERENCES `players` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roster`
--

LOCK TABLES `roster` WRITE;
/*!40000 ALTER TABLE `roster` DISABLE KEYS */;
INSERT INTO `roster` VALUES (1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,25,26,1,2,3),(2,5,4,3,2,1,10,11,15,17,9,21,14,18,19,20,22,23,24,25,26,1,3,4),(3,5,4,3,2,1,10,11,15,17,9,21,14,18,19,20,22,23,24,26,25,1,3,4);
/*!40000 ALTER TABLE `roster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasongoaliestats`
--

DROP TABLE IF EXISTS `seasongoaliestats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasongoaliestats` (
  `PlayerID` int NOT NULL,
  `PlayerName` varchar(100) NOT NULL,
  `GamesPlayed` int DEFAULT NULL,
  `GamesStarted` int DEFAULT NULL,
  `TimeOnIcePerGame` time DEFAULT NULL,
  `Wins` int DEFAULT NULL,
  `Loss` int DEFAULT NULL,
  `T` int DEFAULT NULL,
  `OverTimeLoss` int DEFAULT NULL,
  `GoalsAgainst` int DEFAULT NULL,
  `GoalsAgainstPerGame` decimal(5,2) DEFAULT NULL,
  `ShotsAgainst` int DEFAULT NULL,
  `Saves` int DEFAULT NULL,
  `SavePercentage` decimal(5,3) DEFAULT NULL,
  `Shutouts` int DEFAULT NULL,
  PRIMARY KEY (`PlayerID`,`PlayerName`),
  CONSTRAINT `seasongoaliestats_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `players` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasongoaliestats`
--

LOCK TABLES `seasongoaliestats` WRITE;
/*!40000 ALTER TABLE `seasongoaliestats` DISABLE KEYS */;
INSERT INTO `seasongoaliestats` VALUES (25,'Jeremy Swayman',34,33,'57:49:00',18,6,0,8,83,2.53,1026,943,0.919,3),(26,'Linus Ullmark',29,28,'60:00:00',16,6,0,6,79,2.72,895,817,0.913,1);
/*!40000 ALTER TABLE `seasongoaliestats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasonplayerstats`
--

DROP TABLE IF EXISTS `seasonplayerstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasonplayerstats` (
  `PlayerID` int NOT NULL,
  `PlayerName` varchar(100) NOT NULL,
  `GamesPlayed` int DEFAULT NULL,
  `Goals` int DEFAULT NULL,
  `Assists` int DEFAULT NULL,
  `Points` int DEFAULT NULL,
  `PlusMinus` int DEFAULT NULL,
  `PenaltyMin` int DEFAULT NULL,
  `Shots` int DEFAULT NULL,
  `ShootingPercentage` decimal(5,2) DEFAULT NULL,
  `PowerPlayGoals` int DEFAULT NULL,
  `PowerPlayAssists` int DEFAULT NULL,
  `ShortHandedGoals` int DEFAULT NULL,
  `ShortHandedAssists` int DEFAULT NULL,
  `GameWinningGoals` int DEFAULT NULL,
  `TimeOnIcePerGame` int DEFAULT NULL,
  `Production` int DEFAULT NULL,
  PRIMARY KEY (`PlayerID`,`PlayerName`),
  CONSTRAINT `seasonplayerstats_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `players` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasonplayerstats`
--

LOCK TABLES `seasonplayerstats` WRITE;
/*!40000 ALTER TABLE `seasonplayerstats` DISABLE KEYS */;
INSERT INTO `seasonplayerstats` VALUES (1,'Johnny Beecher',39,5,2,7,-6,15,0,18.50,0,0,0,0,1,10,58),(2,'Jesper Boqvist',26,4,6,10,10,4,0,12.50,0,0,0,0,0,11,28),(3,'Patrick Brown',11,0,1,1,-3,2,0,0.00,0,0,0,0,0,9,97),(4,'Charlie Coyle',61,21,29,50,6,28,2,17.60,5,4,0,3,4,18,22),(5,'Trent Frederic',61,16,19,35,13,50,0,17.20,1,0,0,0,0,14,24),(6,'Morgan Geekie',55,13,17,30,7,20,0,14.00,3,5,0,0,0,15,28),(7,'Jakub Lauko',42,2,6,8,-4,28,0,6.50,0,0,0,0,0,9,50),(8,'Matthew Poitras',33,5,10,15,4,6,0,12.50,0,1,0,0,1,13,29),(9,'Pavel Zacha',57,12,24,36,8,16,0,11.00,3,7,0,0,3,18,29),(10,'Jake DeBrusk',59,13,14,27,11,12,1,9.80,2,5,2,0,2,17,37),(11,'Danton Heinen',53,11,11,22,7,22,0,12.20,1,0,1,0,3,14,34),(12,'Brad Marchand',61,26,27,53,5,62,0,15.80,7,15,2,0,6,19,22),(13,'James van Riemsdyk',57,11,26,37,9,14,0,8.70,6,6,0,0,3,13,21),(14,'Justin Brazeau',5,1,1,2,2,2,0,12.50,0,0,0,0,0,10,27),(15,'David Pastrnak',61,38,49,87,21,45,1,12.70,11,20,0,0,4,20,14),(16,'Brandon Carlo',56,3,10,13,22,34,0,5.20,0,0,0,0,1,20,87),(17,'Derek Forbort',34,0,4,4,8,17,0,0.00,0,0,0,0,0,17,151),(18,'Matt Grzelcyk',46,2,6,8,5,33,0,4.00,0,0,0,0,0,17,100),(19,'Hampus Lindholm',56,1,18,19,19,52,0,1.40,1,4,0,0,0,24,70),(20,'Mason Lohrei',32,4,6,10,0,14,0,10.30,1,1,0,0,1,17,54),(21,'Charlie McAvoy',53,9,32,41,10,71,0,8.70,1,12,0,0,3,25,32),(22,'Ian Mitchell',13,0,2,2,6,10,0,0.00,0,0,0,0,0,15,100),(23,'Kevin Shattenkirk',48,5,12,17,-3,12,0,7.90,2,6,0,0,0,16,44),(24,'Parker Wotherspoon',28,0,5,5,2,18,0,0.00,0,0,0,0,0,18,100);
/*!40000 ALTER TABLE `seasonplayerstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `TeamID` int NOT NULL AUTO_INCREMENT,
  `TeamName` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Conference` varchar(50) DEFAULT NULL,
  `HomeVenueID` int DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `HomeVenue` (`HomeVenueID`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`HomeVenueID`) REFERENCES `venue` (`VenueID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Bruins','Boston','Atlantic',1),(2,'Ducks','Anaheim','Pacific',2),(3,'Coyotes','Arizona','Central',3),(4,'Sabres','Buffalo','Atlantic',4),(5,'Flames','Calgary','Pacific',5),(6,'Hurricanes','Carolina','Metropolitan',6),(7,'Blackhawks','Chicago','Central',7),(8,'Avalanche','Colorado','Central',8),(9,'Blue Jackets','Columbus','Metropolitan',9),(10,'Stars','Dallas','Central',10),(11,'Red Wings','Detroit','Atlantic',11),(12,'Oilers','Edmonton','Pacific',12),(13,'Panthers','Florida','Atlantic',13),(14,'Kings','Los Angeles','Pacific',14),(15,'Wild','Minnesota','Central',15),(16,'Canadiens','Montreal','Atlantic',16),(17,'Predators','Nashville','Central',17),(18,'Devils','New Jersey','Metropolitan',18),(19,'Rangers','New York','Metropolitan',19),(20,'Islanders','New York','Metropolitan',20),(21,'Senators','Ottowa','Atlantic',21),(22,'Flyers','Philadelphia','Metropolitan',22),(23,'Penguins','Pittsburgh','Metropolitan',23),(24,'Sharks','San Jose','Pacific',24),(25,'Kraken','Seattle','Pacific',25),(26,'Blues','St Louis','Central',26),(27,'Lightning','Tampa Bay','Atlantic',27),(28,'Maple Leafs','Toronto','Atlantic',28),(29,'Canucks','Vancouver','Pacific',29),(30,'Golden Knights','Vegas','Pacific',30),(31,'Capitals','Washington','Metropolitan',31),(32,'Jets','Winnipeg','Central',32);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamstats`
--

DROP TABLE IF EXISTS `teamstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teamstats` (
  `TeamID` int DEFAULT NULL,
  `TeamName` varchar(100) DEFAULT NULL,
  `GamesPlayed` int DEFAULT NULL,
  `Num_of_Wins` int DEFAULT NULL,
  `Num_of_Losses` int DEFAULT NULL,
  `OverTimeLosses` int DEFAULT NULL,
  `Points` int DEFAULT NULL,
  `RegulationWins` int DEFAULT NULL,
  `Regulation_and_Overtime_Wins` int DEFAULT NULL,
  `ShootoutWins` int DEFAULT NULL,
  `ShootoutLosses` int DEFAULT NULL,
  `HomeWinPercentage` float DEFAULT NULL,
  `AwayWinPercentage` float DEFAULT NULL,
  `GoalsFor` int DEFAULT NULL,
  `GoalsAgainst` int DEFAULT NULL,
  `GoalDifferential` int DEFAULT NULL,
  `Last10gamesPercentage` float DEFAULT NULL,
  KEY `TeamID` (`TeamID`),
  CONSTRAINT `teamstats_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamstats`
--

LOCK TABLES `teamstats` WRITE;
/*!40000 ALTER TABLE `teamstats` DISABLE KEYS */;
INSERT INTO `teamstats` VALUES (1,'Bruins',60,34,12,14,82,26,31,3,3,0.6,0.533,202,165,37,0.3),(2,'Ducks',58,20,35,3,43,14,19,1,1,0.276,0.414,151,207,-56,0.4),(3,'Coyotes',58,23,30,5,51,18,21,2,0,0.517,0.276,168,192,-24,0),(4,'Sabres',59,27,28,4,58,23,26,1,1,0.433,0.483,171,178,-7,0.5),(5,'Flames',59,29,25,5,63,24,29,0,4,0.517,0.467,185,184,1,0.7),(6,'Hurricanes',59,35,18,6,76,29,34,1,4,0.633,0.552,194,165,29,0.7),(7,'Blackhawks',59,15,39,5,35,10,14,1,1,0.367,0.138,123,208,-85,0.1),(8,'Avalanche',60,36,19,5,77,32,34,2,1,0.793,0.419,221,189,32,0.4),(9,'Blue Jackets',57,19,28,10,48,14,17,2,1,0.385,0.321,170,210,-40,0.4),(10,'Stars',61,35,17,9,79,26,33,2,2,0.586,0.563,218,187,31,0.4),(11,'Red Wings',59,33,20,6,72,23,31,2,0,0.581,0.536,213,186,27,0.7),(12,'Oilers',56,34,20,2,70,28,32,2,0,0.643,0.571,201,168,33,0.5),(13,'Panthers',59,39,16,4,82,32,38,1,1,0.655,0.667,194,142,52,0.8),(14,'Kings',58,29,19,10,68,25,27,2,5,0.407,0.581,178,160,18,0.6),(15,'Wild',59,28,25,6,62,22,25,3,2,0.467,0.483,188,196,-8,0.7),(16,'Canadiens',59,23,28,8,54,14,19,4,4,0.387,0.393,167,211,-44,0.3),(17,'Predators',60,33,25,2,68,26,31,2,0,0.5,0.6,188,188,0,0.7),(18,'Devils',59,30,25,4,64,25,30,0,1,0.452,0.571,198,205,-7,0.5),(19,'Rangers',59,39,17,3,81,31,38,1,2,0.741,0.594,197,163,34,0.9),(20,'Islanders',58,24,20,14,62,16,23,1,4,0.433,0.393,170,197,-27,0.4),(21,'Senators',57,25,29,3,53,19,23,2,0,0.531,0.32,190,203,-13,0.5),(22,'Flyers',60,31,22,7,69,23,27,4,2,0.5,0.533,183,177,6,0.6),(23,'Penguins',56,27,21,8,62,22,25,2,2,0.517,0.444,170,154,16,0.5),(24,'Sharks',57,15,37,5,35,11,14,1,4,0.321,0.207,120,222,-102,0.3),(25,'Kraken',58,25,22,11,61,19,22,3,4,0.464,0.4,163,169,-6,0.5),(26,'Blues',58,30,26,2,62,23,28,2,1,0.586,0.448,169,182,-13,0.4),(27,'Lightning',61,32,24,5,69,26,30,2,0,0.621,0.438,208,207,1,0.5),(28,'Maple Leafs',58,33,17,8,74,23,29,4,1,0.536,0.6,216,185,31,0.8),(29,'Canucks',61,38,16,7,83,33,38,0,2,0.714,0.545,221,170,51,0.4),(30,'Golden Knights',59,33,19,7,73,26,29,4,2,0.633,0.483,192,167,25,0.4),(31,'Capitals',58,27,22,9,63,21,24,3,4,0.517,0.414,153,186,-33,0.5),(32,'Jets',57,37,15,5,79,32,37,0,1,0.7,0.593,176,135,41,0.7);
/*!40000 ALTER TABLE `teamstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `VenueID` int NOT NULL AUTO_INCREMENT,
  `VenueName` varchar(100) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VenueID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'TD Garden',17565,'Boston','Massachusetts','USA'),(2,'Honda Center',17174,'Anaheim','California','USA'),(3,'Mullett Arena',4600,'Tempe','Arizona','USA'),(4,'KayBank Center',19070,'Buffalo','New York','USA'),(5,'Scotiabank Saddledome',19289,'Calgary','Alberta','CAN'),(6,'PNC Arena',18700,'Raleigh','North Carolina','USA'),(7,'United Center',19717,'Chicago','Illinois','USA'),(8,'Ball Arena',17809,'Denver','Colorado','USA'),(9,'Nationwide Arena',18144,'Columbus','Ohio','USA'),(10,'America Airlines Center',18532,'Dallas','Texas','USA'),(11,'Little Ceasars Arena',19515,'Detroit','Michigan','USA'),(12,'Rogers Place',18347,'Edmonton','Alberta','CAN'),(13,'Amerant Bank Arena',19250,'Sunrise','Florida','USA'),(14,'Crypto.com Arena',18230,'Los Angeles','California','USA'),(15,'Xcel Energy Center',17954,'Saint Paul','Minnesota','USA'),(16,'Bell Centre',21105,'Montreal','Quebec','CAN'),(17,'Bridgestone Arena',17159,'Nashville','Tennessee','USA'),(18,'Prudential Center',16514,'Newark','New Jersey','USA'),(19,'UBS Arena',17255,'Elmont','New York','USA'),(20,'Madison Square Garden',18006,'New York City','New York','USA'),(21,'Canadian Tire Centre',19347,'Ottawa','Ontario','CAN'),(22,'Wells Fargo Center',19538,'Philadelphia','Pennsylvania','USA'),(23,'PPG Paints Arena',18387,'Pittsburgh','Pennsylvania','USA'),(24,'SAP Center',17562,'San Jose','California','USA'),(25,'Climate Pledge Arena',17151,'Seattle','Washington','USA'),(26,'Enterprise Center',18096,'St. Louis','Missouri','USA'),(27,'Amalie Arena',19092,'Tampa','Florida','USA'),(28,'Scotiabank Arena',18800,'Toronto','Ontario','CAN'),(29,'Rogers Arena',18910,'Vancouver','British Columbia','CAN'),(30,'T-Mobile Arena',17367,'Paradise','Nevada','USA'),(31,'Capital One Arena',18573,'Washington D.C.','Washington D.C.','USA'),(32,'Canada Life Centre',15321,'Winnipeg','Manitoba','CAN');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09 18:03:07

SET SQL_SAFE_UPDATES = 0;



-- Adding a procedure to retrieve top players

DELIMITER $$
CREATE PROCEDURE GetTopPlayers(IN top_n INT)
BEGIN
    SELECT PlayerID, PlayerName, Goals
    FROM players
    ORDER BY Goals DESC
    LIMIT top_n;
END $$
DELIMITER ;


-- Adding a trigger to audit player stats updates

DELIMITER $$
CREATE TRIGGER PlayerStatsUpdate
AFTER UPDATE ON player_stats
FOR EACH ROW
BEGIN
    INSERT INTO player_stats_audit (PlayerID, OldGoals, NewGoals, UpdateTime)
    VALUES (OLD.PlayerID, OLD.Goals, NEW.Goals, NOW());
END $$
DELIMITER ;


-- Adding a join query for player performance analysis

-- Query to find the performance of players based on their captaincy role
SELECT p.PlayerName, c.CaptainType, ps.Goals, ps.Assists
FROM players p
JOIN captain c ON p.PlayerID = c.PlayerID
JOIN seasonplayerstats ps ON p.PlayerID = ps.PlayerID
WHERE ps.Goals > 10;


-- Query 1: Update goals in the captain's table (example of an UPDATE statement)
UPDATE captain
SET CaptainType = 'Alternate'
WHERE PlayerName = 'Brad Marchand';

-- Query 2: Join captain and players table to list captain details with team affiliation
SELECT c.CaptainID, p.PlayerName, c.CaptainType
FROM captain c
JOIN players p ON c.PlayerID = p.PlayerID;

-- Query 3: Stored Procedure to fetch details of games against a specific opponent
DELIMITER //
CREATE PROCEDURE GetGamesByOpponent(IN OpponentName VARCHAR(50))
BEGIN
    SELECT * FROM games WHERE Opponent = OpponentName;
END //
DELIMITER ;

-- Query 4: Trigger to automatically update team statistics after a game result is updated
DELIMITER //
CREATE TRIGGER UpdateTeamStats AFTER UPDATE ON games
FOR EACH ROW
BEGIN
    IF NEW.Result <> OLD.Result THEN
        UPDATE teams
        SET Wins = Wins + (NEW.Result = 'Win') - (OLD.Result = 'Win'),
            Losses = Losses + (NEW.Result = 'Loss') - (OLD.Result = 'Loss')
        WHERE TeamName = 'Boston Bruins';
    END IF;
END //
DELIMITER ;

-- Query 5: Aggregate query to count games played at home vs away
SELECT HomeAway, COUNT(*) AS GamesCount
FROM games
GROUP BY HomeAway;

-- Query 6: Insert a new coach entry
INSERT INTO coach (CoachName, Position, Seasons)
VALUES ('Mark Smith', 'Special Teams Coach', 5);

-- Query 7: Delete games where Bruins lost by more than 5 points
DELETE FROM games
WHERE OpponentScore - BruinsScore > 5 AND Result = 1;

-- Query 8: Stored Procedure to list all captains of a specific type
DELIMITER //
CREATE PROCEDURE GetCaptainsByType(IN CaptainTypeName VARCHAR(20))
BEGIN
    SELECT * FROM captain WHERE CaptainType = CaptainTypeName;
END //
DELIMITER ;

-- Query 9: Trigger to cascade delete players when a team is removed
DELIMITER //
CREATE TRIGGER CascadeDeletePlayers BEFORE DELETE ON teams
FOR EACH ROW
BEGIN
    DELETE FROM players WHERE TeamID = OLD.TeamID;
END //
DELIMITER ;

-- Query 10: Conditional update to mark games with high scores
UPDATE games
SET Regulation = 'High Scoring'
WHERE BruinsScore > 5 AND OpponentScore > 5;

-- Query 11: Subquery to fetch the best captain based on performance (hypothetical)
SELECT PlayerID, PlayerName, PositionID
FROM Players
WHERE PlayerID=(
    SELECT PlayerID 
    FROM captain
    where PlayerID < 13
    );


-- Query 12: Join games and coach table to see coaches in charge during each game
SELECT g.GameNumber, g.Date, c.CoachName, c.Position
FROM games g
JOIN coach c ON g.RosterNumber = c.CoachID
WHERE g.Result = 'Win';
