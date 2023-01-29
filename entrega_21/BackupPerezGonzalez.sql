
use vuelos_comerciales;
-- --------------------------------------------------------------------------------------------------
-- Las tablas agregadas a este Backup son "avion, pasaje, vuelo, ruta, pasajero, piloto"
-- --------------------------------------------------------------------------------------------------



-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: vuelos_comerciales
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES (1,58,'Airbus320',1980),(2,54,'Boeing747',2007),(3,50,'Airbus340',2000),(4,76,'Boeing747-F-Freighter',1987),(5,84,'Airbus300-600ST',2007),(6,100,'Boeing737',2000),(7,87,'Boeing747-400ERF',1985),(8,70,'Airbus319',2014),(9,73,'Boeing747-F-Freighter',2022),(10,65,'Boeing777-200',1985),(11,83,'Boeing747-400ERF',1999),(12,62,'Airbus319',1984),(13,60,'Boeing747',2003),(14,50,'Boeing747-F-Freighter',1980),(15,84,'Boeing737',2002),(16,74,'Airbus321',1996),(17,87,'Airbus319',2018),(18,74,'Airbus320',1991),(19,68,'Airbus321',2011),(20,96,'Boeing747',1995);
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pasaje`
--

LOCK TABLES `pasaje` WRITE;
/*!40000 ALTER TABLE `pasaje` DISABLE KEYS */;
INSERT INTO `pasaje` VALUES (1,15,14,6),(2,20,2,5),(3,15,11,3),(4,34,19,6),(5,44,20,9),(6,30,20,6),(7,29,4,1),(8,20,5,9),(9,42,17,3),(10,11,10,9);
/*!40000 ALTER TABLE `pasaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pasajero`
--

LOCK TABLES `pasajero` WRITE;
/*!40000 ALTER TABLE `pasajero` DISABLE KEYS */;
INSERT INTO `pasajero` VALUES (1,'Chrissie','Burmaster','29842 Schmedeman Crossing'),(2,'Alister','Beazer','13 Harper Lane'),(3,'Osbourne','Fernao','20 Debs Street'),(4,'Francklin','Urien','2 Westridge Park'),(5,'Beret','Anderson','5744 Badeau Hill'),(6,'Zechariah','Keener','0206 Tennyson Park'),(7,'Derrik','Fynes','58355 Kim Center'),(8,'Lettie','Ord','9759 Westerfield Parkway'),(9,'Ediva','Twiggs','10459 American Ash Avenue'),(10,'Albertine','Pulster','4 Continental Drive'),(11,'Karilynn','Wibberley','5 Dunning Crossing'),(12,'Ketti','Hinrichsen','28 Sutherland Crossing'),(13,'Giacopo','Szymanek','34 Cambridge Junction'),(14,'Richard','Feehan','80683 Forest Dale Parkway'),(15,'Liuka','Refford','0824 Hanson Crossing'),(16,'Cher','Haylett','1087 Hermina Lane'),(17,'Niki','Pescud','271 Bunker Hill Hill'),(18,'Keith','Tooley','8 Sycamore Terrace'),(19,'Elia','Guynemer','827 Lotheville Center'),(20,'Millard','Dollard','62 Bonner Drive');
/*!40000 ALTER TABLE `pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` VALUES (1,'Odille','MacCafferky',25),(2,'Verney','Hug',27),(3,'Janeta','Matzl',14),(4,'Cammi','Dyzart',24),(5,'Florance','Beeson',19),(6,'Virgie','Lenoir',17),(7,'Richardo','Prantoni',21),(8,'Delcine','Siflet',16),(9,'Brit','Klossmann',30),(10,'Cookie','Filpo',10),(11,'Mellisa','Gatfield',3),(12,'Tanya','Iacovini',24),(13,'Jennie','McCaskill',3),(14,'Reinold','Bilsborrow',2),(15,'Gaylor','Stuther',10),(16,'Jonell','Gabbett',9),(17,'Richy','Shannon',17),(18,'Dorotea','Coneybeare',28),(19,'Karlis','Howgill',21),(20,'Kirbie','Duffin',18);
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1,'Zhoupu','Lampari',9875.800),(2,'Guarumal','Spokoynaya',7812.260),(3,'Nyrob','Pangligaran',9133.270),(4,'Devon','Duzhenwan',5406.980),(5,'Centro Habana','Puzi',6329.290),(6,'Szczerbice','Comapa',7556.250),(7,'Santo Amaro','Kota Bharu',4636.070),(8,'Moluo','Kuala Lumpur',7137.680),(9,'Pasinan Barat','Fonte da Aldeia',5675.820),(10,'Ipoh','Chutove',5921.370),(11,'Akita Shi','Hengshi',3405.240),(12,'El Corpus','Olonets',1035.130),(13,'Aguas Verdes','Stegna',5758.580),(14,'Criuleni','Karangnongko',7227.190),(15,'Asker','Ninghai',5822.490),(16,'Maddarulug Norte','Malaga',2259.940),(17,'Jingdu','Dicamay',4683.810),(18,'Huifa','Sarrazola',4845.760),(19,'Shenavan','Laylay',5748.840),(20,'Fubin','Nanmu',1012.160),(21,'Des Moines','Oenam',2490.700),(22,'Bruxelles','Vishow',6378.810),(23,'Luzern','Kuloy',4047.490),(24,'Lexington','Roriz',1904.800),(25,'Papeete','Boulaouane',8276.850),(26,'Annecy','Rettikhovka',1666.910),(27,'Xiongshan','Palca',2348.730),(28,'Lexington','Cheongpyeong',8233.800),(29,'Orichi','Franca',3743.960),(30,'Graksop','Armen',8968.890),(31,'Yeysk','Laoxialu',8192.310),(32,'Shibukawa','Arosbaya',3480.920);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (1,'15:06',20,1,16,'2023-01-01'),(2,'19:09',6,2,12,'2023-01-02'),(3,'12:39',9,3,11,'2023-01-03'),(4,'11:58',5,4,6,'2023-01-07'),(5,'13:22',15,8,1,'2023-01-08'),(6,'20:25',6,9,12,'2023-01-09'),(7,'17:48',3,10,7,'2023-01-10'),(8,'13:48',9,11,11,'2023-01-11'),(9,'13:02',18,12,7,'2023-01-12'),(10,'12:10',16,15,8,'2023-01-30');
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-23 21:08:52
