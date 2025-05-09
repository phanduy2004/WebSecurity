CREATE DATABASE  IF NOT EXISTS `billyshop2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `billyshop2`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: billyshop2
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
                        `pro_id` int NOT NULL,
                        `size` varchar(255) NOT NULL,
                        `user_id` int NOT NULL,
                        `price` double DEFAULT NULL,
                        `quantity` int DEFAULT NULL,
                        PRIMARY KEY (`pro_id`,`size`,`user_id`),
                        KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
                        CONSTRAINT `FKi5pjpkux988kw9vpd1jvchtk0` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`),
                        CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (8,'S',19,45000,4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
                            `cate_id` int NOT NULL AUTO_INCREMENT,
                            `description` text,
                            `logo` text,
                            `name` varchar(255) NOT NULL,
                            PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (6,'Sự kết hợp hoàn hảo giữa hạt cà phê Robusta & Arabica thượng hạng được trồng trên những vùng cao nguyên Việt Nam màu mỡ, qua những bí quyết rang xay độc đáo, Highlands Coffee chúng tôi tự hào giới thiệu những dòng sản phẩm Cà phê mang hương vị đậm đà và tinh tế.','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/thumbs/270_crop_HLC_New_logo_5.1_Products__PHIN_DEN_DA.jpg','CÀ PHÊ'),(7,'Sảng khoái với thức uống đá xay phong cách Việt. Freeze là thức uống đá xay mát lạnh được pha chế từ những nguyên liệu thuần túy của Việt Nam.','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/thumbs/270_crop_HLC_New_logo_5.1_Products__FREEZE_TRA_XANH.jpg','FREEZE'),(8,'Hương vị tự nhiên, thơm ngon của Trà Việt với phong cách hiện đại tại Highlands Coffee sẽ giúp bạn gợi mở vị giác của bản thân và tận hưởng một cảm giác thật khoan khoái, tươi mới.','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/thumbs/270_crop_HLC_New_logo_5.1_Products__TRA_SEN_VANG_CU_NANG.jpg','TRÀ'),(9,'Còn gì tuyệt vời hơn khi kết hợp thưởng thức đồ uống của bạn cùng với những chiếc bánh ngọt ngon tinh tế được làm thủ công ngay tại bếp bánh của Highlands Coffee. Những chiếc bánh của chúng tôi mang hương vị đặc trưng của ẩm thực Việt và còn là sự Tận Tâm, gửi gắm mà chúng tôi dành cho Quý khách hàng.\r\n\r\n','https://www.highlandscoffee.com.vn/vnt_upload/product/11_2024/2024_Food/thumbs/270_crop_Croissant.png','BÁNH NGỌT');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
                                `quantity` int NOT NULL,
                                `order_id` int NOT NULL,
                                `pro_id` int NOT NULL,
                                `size` varchar(255) NOT NULL,
                                PRIMARY KEY (`order_id`,`pro_id`),
                                KEY `FK_OrderDetail_Product` (`pro_id`),
                                CONSTRAINT `FK_OrderDetail_Order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
                                CONSTRAINT `FK_OrderDetail_Product` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (2,14,39,'M'),(5,15,39,'L'),(5,16,39,'M'),(2,17,39,'M'),(2,18,39,'L'),(2,19,39,'L'),(2,20,39,'L'),(2,21,39,'S'),(2,22,39,'S'),(2,23,39,'L'),(2,24,39,'L'),(2,26,8,'M'),(2,26,39,'M'),(4,27,8,'S'),(2,28,10,'S'),(2,29,8,'S'),(2,30,9,'S'),(2,31,8,'S'),(2,32,8,'S'),(2,33,8,'S');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
                          `order_id` int NOT NULL AUTO_INCREMENT,
                          `currency` varchar(255) DEFAULT NULL,
                          `date` varchar(255) DEFAULT NULL,
                          `payment_method` varchar(255) DEFAULT 'standard',
                          `status` varchar(255) DEFAULT NULL,
                          `total` double DEFAULT NULL,
                          `ship_cid` int DEFAULT NULL,
                          `user_id` int DEFAULT NULL,
                          `delivery_address` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`order_id`),
                          KEY `FK_Ship_Oder` (`ship_cid`),
                          KEY `FK_user_order` (`user_id`),
                          CONSTRAINT `FK_Ship_Oder` FOREIGN KEY (`ship_cid`) REFERENCES `shipment_company` (`ship_cid`),
                          CONSTRAINT `FK_user_order` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (14,'VND','08/12/2024 03:10:51','CashOnDelivery','Return',130000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(15,'VND','08/12/2024 06:04:52','CashOnDelivery','Cancelled',250000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(16,'VND','08/12/2024 06:05:18','CashOnDelivery','Return',250000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(17,'VND','08/12/2024 06:05:45','CashOnDelivery','Cancelled',130000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(18,'VND','08/12/2024 06:06:08','CashOnDelivery','Return',130000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(19,'VND','08/12/2024 11:12:27','CashOnDelivery','Cancelled',130000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(20,'VND','08/12/2024 11:12:47','CashOnDelivery','Return',130000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(21,'VND','08/12/2024 11:44:44','CashOnDelivery','Delivered',130000,2,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(22,'VND','08/12/2024 11:45:19','CashOnDelivery','Cancelled',110000,2,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(23,'VND','08/12/2024 11:46:07','CashOnDelivery','Return',110000,2,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(24,'VND','08/12/2024 12:42:24','CashOnDelivery','Delivered',100000,2,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(25,'VND','09/12/2024 07:27:44','CashOnDelivery','Canceled',135000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(26,'VND','09/12/2024 07:33:41','CashOnDelivery','Pending',230000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(27,'VND','09/12/2024 07:45:59','CashOnDelivery','Return',176000,1,19,', Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(28,'VND','09/12/2024 08:06:10','VNPay','Pending',10950000,1,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(29,'VND','10/12/2024 21:34:27','CashOnDelivery','Pending',120000,2,25,'No address provided, , , '),(30,'VND','10/12/2024 21:34:42','CashOnDelivery','Pending',120000,1,25,'No address provided, , , '),(31,'VND','10/12/2024 21:39:49','CashOnDelivery','Pending',120000,2,25,'No address provided, , , '),(32,'VND','10/12/2024 22:16:47','CashOnDelivery','Shipping',120000,2,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức'),(33,'VND','10/12/2024 22:18:27','CashOnDelivery','Shipping',120000,2,19,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
                           `pro_id` int NOT NULL AUTO_INCREMENT,
                           `description` text,
                           `image_link` varchar(1000) DEFAULT NULL,
                           `logo` varchar(1000) DEFAULT NULL,
                           `name` varchar(1000) NOT NULL,
                           `cate_id` int DEFAULT NULL,
                           `promotion_id` int DEFAULT NULL,
                           PRIMARY KEY (`pro_id`),
                           KEY `FKll9b6w9lwjkhiymqatom6jbd` (`cate_id`),
                           KEY `FK_Product_Promotion` (`promotion_id`),
                           CONSTRAINT `FK_Product_Promotion` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`),
                           CONSTRAINT `FKll9b6w9lwjkhiymqatom6jbd` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (8,'Americano tại Highlands Coffee là sự kết hợp giữa cà phê espresso thêm vào nước đun sôi. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__AMERICANO_NONG.jpg',NULL,'Americano',6,NULL),(9,'Đích thực là ly cà phê espresso ngon đậm đà! Được chiết xuất một cách hoàn hảo từ loại cà phê rang được phối trộn độc đáo từ những hạt cà phê Robusta và Arabica chất lượng hảo hạng.','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__EXPRESSO.jpg',NULL,'Espresso',6,NULL),(10,'Ly cà phê sữa ngọt ngào đến khó quên! Với một chút nhẹ nhàng hơn so với Cappuccino, Latte của chúng tôi bắt đầu với cà phê espresso, sau đó thêm sữa tươi và bọt sữa một cách đầy nghệ thuật. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__LATTE_1.jpg',NULL,'Latte',6,NULL),(11,'Thỏa mãn cơn thèm ngọt! Ly cà phê Caramel Macchiato bắt đầu từ dòng sữa tươi và lớp bọt sữa béo ngậy, sau đó hòa quyện cùng cà phê espresso đậm đà và sốt caramel ngọt ngào. Thông qua bàn tay điêu luyện của các chuyên gia pha chế, mọi thứ hoàn toàn được nâng tầm thành nghệ thuật! Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__CARAMEL_MACCHIATTO.jpg',NULL,'Caramel Macchiato',6,NULL),(12,'Một thức uống yêu thích được kết hợp bởi giữa sốt sô cô la ngọt ngào, sữa tươi và đặc biệt là cà phê espresso đậm đà mang thương hiệu Highlands Coffee. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__MOCHA.jpg',NULL,'Mocha Macchiato',6,NULL),(13,'Ly cà phê sữa đậm đà thời thượng! Một chút đậm đà hơn so với Latte, Cappuccino của chúng tôi bắt đầu với cà phê espresso, sau đó thêm một lượng tương đương giữa sữa tươi và bọt sữa cho thật hấp dẫn. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá.','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__CAPPUCINO.jpg',NULL,'Cappuccino',6,NULL),(15,'Hương vị cà phê Việt Nam đích thực! Từng hạt cà phê hảo hạng được chọn bằng tay, phối trộn độc đáo giữa hạt Robusta từ cao nguyên Việt Nam, thêm Arabica thơm lừng. Cà phê được pha từ Phin truyền thống, hoà cùng sữa đặc sánh và thêm vào chút đá tạo nên ly Phin Sữa Đá – Đậm Đà Chất Phin.','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__PHIN_SUADA.jpg',NULL,'Phin Sữa Đá',6,NULL),(16,'Với chất phin êm ái, hương vị cà phê Việt Nam hiện đại kết hợp cùng hương quế nhẹ nhàng và thạch cà phê hấp dẫn.','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2024/Phindi_Cassia/Phindi_Cassia_Highlands_products_Image1.jpg',NULL,'PhinDi Cassia',6,NULL),(17,'PhinDi Choco - Cà phê Phin thế hệ mới với chất Phin êm hơn, kết hợp cùng Choco ngọt tan mang đến hương vị mới lạ, không thể hấp dẫn hơn!','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__PHINDI_CHOCO.jpg',NULL,'PhinDi Choco',6,NULL),(18,'PhinDi Hạnh Nhân - Cà phê Phin thế hệ mới với chất Phin êm hơn, kết hợp cùng Hạnh nhân thơm bùi mang đến hương vị mới lạ, không thể hấp dẫn hơn!','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__PHINDI_HANH_NHAN.jpg',NULL,'PhinDi Hạnh Nhân',6,NULL),(19,'PhinDi Kem Sữa - Cà phê Phin thế hệ mới với chất Phin êm hơn, kết hợp cùng Kem Sữa béo ngậy mang đến hương vị mới lạ, không thể hấp dẫn hơn!','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__PHINDI_KEM_SUA.jpg',NULL,'ChoCo Kem Sữa',6,NULL),(21,'Nếu Phin Sữa Đá dành cho các bạn đam mê vị đậm đà, thì Bạc Xỉu Đá là một sự lựa chọn nhẹ “đô\" cà phê nhưng vẫn thơm ngon, chất lừ không kém!','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__BAC_XIU.jpg',NULL,'Bạc Xỉu Đá',6,NULL),(22,'Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha từ Phin, cho thêm 1 thìa đường, mang đến vị cà phê đậm đà chất Phin. ','https://www.highlandscoffee.com.vn/vnt_upload/product/11_2022/BR_Drink/HLC_PHIN_DEN_NONG.jpg',NULL,'Phin Đen Nóng',6,NULL),(23,'Hương vị cà phê Việt Nam đích thực! Từng hạt cà phê hảo hạng được chọn bằng tay, phối trộn độc đáo giữa hạt Robusta từ cao nguyên Việt Nam, thêm Arabica thơm lừng. Kết hợp với nước sôi từng giọt cà phê được chiết xuất từ Phin truyền thống, hoà cùng sữa đặc sánh tạo nên ly Phin Sữa Nóng – Đậm đà chất Phin.','https://www.highlandscoffee.com.vn/vnt_upload/product/11_2022/BR_Drink/HLC__PHIN_SUA_NONG.jpg',NULL,'Phin Sữa Nóng',6,NULL),(24,'Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha hoàn toàn từ Phin, cho thêm 1 thìa đường, một ít đá viên mát lạnh, tạo nên Phin Đen Đá mang vị cà phê đậm đà chất Phin. \r\n\r\n','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/HLC_New_logo_5.1_Products__PHIN_DEN_DA.jpg',NULL,'Phin Đen Đá',6,NULL),(25,'Thức uống rất được ưa chuộng! Trà xanh thượng hạng từ cao nguyên Việt Nam, kết hợp cùng đá xay, thạch trà dai dai, thơm ngon và một lớp kem dày phủ lên trên vô cùng hấp dẫn. Freeze Trà Xanh thơm ngon, mát lạnh, chinh phục bất cứ ai!','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__FREEZE_TRA_XANH.jpg',NULL,'Freeze Trà Xanh',7,NULL),(26,'Một thức uống ngon lạ miệng bởi sự kết hợp hoàn hảo giữa cookies sô cô la giòn xốp cùng hỗn hợp sữa tươi cùng sữa đặc đem say với đá viên, và cuối cùng không thể thiếu được chính là lớp kem whip mềm mịn cùng cookies sô cô la say nhuyễn.','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__COOKIES_FREEZE.jpg',NULL,'Cookies & Cream',7,NULL),(27,'Thiên đường đá xay sô cô la! Từ những thanh sô cô la Việt Nam chất lượng được đem xay với đá cho đến khi mềm mịn, sau đó thêm vào thạch sô cô la dai giòn, ở trên được phủ một lớp kem whip beo béo và sốt sô cô la ngọt ngào. Tạo thành Freeze Sô-cô-la ngon mê mẩn chinh phục bất kì ai!','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/New_product/HLC_New_logo_5.1_Products__FREEZE_CHOCO.jpg',NULL,'Freeze Sô-cô-la',7,NULL),(28,'Thơm ngon khó cưỡng! Được kết hợp từ cà phê truyền thống chỉ có tại Highlands Coffee, cùng với caramel, thạch cà phê và đá xay mát lạnh. Trên cùng là lớp kem tươi thơm béo và caramel ngọt ngào. Món nước phù hợp trong những cuộc gặp gỡ bạn bè, bởi sự ngọt ngào thường mang mọi người xích lại gần nhau.','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__CARAMEL_FREEZE_PHINDI.jpg',NULL,'Caramel Phin Freeze',7,NULL),(29,'Thơm ngon đậm đà! Được kết hợp từ cà phê pha Phin truyền thống chỉ có tại Highlands Coffee, cùng với thạch cà phê và đá xay mát lạnh. Trên cùng là lớp kem tươi thơm béo và bột ca cao đậm đà. Món nước hoàn hảo để khởi đầu câu chuyện cùng bạn bè.','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__CLASSIC_FREEZE_PHINDI.jpg',NULL,'Classic Phin Freeze',7,NULL),(30,'Vị trà đậm đà kết hợp cùng những miếng đào thơm ngon mọng nước cùng thạch đào giòn dai. Thêm vào ít sữa để gia tăng vị béo.','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__TRA_THANH_DAO-09.jpg',NULL,'Trà Thạch Đào',8,NULL),(31,'Một trải nghiệm thú vị khác! Sự hài hòa giữa vị trà cao cấp, vị sả thanh mát và những miếng đào thơm ngon mọng nước sẽ mang đến cho bạn một thức uống tuyệt vời.','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__TRA_THANH_DAO-08.jpg',NULL,'Trà Thanh Đào',8,NULL),(32,'Một sự kết hợp thú vị giữa trà đen, những quả vải thơm ngon và thạch giòn khó cưỡng, mang đến thức uống tuyệt hảo!','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__TRA_TACH_VAI.jpg',NULL,'Trà Thạch Vải',8,NULL),(33,'Trà Ngon lắm đó !!!!!','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__TRA_XANH_DAU_DO.jpg',NULL,'Trà Xanh Đậu Đỏ',8,NULL),(34,'Trà Ngon Lắm nè!!!!','https://www.highlandscoffee.com.vn/vnt_upload/product/06_2023/HLC_New_logo_5.1_Products__TSV.jpg',NULL,'Trà Sen Vàng (Sen)',8,NULL),(35,'Thưởng thức bánh croissant giòn tan, thơm ngon tại Highlands Coffee. Được làm từ bột mì cao cấp và bơ tươi, bánh mang đến hương vị Pháp tinh tế. Kết hợp hoàn hảo với ly cà phê đậm đà cho bữa sáng hoặc bữa xế.','https://www.highlandscoffee.com.vn/vnt_upload/product/11_2024/2024_Food/Croissant.png',NULL,'Bánh Croissant',9,NULL),(38,'Vị béo của phô mai cùng với vị chua của chanh dây, tạo nên chiếc bánh thơm ngon hấp dẫn!','https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/PHOMAICHANHDAY.jpg',NULL,'Bánh Phô Mai Chanh',9,NULL),(39,'cà phê','https://www.bing.com/th?id=OIP.k0h3OBYznu6i8U5H8W8q8gHaE8&w=174&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',NULL,'Nhan Sam Le',6,NULL),(40,'ngon','https://www.highlandscoffee.com.vn/vnt_upload/product/04_2023/thumbs/270_crop_HLC_New_logo_5.1_Products__PHIN_DEN_DA.jpg',NULL,'món mới',9,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
                                  `prod_id` int NOT NULL AUTO_INCREMENT,
                                  `price` double DEFAULT NULL,
                                  `size` enum('L','M','S') DEFAULT NULL,
                                  `pro_id` int DEFAULT NULL,
                                  PRIMARY KEY (`prod_id`),
                                  KEY `FK_Product_ProducDelail` (`pro_id`),
                                  CONSTRAINT `FK_Product_ProducDelail` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
INSERT INTO `product_detail` VALUES (22,45000,'S',8),(23,50000,'M',8),(24,55000,'L',8),(25,35000,'S',9),(26,40000,'M',9),(27,50000,'L',9),(28,35000,'S',10),(29,40000,'M',10),(30,50000,'L',10),(31,45000,'S',11),(32,50000,'M',11),(33,50000,'L',11),(34,40000,'S',12),(35,45000,'M',12),(36,50000,'L',12),(37,40000,'S',13),(38,50000,'M',13),(39,55000,'L',13),(43,30000,'S',15),(44,35000,'M',15),(45,40000,'L',15),(46,40000,'S',16),(47,45000,'M',16),(48,50000,'L',16),(49,40000,'S',17),(50,45000,'M',17),(51,50000,'L',17),(52,45000,'S',18),(53,50000,'M',18),(54,55000,'L',18),(55,45000,'S',19),(56,55000,'M',19),(57,60000,'L',19),(61,40000,'S',21),(62,45000,'M',21),(63,50000,'L',21),(64,30000,'S',22),(65,35000,'M',22),(66,40000,'L',22),(67,35000,'S',23),(68,40000,'M',23),(69,45000,'L',23),(70,30000,'S',24),(71,35000,'M',24),(72,40000,'L',24),(73,50000,'S',25),(74,55000,'M',25),(75,60000,'L',25),(76,57000,'S',26),(77,62000,'M',26),(78,65000,'L',26),(79,50000,'S',27),(80,55000,'M',27),(81,60000,'L',27),(82,57000,'S',28),(83,62000,'M',28),(84,65000,'L',28),(85,45000,'S',29),(86,50000,'M',29),(87,55000,'L',29),(88,55000,'S',30),(89,60000,'M',30),(90,65000,'L',30),(91,55000,'S',31),(92,60000,'M',31),(93,65000,'L',31),(94,50000,'S',32),(95,55000,'M',32),(96,60000,'L',32),(97,50000,'S',33),(98,55000,'M',33),(99,60000,'L',33),(100,57000,'S',34),(101,62000,'M',34),(102,67000,'L',34),(103,20000,'S',35),(104,27000,'M',35),(105,35000,'L',35),(112,18000,'S',38),(113,25000,'M',38),(114,30000,'L',38),(115,30000,'S',39),(116,40000,'M',39),(117,50000,'L',39),(118,23000,'S',40),(119,NULL,'M',40),(120,NULL,'L',40);
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
                             `promotion_id` int NOT NULL AUTO_INCREMENT,
                             `description` text,
                             `discount_rate` int DEFAULT NULL,
                             `is_active` int DEFAULT NULL,
                             `name` varchar(255) DEFAULT NULL,
                             `validity` datetime(6) DEFAULT NULL,
                             `logo` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'Chương trình giảm giá nhân dịp hè, áp dụng cho tất cả các sản phẩm trà sữa.',10,1,'Giảm giá mùa hè',NULL,NULL),(2,'Khuyến mãi đặc biệt cho sinh nhật, giảm giá tất cả các món trà.',15,1,'Khuyến mãi sinh nhật',NULL,NULL),(3,'Chương trình ưu đãi đặc biệt dành cho sinh viên, giảm giá 20% cho các món trà.',20,1,'Ưu đãi sinh viên',NULL,NULL),(4,'Giảm giá 30% cho tất cả các món trong menu vào dịp cuối năm.',30,0,'Khuyến mãi cuối năm',NULL,NULL);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
                          `rating_id` int NOT NULL AUTO_INCREMENT,
                          `content` varchar(2000) DEFAULT NULL,
                          `date` varchar(255) DEFAULT NULL,
                          `platform` varchar(255) DEFAULT NULL,
                          `rate` int DEFAULT NULL,
                          `user_id` int NOT NULL,
                          `product_id` int NOT NULL,
                          PRIMARY KEY (`rating_id`,`user_id`),
                          KEY `FKpn05vbx6usw0c65tcyuce4dw5` (`user_id`),
                          KEY `FK_Rating_Product` (`product_id`),
                          CONSTRAINT `FK_Rating_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`pro_id`),
                          CONSTRAINT `FKpn05vbx6usw0c65tcyuce4dw5` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,'abc','2024-12-08T22:46:09.911284800','web',4,19,39),(2,'abc','2024-12-08T23:18:32.143772900','web',3,19,39),(3,'anh yêu em','2024-12-09T00:17:36.766600200','web',4,19,13),(4,'abc','2024-12-09T03:38:58.992102100','web',4,19,8),(5,'ngon lắm','2024-12-09T03:49:19.223627400','web',5,19,11),(6,'abc','2024-12-09T03:52:01.793778100','web',3,19,30),(7,'anh yeu em','2024-12-09T07:04:20.686371100','web',3,19,8),(8,'ngon lắm','2024-12-09T07:26:46.719890200','web',5,19,8),(9,'ngon','2024-12-09T07:56:01.365773100','web',5,19,30),(10,'ngon lam','2024-12-09T07:56:23.433503','web',5,19,8),(11,'ngon quá','2024-12-09T07:56:44.725308200','web',5,19,9),(12,'ngon ','2024-12-09T07:57:12.694254700','web',5,19,11),(13,'cũm được ','2024-12-10T21:27:08.970144900','web',3,19,8),(14,'cũm được ','2024-12-10T21:27:11.704187600','web',3,19,8),(15,'123','2024-12-10T21:42:48.097856400','web',0,19,8),(16,'123','2024-12-10T21:42:53.470288200','web',0,19,8),(17,'ngon','2024-12-10T21:44:03.383353600','web',4,19,11),(18,'ngon','2024-12-10T21:45:51.416533800','web',4,19,11),(19,'ngon quá','2024-12-10T21:45:59.343214','web',0,19,11),(20,'abc','2024-12-10T21:50:23.454328','web',3,19,8),(21,'ngon','2024-12-10T21:56:37.584851','web',5,19,30),(22,'ngon','2024-12-10T21:58:04.207379600','web',5,19,30),(23,'abc','2024-12-10T22:00:59.710723100','web',4,19,31),(24,'ngon đó','2024-12-10T22:09:23.848727300','web',4,19,9),(25,'dở','2024-12-10T22:10:28.898626300','web',4,19,38),(26,'ngon','2024-12-10T22:11:17.155768300','web',5,19,38),(27,'rất ngon nhaaa','2024-12-10T22:11:50.746058200','web',5,19,38);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `role_name` enum('ADMIN','GUEST','MANAGER','SHIPPER','USER') DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'MANAGER'),(3,'USER'),(4,'GUEST'),(5,'SHIPPER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
                           `date` datetime(6) DEFAULT NULL,
                           `pro_id` int NOT NULL,
                           `user_id` int NOT NULL,
                           PRIMARY KEY (`pro_id`,`user_id`),
                           KEY `FK1bi1pmqjgipw7dx3j6bl37dja` (`user_id`),
                           CONSTRAINT `FK1bi1pmqjgipw7dx3j6bl37dja` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
                           CONSTRAINT `FKo9agix421gp5rry5u5td2g3s7` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('2025-03-01 14:14:53.764532',8,19),('2024-12-10 14:39:40.450940',8,25),('2024-12-10 15:18:06.876691',9,19),('2024-12-10 14:34:36.707111',9,25),('2024-12-09 01:05:08.460768',10,19),('2024-12-10 14:48:56.402727',11,19),('2025-02-27 15:47:31.008241',12,19),('2024-12-10 15:00:52.397414',30,19),('2024-12-10 15:02:46.551309',31,19),('2024-12-10 15:11:51.532303',38,19),('2024-12-09 00:27:55.544981',39,19);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_company`
