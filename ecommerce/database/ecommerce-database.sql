-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `email` varchar(50) NOT NULL,
  `pid` varchar(20) NOT NULL,
  `orderdate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES ('kdic11493@gmail.com','jeans3','Fri Jul 20 20:25:07 PDT 2018');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` varchar(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `price` varchar(10) NOT NULL,
  `detail` varchar(350) DEFAULT NULL,
  `src` varchar(100) DEFAULT NULL,
  `status` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('hometheatre1','Philips SPA3000U/94(HeartBeat) 5.1 Home Cinema  (Audio)','electronics-hometheatre','3890','Home Cinema System@5 Speakers@1 Subwoofers@Inbuilt Digital Amplifier@Audio','Image/electronics/hometheatre/hometheatre1.jpeg','1'),('hometheatre2','Oshaan L23 (4.1BT) 4.1 Home Cinema  (Multimedia Home Theatre System)','electronics-hometheatre','3899','Home Cinema System@4 Speakers@1 Subwoofers@MP3, WMA,WAV, APE','Image/electronics/hometheatre/hometheatre2.jpeg','1'),('hometheatre3','Oshaan S14 4.1 BT 4.1 Home Cinema  (Multimedia Home Theatre System)','electronics-hometheatre','2199','Home Cinema System@4 Speakers@1 Subwoofers@MP3, WMA,WAV, APE','Image/electronics/hometheatre/hometheatre3.jpeg','1'),('hometheatre4','TECNIA Hexawave 5001Bluetooth 5.1 Home Cinema  (USB, FM RADIO)','electronics-hometheatre','2999','Home Cinema System@5 Speakers@1 Subwoofers@Inbuilt Digital Amplifier@MP3','Image/electronics/hometheatre/hometheatre4.jpeg','1'),('hometheatre5','Truvison SE-7777 Multimedia System USB FM AUX MMC Playback Support Bluetooth Feature Superior Sound Clarity 5.1 Home Cinema  (MP3 Player / MP4 Player)','electronics-hometheatre','9119','Home Cinema System@5 Speakers@1 Subwoofers@MP3 / MP4','Image/electronics/hometheatre/hometheatre5.jpeg','1'),('jacket1','U.S. Polo Assn Full Sleeve Solid Men\'s Jacket','men-jacket','3374','Pattern: Solid@Suitable For: Western Wear@Type: Bodycon Jacket','Image/men/jacket/jacket1.jpeg','1'),('jacket2','T-Base Full Sleeve Solid Men\'s Jacket','men-jacket','4599','Pattern: Solid@Suitable For: Western Wear@Type: Bomber Jacket','Image/men/jacket/jacket2.jpeg','1'),('jeans1','Levis Slim Men Jeans','men-jeans','2,007','Fit: Jackson Fit@Fabric: Cotton@Light Fade Mid Rise Jeans@Clean Look','Image/men/jeans/jeans1.jpeg','1'),('jeans2','Flying Machine Skinny Mens Blue Jeans','men-jeans','1549','Fit: Jackson Fit@Fabric: Cotton@Light Fade Mid Rise Jeans@Clean Look','Image/men/jeans/jeans2.jpeg','1'),('jeans3','Pepe Jeans Slim Men\'s Blue Jeans','men-jeans','1899','Fit: Jackson Fit@Fabric: Cotton@Light Fade Mid Rise Jeans@Clean Look','Image/men/jeans/jeans3.jpeg','1'),('laptop1','HP Notebook Core i3 7th Gen - (4 GB/1 TB HDD/Windows 10) 15-BS662TU Laptop','electronics-laptop','29990','Intel Core i3 Processor (7th Gen)@4 GB DDR4 RAM@64 bit Windows 10 Operating System@1 TB HDD@15.6 inch Display','Image/electronics/laptop/laptop1.jpeg','1'),('laptop2','HP 15 Core i3 6th Gen - (4 GB/1 TB HDD/DOS) 15-BS542TU Laptop','electronics-laptop','29990','Intel Core i3 Processor (7th Gen)@4 GB DDR4 RAM@64 bit Windows 10 Operating System@1 TB HDD@15.6 inch Display@1 year warranty','Image/electronics/laptop/laptop2.jpeg','1'),('laptop3','Lenovo Ideapad Core i3 6th Gen - (4 GB/1 TB HDD/DOS) IP 320E Laptop','electronics-laptop','25490','Intel Core i3 Processor (6th Gen)@4 GB DDR4 RAM@DOS Operating System@1 TB HDD@15.6 inch Display','Image/electronics/laptop/laptop3.jpeg','1'),('laptop4','Dell Inspiron 14 3000 Core i3 6th Gen - (4 GB/1 TB HDD/Windows 10 Home) 3467 Laptop','electronics-laptop','27990','Latest Laptop without Optical Disk Drive@Intel Core i3 Processor (6th Gen)@4 GB DDR4 RAM@64 bit Windows 10 Operating System@1 TB HDD@14 inch Display','Image/electronics/laptop/laptop4.jpeg','1'),('laptop5','HP 15 Core i3 6th Gen - (4 GB/1 TB HDD/Windows 10 Home) 15Q-bu013TU Laptop','electronics-laptop','28990','Pre-installed Genuine Windows 10 Operating System (Includes Built-in Security, Free Automated Updates, Latest Features)@Intel Core i3 Processor (6th Gen)@4 GB DDR4 RAM@64 bit Windows 10 Operating System@1 TB HDD@15.6 inch Display','Image/electronics/laptop/laptop5.jpeg','1'),('microven1','Samsung 28 L Convection Microwave Oven  (MC28H5025QB/TL, Black)','electronics-microven','15400','28 L@Convection : Can be used for baking along with grilling, reheating, defrosting and cooking@Tact (Buttons) : Even with hands soiled with dough, these buttons can be used@Child Lock : Ensures complete safety especially for homes with small children','Image/electronics/microven/microven1.jpeg','1'),('microven2','Samsung 28 L Convection Microwave Oven  (MC28H5145VK/TL, Black)','electronics-microven','17090','28 L : Great for family of 4@Convection : Can be used for baking along with grilling, reheating, defrosting and cooking@Tact (Buttons) : Even with hands soiled with dough, these buttons can be used@Child Lock : Ensures complete safety especially for homes with small children','Image/electronics/microven/microven2.jpeg','1'),('microven3','Samsung 21 L Convection Microwave Oven  (CE77JD-SB/XTL, Black Sanganeri Pattern)','electronics-microven','12990','21 L : Great for a family of 3@Convection : Can be used for baking along with grilling, reheating, defrosting and cooking@Touch Key Pad (Membrane) is sensitive to touch and easy to clean@Child Lock : Ensures complete safety especially for homes with small children','Image/electronics/microven/microven3.jpeg','1'),('mobile1','Moto G5s (Lunar Gray, 32 GB)  (4 GB RAM)','electronics-mobile','10,099','4 GB RAM , 32 GB ROM , Expandable Upto 128 GB@5.2 inch Full HD Display@16MP Rear Camera , 5MP Front Camera@3000 mAh Polymer Battery@Qualcomm Snapdragon 430 Processor','Image/electronics/mobile/mobile1.jpg','1'),('mobile2','Moto M (Grey, 64 GB)  (4 GB RAM)','electronics-mobile','15,190','4 GB RAM , 64 GB ROM , Expandable Upto 128 GB@5.5 inch Full HD Display@16MP Rear Camera , 8MP Front Camera@3050 mAh Li-Polymer Battery@Mediatek Helio P15 64-bit Octa Core 2.2GHz Processor','Image/electronics/mobile/mobile2.jpg','1'),('mobile3','Moto X4 (Super Black, 64 GB)  (6 GB RAM)\n','electronics-mobile','17,999','6 GB RAM , 64 GB ROM , Expandable Upto 2 TB@5.2 inch Full HD Display@12MP and 8MP Dual Rear Camera , 16MP Front Camera@3000 mAh Battery@Qualcomm Snapdragon 630 Processor@Android 8.0 Oreo','Image/electronics/mobile/mobile3.jpg','1'),('mobile4','Moto Z2 Force (Super Black, 64 GB)  (6 GB RAM)','electronics-mobile','29,999','6 GB RAM , 64 GB ROM , Expandable Upto 2 TB@5.5 inch Quad HD Display@12MP and 12MP Dual Rear Camera , 5MP Front Camera@2730 mAh Battery@Qualcomm Snapdragon 835 Processor','Image/electronics/mobile/mobile4.jpg','1'),('mobile5','Moto X (2nd Generation) (Black, 32 GB)  (2 GB RAM)','electronics-mobile','17,999','2 GB RAM , 32 GB ROM@5.2 inch Full HD Display@13MP Rear Camera , 2MP Front Camera@2300 mAh Li-Ion Battery@Qualcomm Snapdragon 801 MSM8974-AC Processor','Image/electronics/mobile/mobile5.jpg','1'),('refrigerator1','Panasonic 582 L Frost Free Side by Side Refrigerator  (Stainless Steel, NR-BS60MSX1)','electronics-refrigerator','76,000','582 L : Good for large families@Reciprocatory Compressor : Standard type of Compressor with Easy Maintenance@Frost Free : Auto fridge defrost to stop ice-build up','Image/electronics/refrigerator/refrigerator1.jpg','1'),('refrigerator2','Panasonic 584 L Frost Free Side by Side Refrigerator  (Stainless Steel, NR-BS60DSX1)','electronics-refrigerator','86,660','584 L : Good for large families@Reciprocatory Compressor : Standard type of Compressor with Easy Maintenance@Frost Free : Auto fridge defrost to stop ice-build up','Image/electronics/refrigerator/refrigerator2.jpeg','1'),('refrigerator3','Samsung 674 l Frost Free Side by Side Refrigerator  (RS62K6007S8/TL)','electronics-refrigerator','72,990','674 l : Good for large families@Digital Inverter Compressor@Frost Free : Auto fridge defrost to stop ice-build up','Image/electronics/refrigerator/refrigerator3.jpg','1'),('refrigerator4','\nHaier 565 L Frost Free Side by Side Refrigerator  (Gold, HRF-618GS)','electronics-refrigerator','72,000','565 L@Reciprocatory Compressor@Frost Free : Auto fridge defrost to stop ice-build up','Image/electronics/refrigerator/refrigerator4.jpg','1'),('tv1','Samsung On Smart 43 108cm (43 inch) Full HD LED Smart TV 2018 Edition  (43N5300)','electronics-tv','42,999','40 W Speaker Output@1920 x 1080 Full HD - Watch Blu-ray movies at their highest level of detail@50 Hz : Standard refresh rate for blur-free picture quality@2 x HDMI : For set top box and consoles@1 x USB : Get content from USB drives','Image/electronics/tv/tv1.jpeg','1'),('tv2','Samsung On Smart 43 108cm (43 inch) Full HD LED Smart TV 2018 Edition  (43N5300)','electronics-tv','42,999','40 W Speaker Output@1920 x 1080 Full HD - Watch Blu-ray movies at their highest level of detail@50 Hz : Standard refresh rate for blur-free picture quality@2 x HDMI : For set top box and consoles@1 x USB : Get content from USB drives','Image/electronics/tv/tv2.jpeg','1'),('watch1','Titan NH9308BM01 Octane Watch - For Men','electronics-watch','6,000','Watch Movement: Quartz@Water Resistant (30 m)@Display Type: Analog@Strap: Gold, Silver, Metal@Chronograph','Image/electronics/watch/watch1.jpeg','1'),('watch2','Titan NK9234SL03 Classique Watch - For Men','electronics-watch','8,310','Water Resistant (50 m)@Display Type: Analog@Strap: Brown@2 Years Manufacturer Warranty','Image/electronics/watch/watch2.jpeg','1'),('watch3','Fastrack ND3072SL02 Watch - For Men','electronics-watch','5,090','Watch Movement: Quartz@Water Resistant (98 m)@Display Type: Analog@Strap: Leather@Chronograph, Scratch Resistant@1 Year Manufacturer Warranty','Image/electronics/watch/watch3.jpeg','1');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderhistory` (
  `email` varchar(50) NOT NULL,
  `pid` varchar(20) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` varchar(10) NOT NULL,
  `orderdate` varchar(50) NOT NULL,
  `delivereddate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderhistory`
--

LOCK TABLES `orderhistory` WRITE;
/*!40000 ALTER TABLE `orderhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `country` varchar(15) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `streetname` varchar(50) DEFAULT NULL,
  `housenumber` varchar(10) DEFAULT NULL,
  `nearby` varchar(50) DEFAULT NULL,
  `cart` varchar(200) DEFAULT NULL,
  `noofitem` varchar(10) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('kdic1149329562','Kaushik','kdic11493@gmail.com','11493','India','West Bengal','Kolkata','Garia','','','Garia 5 no. bus stand','','43','8334080201');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-20 23:38:52