--

DROP TABLE IF EXISTS `shipment_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_company` (
                                    `ship_cid` int NOT NULL AUTO_INCREMENT,
                                    `price` double DEFAULT NULL,
                                    `methodname` varchar(255) DEFAULT NULL,
                                    `user_id` int DEFAULT NULL,
                                    PRIMARY KEY (`ship_cid`),
                                    UNIQUE KEY `UKb2p296ex3hidggrqijlpwmp00` (`user_id`),
                                    CONSTRAINT `FK_ShipmentCompany_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_company`
--

LOCK TABLES `shipment_company` WRITE;
/*!40000 ALTER TABLE `shipment_company` DISABLE KEYS */;
INSERT INTO `shipment_company` VALUES (1,50000,'Giao hàng Nhanh',24),(2,30000,'Giao hàng tiết kiệm',25);
/*!40000 ALTER TABLE `shipment_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `user_id` int NOT NULL AUTO_INCREMENT,
                        `active` bit(1) DEFAULT b'0',
                        `address` varchar(1000) DEFAULT NULL,
                        `code` varchar(255) DEFAULT NULL,
                        `email` varchar(255) DEFAULT NULL,
                        `full_name` varchar(255) DEFAULT NULL,
                        `is_admin` tinyint(1) DEFAULT '0',
                        `is_enabled` bit(1) DEFAULT b'1',
                        `password` varchar(255) DEFAULT NULL,
                        `password_hash` varchar(255) DEFAULT NULL,
                        `password_salt` varchar(255) DEFAULT NULL,
                        `phone` varchar(255) DEFAULT NULL,
                        `username` varchar(255) DEFAULT NULL,
                        `status` tinyint DEFAULT NULL,
                        PRIMARY KEY (`user_id`),
                        UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
                        UNIQUE KEY `UK589idila9li6a4arw1t8ht1gx` (`phone`),
                        UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
                        CONSTRAINT `user_chk_1` CHECK ((`status` between 0 and 1))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (14,_binary '','123 Admin Street','ADMIN_CODE','admin@example.com','Admin User',1,_binary '','adminpassword','hashedpassword123','salt123','0123456799','admin_user',NULL),(15,_binary '','234 Manager Street','MANAGER_CODE','manager@example.com','Manager User',0,_binary '','managerpassword','hashedpassword234','salt234','0123456779','manager_user',NULL),(16,_binary '','345 User Avenue','USER_CODE','user@example.com','Regular User',0,_binary '','userpassword','hashedpassword345','salt345','9876543210','regular_user',NULL),(18,_binary '','567 Shipper Road','SHIPPER_CODE','shipper@example.com','Shipper User',0,_binary '','shipperpassword','hashedpassword567','salt567','9876543110','shipper_user',NULL),(19,NULL,'219/4 Lê Văn Chí, Phường Linh Xuân, Quận Thủ Đức, Thành Phố Thủ Đức','006852','ledaonhansam@gmail.com','ledaonhansam',NULL,_binary '',NULL,'$2a$10$F4M8uA1.YVuKTSZSnJcrDuhV8SpyeIBjwVyvrO4tKhMGgXhpB2W9C',NULL,'0335585657','nhansamle',NULL),(24,NULL,'219/4 Lê Văn Chí , Linh Trung, Quận Thủ Đức, TP. Hồ Chí Minh','602754','ledaonhansam001@gmail.com','ledaonhansam',NULL,_binary '','123','$2a$10$roWr8J1CzF5LJUZwVcn3v.F6gnkoIMdYyduaF1QpAeoDLcvsYmx5y',NULL,'0335585655','ledaonhansam',NULL),(25,NULL,NULL,'954484','ledaonhansam1@gmail.com','ledaonhansam',NULL,_binary '','123','$2a$10$BVJE.i4tapTH8B6HzQ.VautLB/bdrL5tyDs3JKKTHUvj/Y6n2HbNm',NULL,'0335585650',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
                               `user_id` int NOT NULL,
                               `role_id` int NOT NULL,
                               PRIMARY KEY (`user_id`,`role_id`),
                               KEY `FKj53n5vhpbsurvdnj9y1x4p0id` (`role_id`),
                               CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
                               CONSTRAINT `FKj53n5vhpbsurvdnj9y1x4p0id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(19,1),(2,2),(3,3),(24,3),(4,4),(5,5),(25,5);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
                            `pro_id` int NOT NULL,
                            `size` varchar(255) NOT NULL,
                            `user_id` int NOT NULL,
                            `price` double DEFAULT NULL,
                            `quantity` int DEFAULT NULL,
                            PRIMARY KEY (`pro_id`,`size`,`user_id`),
                            KEY `FKd4r80jm8s41fgoa0xv9yy5lo8` (`user_id`),
                            CONSTRAINT `FKd4r80jm8s41fgoa0xv9yy5lo8` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
                            CONSTRAINT `FKdvl3lsh6yutf3nhhpixhp1040` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (8,'S',19,45000,2);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-02 17:36:11
