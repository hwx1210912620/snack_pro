/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - sudi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `sudi_address` */

DROP TABLE IF EXISTS `sudi_address`;

CREATE TABLE `sudi_address` (
  `addressId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `userId` bigint(20) NOT NULL COMMENT '用户编号',
  `defaulted` tinyint(1) DEFAULT NULL COMMENT '是否首选(1表示是，0表示否)',
  `address` varchar(255) NOT NULL COMMENT '用户住址',
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_address` */

insert  into `sudi_address`(`addressId`,`userId`,`defaulted`,`address`) values (1,1,0,'厦门市集美大学银江路183号'),(2,1,1,'厦门市思明区思明南路40号1107室'),(3,1,0,'厦门市集美大学诚毅集友3号楼209号'),(4,1,0,'厦门市集美大学六社区五组团113');

/*Table structure for table `sudi_comment` */

DROP TABLE IF EXISTS `sudi_comment`;

CREATE TABLE `sudi_comment` (
  `commentId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `orderDetailId` bigint(20) DEFAULT NULL COMMENT '订单细则编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号(冗余)',
  `commentScore` decimal(5,2) DEFAULT NULL COMMENT '评论评分',
  `commentContent` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `commentTime` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_comment` */

insert  into `sudi_comment`(`commentId`,`orderDetailId`,`userId`,`commentScore`,`commentContent`,`commentTime`) values (2,47,1,'3.50','还不错','2020-12-08 13:57:03'),(3,46,1,'4.00','还不错','2020-12-08 14:04:20'),(4,48,1,'5.00','好吃','2020-12-08 14:12:46');

/*Table structure for table `sudi_complaint` */

DROP TABLE IF EXISTS `sudi_complaint`;

CREATE TABLE `sudi_complaint` (
  `complaintId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '投诉编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `orderId` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `complaintType` int(11) DEFAULT NULL COMMENT '投诉类型(1表示投诉配送员;2表示投诉菜品;3表示其他)',
  `target` varchar(120) DEFAULT NULL COMMENT '投诉对象',
  `complaintContent` varchar(255) DEFAULT NULL COMMENT '投诉内容',
  `complaintTime` datetime DEFAULT NULL COMMENT '投诉时间',
  PRIMARY KEY (`complaintId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_complaint` */

insert  into `sudi_complaint`(`complaintId`,`userId`,`orderId`,`complaintType`,`target`,`complaintContent`,`complaintTime`) values (2,1,'D2020120515470293611',1,'配送员','超时严重!!','2020-12-09 15:47:19'),(3,1,'D2020120515470293611',1,'配送员','配送时间严重超时!!!','2020-12-09 15:59:16'),(4,1,'D2020120515444831014',2,'炒河粉(中份)','太咸了，怎么会这么难吃？？\n搞什么东西？？？\n厨师脑子被驴踢了？？？','2020-12-09 16:06:03'),(5,1,'D2020120515502737442',3,'其他','包装破洞，汤全撒了，怎么吃嘛！','2020-12-09 16:16:31');

/*Table structure for table `sudi_deliver` */

DROP TABLE IF EXISTS `sudi_deliver`;

CREATE TABLE `sudi_deliver` (
  `deliverId` varchar(16) NOT NULL COMMENT '配送员编号',
  `userId` bigint(20) NOT NULL COMMENT '用户编号',
  `realName` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `imageUrl` varchar(255) DEFAULT NULL COMMENT '证件照片路径',
  `orderCount` int(11) DEFAULT '0' COMMENT '接单总数',
  `faultCount` int(11) DEFAULT '0' COMMENT '差评总数',
  `finishCount` int(11) DEFAULT '0' COMMENT '结单总数',
  `joinDate` date DEFAULT NULL COMMENT '入职日期',
  `leaveDate` date DEFAULT NULL COMMENT '离职日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注（特别说明）',
  PRIMARY KEY (`deliverId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `sudi_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sudi_deliver` */

insert  into `sudi_deliver`(`deliverId`,`userId`,`realName`,`imageUrl`,`orderCount`,`faultCount`,`finishCount`,`joinDate`,`leaveDate`,`remark`) values ('2020111416380943',1,'无敌的管理员','deliver/20201117/9e4116cccd1f4dbb81ceba3c0aae0707.jpg',4,2,2,'2020-11-14',NULL,NULL),('2020111610424485',12,'二狗子','deliver/2020-11-16/2dbfcad525274b488b2e1cbc4bb61a26.jpg',0,0,0,'2020-11-17',NULL,'67th'),('2020111610452940',5,'test4','deliver2020-11-16/7af5fba80cf04f9fb1392eb055b0162a.jpg',0,0,0,'2020-11-16',NULL,'rghedhb rh rbegergege'),('2020111612415504',7,'cbvv','deliver/defaultImages/defaultImage.png',0,0,0,'2020-11-16',NULL,'vdxv'),('2020111619211668',8,'名字','deliver/20201116/69e2cfb06f514cf4bf3a7ed3c9840064.jpg',24,0,23,'2020-11-16',NULL,'scvv'),('2020111619254468',3,'nnn','deliver/defaultImage/defaultImage.png',38,1,29,'2020-11-16',NULL,'zcvxxzcv'),('2020111619284943',9,'999777','deliver/20201117/9c2082271ef14562b2ecace7eaefcce5.jpg',0,0,0,'2020-11-17',NULL,'vzv'),('2020111619301947',13,'我是傻逼','deliver/defaultImage/defaultImage.png',42,4,35,'2020-11-17',NULL,'asdasdalkfdjalkfnlaskdfnlkisvnklsjvnksvnsxcz'),('2020112111003748',2,NULL,'deliver/defaultImage/defaultImage.png',0,0,0,'2020-11-28',NULL,NULL),('2020112117440627',14,'kounijiwa','deliver/20201121/18d1ca06077f4cbf9694eaa8ead63e66.jpg',0,0,0,'2020-11-21',NULL,'123');

/*Table structure for table `sudi_food` */

DROP TABLE IF EXISTS `sudi_food`;

CREATE TABLE `sudi_food` (
  `foodId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品编号',
  `foodName` varchar(80) NOT NULL COMMENT '菜品名称',
  `foodTypeId` bigint(20) NOT NULL COMMENT '菜品类别编号',
  `foodIngredient` varchar(255) DEFAULT '暂无信息' COMMENT '菜品配料',
  `foodVegon` varchar(60) DEFAULT '暂无信息' COMMENT '菜品荤素描述',
  `foodCookWay` varchar(60) DEFAULT '暂无信息' COMMENT '菜品烹饪方式',
  `foodFaultCount` int(11) DEFAULT '0' COMMENT '菜品差评数',
  `foodDesc` varchar(255) DEFAULT '暂无信息' COMMENT '菜品描述',
  `foodImage` varchar(255) DEFAULT NULL COMMENT '菜品图片路径',
  `foodSaleCount` int(11) DEFAULT '0' COMMENT '菜品销量',
  `foodViewCount` int(11) DEFAULT '0' COMMENT '菜品浏览量',
  `foodScore` decimal(5,2) DEFAULT '2.50' COMMENT '平均分',
  `commentCount` int(11) DEFAULT '0' COMMENT '评论数',
  `recommend` int(11) DEFAULT '2' COMMENT '是否推荐（1表示是；2表示否）',
  `hotSale` int(11) DEFAULT '2' COMMENT '是否热销（1表示是；2表示否）',
  `foodStatus` int(11) DEFAULT '3' COMMENT '菜品状态（1表示上架中；2表示下架；3表示未完善）',
  `lastModifyBy` varchar(60) DEFAULT NULL COMMENT '上次修改人',
  `lastModifyTime` datetime DEFAULT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`foodId`),
  KEY `foodTypeId` (`foodTypeId`),
  CONSTRAINT `sudi_food_ibfk_1` FOREIGN KEY (`foodTypeId`) REFERENCES `sudi_foodtype` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_food` */

insert  into `sudi_food`(`foodId`,`foodName`,`foodTypeId`,`foodIngredient`,`foodVegon`,`foodCookWay`,`foodFaultCount`,`foodDesc`,`foodImage`,`foodSaleCount`,`foodViewCount`,`foodScore`,`commentCount`,`recommend`,`hotSale`,`foodStatus`,`lastModifyBy`,`lastModifyTime`) values (14,'糖醋排骨',3,'排骨、菠萝、红萝卜','荤菜','糖醋',0,'下饭首选！','food/20201126/45b360068d094f27995e9f9ef9c20598.png',0,2,'2.50',0,2,1,1,'admin','2020-11-28 19:08:51'),(15,'香煎猪扒',3,'猪扒','荤菜','香煎',0,'       香煎猪扒是一种小吃，主料是猪里脊，配料是鸡蛋等，调料为孜然粉、五香粉、料酒，通过煎制的做法制作而成。\n       猪瘦肉的营养非常全面，不但为人类提供优质蛋白质和必需的脂肪酸，还提供大量的钙、磷、铁、硫胺素、核黄素和尼克酸等营养元素。猪瘦肉的营养优势在于它含有丰富的B族维生素，能调节新陈代谢，维持皮肤和肌肉的健康，增强免疫系统和神经系统的功能，预防贫血发生，而且猪瘦肉中的血红蛋白比植物中的更好吸收。\n','food/20201128/64407c1d92cf4080ac732dda17a1e921.png',4,21,'2.50',0,2,1,1,'admin','2020-11-30 10:04:11'),(16,'炒饭',6,'高丽菜、胡萝卜、肉丝、东北大米','半荤半素','烹炒',0,'一碗顶十碗','food/20201129/2500ef805f5d44a887f4bbce9a1f5e65.png',16,2,'3.75',1,1,2,1,'admin','2020-11-29 15:36:07'),(17,'干煸茄子',7,'茄子、肉末','半荤半素','干煸',0,'茄子、肉末','food/20201129/3ade503a24544512b17083a4d57fd1e8.png',64,6,'2.50',3,1,2,1,'admin','2020-11-29 23:21:31'),(18,'炒河粉',6,'河粉、牛肉、芽菜、葱花、老抽、味精、生抽、糖适量混合待用','半荤半素','炒',1,'炒河粉能够有以下好处：①补充能量：含碳水化合物，糖类，能迅速为身体提供能量。②安神除烦：碳水化合物可以补充大脑消耗的葡萄糖，缓解脑部葡萄糖供养不足而出现的疲惫、易怒、头晕、失眠、夜间出汗、注意力涣散、健忘、极度口渴、沮丧、化紊乱，甚至出现幻觉。','food/20201201/c025b6e7881a4e60b96a72055b8cd3bf.png',23,45,'2.50',1,2,1,1,'admin','2020-12-01 13:38:19');

/*Table structure for table `sudi_foodattr` */

DROP TABLE IF EXISTS `sudi_foodattr`;

CREATE TABLE `sudi_foodattr` (
  `foodattrId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品规格集编号',
  `foodattrName` varchar(60) DEFAULT NULL COMMENT '菜品规格集名称',
  PRIMARY KEY (`foodattrId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_foodattr` */

insert  into `sudi_foodattr`(`foodattrId`,`foodattrName`) values (1,'规格'),(2,'口味'),(3,'温度'),(4,'甜度'),(5,'份量'),(6,'主食'),(7,'酱料'),(8,'包装'),(9,'加料'),(10,'小菜'),(11,'小食'),(12,'其他');

/*Table structure for table `sudi_foodsku` */

DROP TABLE IF EXISTS `sudi_foodsku`;

CREATE TABLE `sudi_foodsku` (
  `skuId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品sku编号',
  `foodId` bigint(20) NOT NULL COMMENT '菜品编号',
  `skuName` varchar(255) NOT NULL COMMENT '菜品sku名称',
  `skuPrice` decimal(5,2) DEFAULT NULL COMMENT '菜品sku价格',
  `skuSale` int(11) DEFAULT '0' COMMENT '菜品sku销量',
  `skuStock` int(11) DEFAULT '0' COMMENT '菜品sku供应量',
  PRIMARY KEY (`skuId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `sudi_foodsku_ibfk_1` FOREIGN KEY (`foodId`) REFERENCES `sudi_food` (`foodId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_foodsku` */

insert  into `sudi_foodsku`(`skuId`,`foodId`,`skuName`,`skuPrice`,`skuSale`,`skuStock`) values (1,14,'糖醋排骨(大份)','46.00',0,0),(2,14,'糖醋排骨(中份)','43.00',0,0),(3,14,'糖醋排骨(小份)','83.00',0,0),(4,14,'糖醋排骨(test)','76.00',56,0),(6,15,'香煎猪扒(番茄酱)','45.00',1,30),(7,15,'香煎猪扒(甜辣酱)','10.00',3,20),(8,15,'香煎猪扒(黑胡椒酱)','10.00',0,23),(9,15,'香煎猪扒(千岛酱)','12.00',0,20),(10,15,'香煎猪扒(猪扒测试)','13.00',0,3),(11,16,'炒饭(牛肉丁)','8.00',0,30),(12,16,'炒饭(猪肉丁)','6.00',11,30),(13,16,'炒饭(火腿肠)','5.00',5,50),(14,17,'干煸茄子(辣)','3.50',0,50),(15,17,'干煸茄子(不辣)','3.50',64,30),(16,18,'炒河粉(大份)','12.00',0,100),(17,18,'炒河粉(中份)','10.00',23,100),(18,18,'炒河粉(小份)','8.00',0,100);

/*Table structure for table `sudi_foodtype` */

DROP TABLE IF EXISTS `sudi_foodtype`;

CREATE TABLE `sudi_foodtype` (
  `typeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品类别编号',
  `typeName` varchar(60) NOT NULL COMMENT '菜品类别名',
  `typeDesc` varchar(255) DEFAULT NULL COMMENT '菜品类别介绍',
  `lastModifyBy` varchar(60) DEFAULT NULL COMMENT '上次修改人',
  `lastModifyTime` datetime DEFAULT NULL COMMENT '上次修改日期',
  `typeStatus` int(11) DEFAULT NULL COMMENT '状态（1表示使用中；2表示下架）',
  `typeImage` varchar(255) DEFAULT NULL COMMENT '菜品类别大图',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_foodtype` */

insert  into `sudi_foodtype`(`typeId`,`typeName`,`typeDesc`,`lastModifyBy`,`lastModifyTime`,`typeStatus`,`typeImage`) values (3,'中餐','123','admin','2020-11-23 19:42:05',1,'foodtype/20201121/11a3b2e87e864abfb2628432086cc41b.jpg'),(4,'面食','gullugluglglglglg','admin','2020-11-23 19:42:12',1,'foodtype/20201121/d9d5688373a54dbe8c30d894aea735fb.png'),(5,'麻辣烫','defaulteddddd','admin','2020-11-23 19:42:22',1,'foodtype/defaultImage/defaultImage.png'),(6,'主食','rice','admin','2020-12-05 15:46:21',1,'foodtype/defaultImage/defaultImage.png'),(7,'小炒','小炒','admin','2020-11-29 23:04:31',1,'foodtype/defaultImage/defaultImage.png');

/*Table structure for table `sudi_foodvalue` */

DROP TABLE IF EXISTS `sudi_foodvalue`;

CREATE TABLE `sudi_foodvalue` (
  `foodvalueId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜品规格编号',
  `foodattrId` bigint(20) NOT NULL COMMENT '菜品规格集编号',
  `foodId` bigint(20) NOT NULL COMMENT '菜品编号',
  `foodvalueName` varchar(60) NOT NULL COMMENT '菜品规格名',
  PRIMARY KEY (`foodvalueId`),
  KEY `foodattrId` (`foodattrId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `sudi_foodvalue_ibfk_1` FOREIGN KEY (`foodattrId`) REFERENCES `sudi_foodattr` (`foodattrId`),
  CONSTRAINT `sudi_foodvalue_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `sudi_food` (`foodId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_foodvalue` */

insert  into `sudi_foodvalue`(`foodvalueId`,`foodattrId`,`foodId`,`foodvalueName`) values (22,1,14,'大份'),(23,1,14,'中份'),(24,1,14,'小份'),(25,1,14,'test'),(27,7,15,'番茄酱'),(28,7,15,'甜辣酱'),(29,7,15,'黑胡椒酱'),(30,7,15,'千岛酱'),(31,7,15,'猪扒测试'),(32,1,16,'牛肉丁'),(33,1,16,'猪肉丁'),(34,1,16,'火腿肠'),(35,1,17,'辣'),(36,1,17,'不辣'),(37,5,18,'大份'),(38,5,18,'中份'),(39,5,18,'小份');

/*Table structure for table `sudi_menu` */

DROP TABLE IF EXISTS `sudi_menu`;

CREATE TABLE `sudi_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `pid` int(11) DEFAULT '0' COMMENT '父级菜单编号（为空默认为0）',
  `title` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `href` varchar(255) DEFAULT NULL COMMENT '菜单路径',
  `spread` int(11) DEFAULT '0' COMMENT '是否展开（0表示否，1表示是）',
  `icon` varchar(60) DEFAULT NULL COMMENT '菜单图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_menu` */

insert  into `sudi_menu`(`id`,`pid`,`title`,`href`,`spread`,`icon`) values (1,0,'系统管理',NULL,1,NULL),(2,1,'用户管理','/sudi/backstage/userManage.html',1,'fa fa-user-o'),(3,1,'角色管理','/sudi/backstage/roleManage.html',0,'fa fa-vcard-o'),(4,1,'菜单管理','/sudi/backstage/menuManage.html',0,'fa fa-th-list'),(5,6,'菜品管理','',1,'fa fa-gears'),(6,0,'食堂管理','',1,'fa fa-building'),(7,6,'配送员管理','/sudi/backstage/deliverManage.html',0,'fa fa-shopping-bag'),(8,0,'用户前台','',1,''),(9,8,'个人中心','/sudi/userInfo.html',0,'fa fa-user'),(10,5,'菜品类别管理','/sudi/backstage/foodtypeManage.html',0,'fa fa-inbox'),(11,5,'菜品规格组管理','/sudi/backstage/foodattrManage.html',1,'fa fa-sitemap'),(12,5,'菜品SPU管理','/sudi/backstage/foodManage.html',1,'fa fa-cutlery'),(13,5,'菜品SKU管理','/sudi/backstage/foodSkuManage.html',1,'fa fa-tasks'),(14,8,'点餐中心','/sudi/reception/foodCenter.html',1,'fa fa-align-center'),(15,6,'优惠券管理','',1,'fa fa-ticket'),(16,15,'优惠券类别管理','/sudi/backstage/ticketTypeManage.html',1,'fa fa-bars'),(17,15,'领取记录管理','/sudi/backstage/ticketManage.html',1,'fa fa-credit-card'),(18,8,'我的购物车','/sudi/reception/shopcart.html',1,'fa fa-shopping-cart'),(19,8,'优惠券商城','/sudi/reception/ticketShop.html',1,'fa fa-ticket'),(20,6,'订单分配管理','/sudi/backstage/orderAllocationManage.html',1,'fa fa-clipboard'),(21,0,'配送员面板','',1,''),(22,21,'待配送订单','/sudi/backstage/orderDeliverManage.html',1,'fa fa-map'),(23,21,'配送记录','/sudi/backstage/deliverRecord.html',1,'fa fa-list-alt'),(24,6,'投诉中心','/sudi/backstage/complaintManage.html',1,'fa fa-commenting-o'),(25,6,'数据观星','/sudi/backstage/dataChart',1,'fa fa-bar-chart-o');

/*Table structure for table `sudi_order` */

DROP TABLE IF EXISTS `sudi_order`;

CREATE TABLE `sudi_order` (
  `orderId` varchar(20) NOT NULL COMMENT '订单编号(D+时间戳+5位随机数)',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `address` varchar(255) DEFAULT NULL COMMENT '地址(冗余)',
  `realName` varchar(30) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '收货人手机号',
  `totalCount` int(11) DEFAULT NULL COMMENT '总菜品计数',
  `totalPrice` decimal(5,2) DEFAULT NULL COMMENT '应付金额',
  `actualPrice` decimal(5,2) DEFAULT NULL COMMENT '实付金额',
  `ticketId` bigint(20) DEFAULT NULL COMMENT '优惠券编号',
  `cheap` decimal(5,2) DEFAULT '0.00' COMMENT '优惠金额',
  `deliverId` varchar(16) DEFAULT NULL COMMENT '配送员编号',
  `deliverName` varchar(60) DEFAULT NULL COMMENT '配送员姓名(冗余)',
  `deliverPhone` varchar(20) DEFAULT NULL COMMENT '配送员电话(冗余)',
  `orderTime` datetime DEFAULT NULL COMMENT '下单时间',
  `finishTime` datetime DEFAULT NULL COMMENT '送达时间',
  `orderStatus` int(11) DEFAULT NULL COMMENT '订单状态(1表示出餐中；2表示配送中；3表示已完成；4表示未支付；5表示已取消)',
  `complaint` int(11) DEFAULT '2' COMMENT '是否投诉(1表示是；2表示否)',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sudi_order` */

insert  into `sudi_order`(`orderId`,`userId`,`address`,`realName`,`phone`,`totalCount`,`totalPrice`,`actualPrice`,`ticketId`,`cheap`,`deliverId`,`deliverName`,`deliverPhone`,`orderTime`,`finishTime`,`orderStatus`,`complaint`) values ('D2020120515444831014',1,'厦门市思明区思明南路40号1107室','hhj','18750916277',8,'43.50','43.50',NULL,'0.00','2020111416380943','无敌的管理员','18750916277','2020-12-05 15:44:48','2020-12-06 20:27:20',3,1),('D2020120515470293611',1,'厦门市集美大学六社区五组团113','asda','18750916277',2,'13.50','13.50',NULL,'0.00','2020111416380943','无敌的管理员','18750916277','2020-12-05 15:47:02','2020-12-09 16:16:57',3,1),('D2020120515502737442',1,'厦门市思明区思明南路40号1107室','ccc','18750916277',1,'45.00','40.00',10,'5.00',NULL,NULL,NULL,'2020-12-05 15:50:27',NULL,1,1),('D2020120616564945555',1,'厦门市集美大学诚毅集友3号楼209号','马一鸣','18750916277',5,'25.00','25.00',NULL,'0.00',NULL,NULL,NULL,'2020-12-06 16:56:49',NULL,1,2),('D2020120616575351305',1,'厦门市集美大学诚毅集友3号楼209号','张锦龙','18750916277',3,'30.00','30.00',NULL,'0.00',NULL,NULL,NULL,'2020-12-06 16:57:53',NULL,5,2);

/*Table structure for table `sudi_orderdetail` */

DROP TABLE IF EXISTS `sudi_orderdetail`;

CREATE TABLE `sudi_orderdetail` (
  `orderDetailId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单细则编号',
  `orderId` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `skuId` bigint(20) DEFAULT NULL COMMENT '菜品SKU编号',
  `amount` int(11) DEFAULT NULL COMMENT '条目计数',
  `itemPrice` decimal(5,2) DEFAULT NULL COMMENT '条目价格',
  `comment` int(2) DEFAULT NULL COMMENT '是否评价(1表示已评价；2表示未评价)',
  PRIMARY KEY (`orderDetailId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `sudi_orderdetail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `sudi_order` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_orderdetail` */

insert  into `sudi_orderdetail`(`orderDetailId`,`orderId`,`skuId`,`amount`,`itemPrice`,`comment`) values (46,'D2020120515444831014',17,2,'20.00',1),(47,'D2020120515444831014',15,5,'17.50',2),(48,'D2020120515444831014',12,1,'6.00',1),(49,'D2020120515470293611',15,1,'3.50',2),(50,'D2020120515470293611',17,1,'10.00',2),(51,'D2020120515502737442',6,1,'45.00',2),(52,'D2020120616564945555',13,5,'25.00',2),(53,'D2020120616575351305',7,3,'30.00',2);

/*Table structure for table `sudi_role` */

DROP TABLE IF EXISTS `sudi_role`;

CREATE TABLE `sudi_role` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `roleName` varchar(60) DEFAULT NULL COMMENT '角色名称',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `lastModifyBy` varchar(60) DEFAULT NULL COMMENT '上次修改人',
  `lastModifyTime` datetime DEFAULT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_role` */

insert  into `sudi_role`(`roleId`,`roleName`,`roleDesc`,`lastModifyBy`,`lastModifyTime`) values (1,'普通用户','普通用户的权限限于前台','admin','2020-11-12 21:27:23'),(2,'配送员','负责餐品的配送服务','admin','2020-11-14 16:27:22'),(3,'食堂管理员','负责食堂日常事务的管理和维护','admin','2020-11-14 16:27:49'),(4,'系统管理员','负责系统的权责划分和用户的角色授予','admin','2020-11-14 16:28:23'),(5,'测试角色','全权限，开发测试专用','admin','2020-11-14 17:02:40');

/*Table structure for table `sudi_role_menu` */

DROP TABLE IF EXISTS `sudi_role_menu`;

CREATE TABLE `sudi_role_menu` (
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色编号',
  `menuId` int(11) DEFAULT NULL COMMENT '菜单编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sudi_role_menu` */

insert  into `sudi_role_menu`(`roleId`,`menuId`) values (1,8),(1,9),(4,1),(4,2),(4,3),(4,4),(4,8),(4,9),(2,8),(2,9),(3,6),(3,5),(3,10),(3,7),(3,8),(3,9),(5,1),(5,2),(5,3),(5,4),(5,6),(5,5),(5,10),(5,11),(5,12),(5,13),(5,7),(5,15),(5,16),(5,17),(5,20),(5,24),(5,25),(5,8),(5,9),(5,14),(5,18),(5,19),(5,21),(5,22),(5,23);

/*Table structure for table `sudi_shopcart` */

DROP TABLE IF EXISTS `sudi_shopcart`;

CREATE TABLE `sudi_shopcart` (
  `shopcartId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车细则编号',
  `skuId` bigint(20) DEFAULT NULL COMMENT '菜品SKU编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `numCount` int(11) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`shopcartId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sudi_shopcart` */

/*Table structure for table `sudi_ticket` */

DROP TABLE IF EXISTS `sudi_ticket`;

CREATE TABLE `sudi_ticket` (
  `ticketId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '优惠券编号',
  `ticketTypeId` bigint(20) DEFAULT NULL COMMENT '优惠券类别编号',
  `userId` bigint(20) DEFAULT NULL COMMENT '领取用户编号',
  `endTime` date DEFAULT NULL COMMENT '失效时间',
  `ticketStatus` int(11) DEFAULT NULL COMMENT '优惠券状态(1表示未使用；2表示已使用；3表示已过期；4表示作废;5表示积分已返还)',
  `startTime` date DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`ticketId`),
  KEY `ticketTypeId` (`ticketTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_ticket` */

insert  into `sudi_ticket`(`ticketId`,`ticketTypeId`,`userId`,`endTime`,`ticketStatus`,`startTime`) values (1,2,1,'2020-12-09',4,'2020-12-01'),(2,1,1,'2020-12-08',1,'2020-12-01'),(3,3,1,'2020-12-08',5,'2020-12-01'),(4,3,1,'2020-12-08',2,'2020-12-01'),(5,2,1,'2020-12-09',2,'2020-12-01'),(6,2,1,'2020-12-09',1,'2020-12-01'),(7,1,1,'2020-12-08',4,'2020-12-01'),(8,1,1,'2020-12-08',3,'2020-12-01'),(9,1,1,'2020-10-26',3,'2020-12-01'),(10,2,1,'2020-12-09',2,'2020-12-01'),(11,2,1,'2020-12-10',1,'2020-12-02');

/*Table structure for table `sudi_tickettype` */

DROP TABLE IF EXISTS `sudi_tickettype`;

CREATE TABLE `sudi_tickettype` (
  `ticketTypeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '优惠券类别编号',
  `ticketName` varchar(120) DEFAULT NULL COMMENT '优惠券名称',
  `requirement` decimal(5,2) DEFAULT NULL COMMENT '满减门槛',
  `cheap` decimal(5,2) DEFAULT NULL COMMENT '优惠额度',
  `ticketNum` int(11) DEFAULT NULL COMMENT '供应数量',
  `receive` int(11) DEFAULT '0' COMMENT '已领取数',
  `liveTime` int(11) DEFAULT NULL COMMENT '领取后有效天数',
  `lastModifyBy` varchar(60) DEFAULT NULL COMMENT '上次修改人',
  `lastModifyTime` datetime NOT NULL COMMENT '上次修改时间',
  `ticketTypeStatus` int(11) DEFAULT '2' COMMENT '优惠券类别状态(1表示上架；2表示下架)',
  `needScore` int(11) DEFAULT NULL COMMENT '兑换所需积分',
  PRIMARY KEY (`ticketTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_tickettype` */

insert  into `sudi_tickettype`(`ticketTypeId`,`ticketName`,`requirement`,`cheap`,`ticketNum`,`receive`,`liveTime`,`lastModifyBy`,`lastModifyTime`,`ticketTypeStatus`,`needScore`) values (1,'test','100.00','10.00',9898,4,7,'admin','2020-12-01 17:11:27',1,50),(2,'感恩回馈','40.00','5.00',1000,405,8,'admin','2020-11-29 14:24:52',1,60),(3,'可怜的优惠券','20.00','2.00',2,2,7,'admin','2020-12-01 22:49:50',1,10);

/*Table structure for table `sudi_user` */

DROP TABLE IF EXISTS `sudi_user`;

CREATE TABLE `sudi_user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(60) NOT NULL COMMENT '用户名',
  `password` varchar(60) NOT NULL COMMENT '密码',
  `phone` varchar(20) NOT NULL COMMENT '用户手机号',
  `email` varchar(60) DEFAULT NULL COMMENT '用户邮箱',
  `gender` int(11) DEFAULT '0' COMMENT '用户性别（1表示男，2表示女，0表示未知）',
  `birthday` date DEFAULT NULL COMMENT '用户出生日期',
  `registerDate` date DEFAULT NULL COMMENT '注册日期',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '上次登入时间',
  `lastLogoutTime` datetime DEFAULT NULL COMMENT '上次登出时间',
  `loginCount` int(11) DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `sudi_user` */

insert  into `sudi_user`(`userId`,`username`,`password`,`phone`,`email`,`gender`,`birthday`,`registerDate`,`score`,`lastLoginTime`,`lastLogoutTime`,`loginCount`) values (1,'admin','admin','18750916277','328092067@qq.com',1,'2020-11-04','2020-11-03',80,'2020-12-10 09:48:15','2020-12-02 13:04:51',554),(2,'deliver','123456','12345678901','',1,'2020-11-01','2020-11-10',0,NULL,NULL,0),(3,'manager','123456','18750916277','328092067@qq.com',1,'1999-04-12','2020-11-10',0,'2020-11-21 21:55:46','2020-11-21 21:55:54',2),(4,'grant','123456','11111111111','',0,'1999-04-12','2020-11-11',0,'2020-11-20 16:27:59','2020-11-20 16:27:38',2),(5,'test4','123456','11111111111','',0,NULL,'2020-11-11',0,NULL,NULL,0),(7,'test6','123456','11111111111','',0,NULL,'2020-11-11',0,NULL,NULL,0),(8,'test7','123456','11111111111','',0,NULL,'2020-11-11',0,NULL,NULL,0),(9,'test8','123456','11111111111','',0,NULL,'2020-11-11',0,'2020-11-17 12:58:25','2020-11-17 12:58:33',1),(10,'test9','123456','11111111111','',0,NULL,'2020-11-11',0,NULL,NULL,0),(11,'test10','123456','11111111111','',0,NULL,'2020-11-11',0,'2020-11-15 14:12:37','2020-11-15 14:12:47',1),(12,'新增用户','123456','12345678900','',0,NULL,'2020-11-12',0,NULL,NULL,0),(13,'sss','123','111',NULL,0,NULL,NULL,0,NULL,NULL,0),(14,'konijiwa','123123','12312312311',NULL,0,NULL,'2020-11-19',0,'2020-11-19 15:19:01',NULL,1);

/*Table structure for table `sudi_user_role` */

DROP TABLE IF EXISTS `sudi_user_role`;

CREATE TABLE `sudi_user_role` (
  `userId` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sudi_user_role` */

insert  into `sudi_user_role`(`userId`,`roleId`) values (11,5),(1,1),(1,5),(5,2),(7,2),(8,2),(13,2),(9,2),(12,2),(14,1),(3,1),(3,3),(4,1),(4,4),(2,1),(14,2),(2,2);

/*Table structure for table `sudi_view_attr_value` */

DROP TABLE IF EXISTS `sudi_view_attr_value`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_attr_value` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_attr_value` */;

/*!50001 CREATE TABLE  `sudi_view_attr_value`(
 `foodattrName` varchar(60) ,
 `foodvalueId` bigint(20) ,
 `foodattrId` bigint(20) ,
 `foodId` bigint(20) ,
 `foodvalueName` varchar(60) 
)*/;

/*Table structure for table `sudi_view_comment` */

DROP TABLE IF EXISTS `sudi_view_comment`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_comment` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_comment` */;

/*!50001 CREATE TABLE  `sudi_view_comment`(
 `commentId` bigint(20) ,
 `userId` bigint(20) ,
 `commentScore` decimal(5,2) ,
 `commentContent` varchar(255) ,
 `commentTime` datetime ,
 `orderdetailId` bigint(20) ,
 `orderId` varchar(20) ,
 `amount` int(11) ,
 `itemPrice` decimal(5,2) ,
 `comment` int(2) ,
 `skuId` bigint(20) ,
 `skuName` varchar(255) ,
 `skuPrice` decimal(5,2) ,
 `skuSale` int(11) ,
 `skuStock` int(11) ,
 `foodId` bigint(20) ,
 `foodName` varchar(80) ,
 `foodTypeId` bigint(20) ,
 `foodIngredient` varchar(255) ,
 `foodVegon` varchar(60) ,
 `foodCookWay` varchar(60) ,
 `foodFaultCount` int(11) ,
 `foodDesc` varchar(255) ,
 `foodImage` varchar(255) ,
 `foodSaleCount` int(11) ,
 `foodViewCount` int(11) ,
 `foodScore` decimal(5,2) ,
 `commentCount` int(11) ,
 `recommend` int(11) ,
 `hotSale` int(11) ,
 `foodStatus` int(11) ,
 `lastModifyBy` varchar(60) ,
 `lastModifyTime` datetime ,
 `typeId` bigint(20) ,
 `typeName` varchar(60) ,
 `typeDesc` varchar(255) ,
 `typeStatus` int(11) 
)*/;

/*Table structure for table `sudi_view_complaint` */

DROP TABLE IF EXISTS `sudi_view_complaint`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_complaint` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_complaint` */;

/*!50001 CREATE TABLE  `sudi_view_complaint`(
 `complaintId` bigint(20) ,
 `userId` bigint(20) ,
 `orderId` varchar(20) ,
 `complaintType` int(11) ,
 `target` varchar(120) ,
 `complaintContent` varchar(255) ,
 `complaintTime` datetime ,
 `username` varchar(60) 
)*/;

/*Table structure for table `sudi_view_deliver` */

DROP TABLE IF EXISTS `sudi_view_deliver`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_deliver` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_deliver` */;

/*!50001 CREATE TABLE  `sudi_view_deliver`(
 `deliverId` varchar(16) ,
 `realName` varchar(30) ,
 `imageUrl` varchar(255) ,
 `orderCount` int(11) ,
 `faultCount` int(11) ,
 `finishCount` int(11) ,
 `joinDate` date ,
 `leaveDate` date ,
 `remark` varchar(255) ,
 `userId` bigint(20) ,
 `username` varchar(60) ,
 `password` varchar(60) ,
 `phone` varchar(20) ,
 `email` varchar(60) ,
 `gender` int(11) ,
 `birthday` date ,
 `registerDate` date ,
 `score` int(11) ,
 `lastLoginTime` datetime ,
 `lastLogoutTime` datetime ,
 `loginCount` int(11) 
)*/;

/*Table structure for table `sudi_view_foodsku` */

DROP TABLE IF EXISTS `sudi_view_foodsku`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_foodsku` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_foodsku` */;

/*!50001 CREATE TABLE  `sudi_view_foodsku`(
 `skuId` bigint(20) ,
 `skuName` varchar(255) ,
 `skuPrice` decimal(5,2) ,
 `skuSale` int(11) ,
 `skuStock` int(11) ,
 `foodId` bigint(20) ,
 `foodName` varchar(80) ,
 `foodTypeId` bigint(20) ,
 `foodIngredient` varchar(255) ,
 `foodVegon` varchar(60) ,
 `foodCookWay` varchar(60) ,
 `foodFaultCount` int(11) ,
 `foodDesc` varchar(255) ,
 `foodImage` varchar(255) ,
 `foodSaleCount` int(11) ,
 `foodViewCount` int(11) ,
 `foodScore` decimal(5,2) ,
 `commentCount` int(11) ,
 `recommend` int(11) ,
 `hotSale` int(11) ,
 `foodStatus` int(11) ,
 `lastModifyBy` varchar(60) ,
 `lastModifyTime` datetime ,
 `typeId` bigint(20) ,
 `typeName` varchar(60) ,
 `typeDesc` varchar(255) ,
 `typeStatus` int(11) 
)*/;

/*Table structure for table `sudi_view_foodspu` */

DROP TABLE IF EXISTS `sudi_view_foodspu`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_foodspu` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_foodspu` */;

/*!50001 CREATE TABLE  `sudi_view_foodspu`(
 `foodId` bigint(20) ,
 `foodName` varchar(80) ,
 `foodTypeId` bigint(20) ,
 `foodIngredient` varchar(255) ,
 `foodVegon` varchar(60) ,
 `foodCookWay` varchar(60) ,
 `foodFaultCount` int(11) ,
 `foodDesc` varchar(255) ,
 `foodImage` varchar(255) ,
 `foodSaleCount` int(11) ,
 `foodViewCount` int(11) ,
 `foodScore` decimal(5,2) ,
 `commentCount` int(11) ,
 `recommend` int(11) ,
 `hotSale` int(11) ,
 `foodStatus` int(11) ,
 `lastModifyBy` varchar(60) ,
 `lastModifyTime` datetime ,
 `typeId` bigint(20) ,
 `typeName` varchar(60) ,
 `typeDesc` varchar(255) ,
 `typeStatus` int(11) 
)*/;

/*Table structure for table `sudi_view_orderdetail` */

DROP TABLE IF EXISTS `sudi_view_orderdetail`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_orderdetail` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_orderdetail` */;

/*!50001 CREATE TABLE  `sudi_view_orderdetail`(
 `orderdetailId` bigint(20) ,
 `orderId` varchar(20) ,
 `amount` int(11) ,
 `itemPrice` decimal(5,2) ,
 `comment` int(2) ,
 `skuId` bigint(20) ,
 `skuName` varchar(255) ,
 `skuPrice` decimal(5,2) ,
 `skuSale` int(11) ,
 `skuStock` int(11) ,
 `foodId` bigint(20) ,
 `foodName` varchar(80) ,
 `foodTypeId` bigint(20) ,
 `foodIngredient` varchar(255) ,
 `foodVegon` varchar(60) ,
 `foodCookWay` varchar(60) ,
 `foodFaultCount` int(11) ,
 `foodDesc` varchar(255) ,
 `foodImage` varchar(255) ,
 `foodSaleCount` int(11) ,
 `foodViewCount` int(11) ,
 `foodScore` decimal(5,2) ,
 `commentCount` int(11) ,
 `recommend` int(11) ,
 `hotSale` int(11) ,
 `foodStatus` int(11) ,
 `lastModifyBy` varchar(60) ,
 `lastModifyTime` datetime ,
 `typeId` bigint(20) ,
 `typeName` varchar(60) ,
 `typeDesc` varchar(255) ,
 `typeStatus` int(11) 
)*/;

/*Table structure for table `sudi_view_shopcart` */

DROP TABLE IF EXISTS `sudi_view_shopcart`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_shopcart` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_shopcart` */;

/*!50001 CREATE TABLE  `sudi_view_shopcart`(
 `shopcartId` bigint(20) ,
 `userId` bigint(20) ,
 `numCount` int(11) ,
 `skuId` bigint(20) ,
 `skuName` varchar(255) ,
 `skuPrice` decimal(5,2) ,
 `skuSale` int(11) ,
 `skuStock` int(11) ,
 `foodId` bigint(20) ,
 `foodName` varchar(80) ,
 `foodTypeId` bigint(20) ,
 `foodIngredient` varchar(255) ,
 `foodVegon` varchar(60) ,
 `foodCookWay` varchar(60) ,
 `foodFaultCount` int(11) ,
 `foodDesc` varchar(255) ,
 `foodImage` varchar(255) ,
 `foodSaleCount` int(11) ,
 `foodViewCount` int(11) ,
 `foodScore` decimal(5,2) ,
 `commentCount` int(11) ,
 `recommend` int(11) ,
 `hotSale` int(11) ,
 `foodStatus` int(11) ,
 `lastModifyBy` varchar(60) ,
 `lastModifyTime` datetime ,
 `typeId` bigint(20) ,
 `typeName` varchar(60) ,
 `typeDesc` varchar(255) ,
 `typeStatus` int(11) 
)*/;

/*Table structure for table `sudi_view_ticket` */

DROP TABLE IF EXISTS `sudi_view_ticket`;

/*!50001 DROP VIEW IF EXISTS `sudi_view_ticket` */;
/*!50001 DROP TABLE IF EXISTS `sudi_view_ticket` */;

/*!50001 CREATE TABLE  `sudi_view_ticket`(
 `ticketId` bigint(20) ,
 `userId` bigint(20) ,
 `startTime` date ,
 `endTime` date ,
 `ticketStatus` int(11) ,
 `ticketTypeId` bigint(20) ,
 `ticketName` varchar(120) ,
 `requirement` decimal(5,2) ,
 `cheap` decimal(5,2) ,
 `ticketNum` int(11) ,
 `receive` int(11) ,
 `liveTime` int(11) ,
 `lastModifyBy` varchar(60) ,
 `lastModifyTime` datetime ,
 `ticketTypeStatus` int(11) ,
 `needScore` int(11) ,
 `username` varchar(60) 
)*/;

/*View structure for view sudi_view_attr_value */

/*!50001 DROP TABLE IF EXISTS `sudi_view_attr_value` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_attr_value` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_attr_value` AS select `a`.`foodattrName` AS `foodattrName`,`v`.`foodvalueId` AS `foodvalueId`,`v`.`foodattrId` AS `foodattrId`,`v`.`foodId` AS `foodId`,`v`.`foodvalueName` AS `foodvalueName` from (`sudi_foodvalue` `v` left join `sudi_foodattr` `a` on((`a`.`foodattrId` = `v`.`foodattrId`))) */;

/*View structure for view sudi_view_comment */

/*!50001 DROP TABLE IF EXISTS `sudi_view_comment` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_comment` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_comment` AS select `c`.`commentId` AS `commentId`,`c`.`userId` AS `userId`,`c`.`commentScore` AS `commentScore`,`c`.`commentContent` AS `commentContent`,`c`.`commentTime` AS `commentTime`,`od`.`orderdetailId` AS `orderdetailId`,`od`.`orderId` AS `orderId`,`od`.`amount` AS `amount`,`od`.`itemPrice` AS `itemPrice`,`od`.`comment` AS `comment`,`od`.`skuId` AS `skuId`,`od`.`skuName` AS `skuName`,`od`.`skuPrice` AS `skuPrice`,`od`.`skuSale` AS `skuSale`,`od`.`skuStock` AS `skuStock`,`od`.`foodId` AS `foodId`,`od`.`foodName` AS `foodName`,`od`.`foodTypeId` AS `foodTypeId`,`od`.`foodIngredient` AS `foodIngredient`,`od`.`foodVegon` AS `foodVegon`,`od`.`foodCookWay` AS `foodCookWay`,`od`.`foodFaultCount` AS `foodFaultCount`,`od`.`foodDesc` AS `foodDesc`,`od`.`foodImage` AS `foodImage`,`od`.`foodSaleCount` AS `foodSaleCount`,`od`.`foodViewCount` AS `foodViewCount`,`od`.`foodScore` AS `foodScore`,`od`.`commentCount` AS `commentCount`,`od`.`recommend` AS `recommend`,`od`.`hotSale` AS `hotSale`,`od`.`foodStatus` AS `foodStatus`,`od`.`lastModifyBy` AS `lastModifyBy`,`od`.`lastModifyTime` AS `lastModifyTime`,`od`.`typeId` AS `typeId`,`od`.`typeName` AS `typeName`,`od`.`typeDesc` AS `typeDesc`,`od`.`typeStatus` AS `typeStatus` from (`sudi_comment` `c` left join `sudi_view_orderdetail` `od` on((`c`.`orderDetailId` = `od`.`orderdetailId`))) */;

/*View structure for view sudi_view_complaint */

/*!50001 DROP TABLE IF EXISTS `sudi_view_complaint` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_complaint` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_complaint` AS select `c`.`complaintId` AS `complaintId`,`c`.`userId` AS `userId`,`c`.`orderId` AS `orderId`,`c`.`complaintType` AS `complaintType`,`c`.`target` AS `target`,`c`.`complaintContent` AS `complaintContent`,`c`.`complaintTime` AS `complaintTime`,`u`.`username` AS `username` from (`sudi_complaint` `c` left join `sudi_user` `u` on((`c`.`userId` = `u`.`userId`))) */;

/*View structure for view sudi_view_deliver */

/*!50001 DROP TABLE IF EXISTS `sudi_view_deliver` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_deliver` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_deliver` AS select `d`.`deliverId` AS `deliverId`,`d`.`realName` AS `realName`,`d`.`imageUrl` AS `imageUrl`,`d`.`orderCount` AS `orderCount`,`d`.`faultCount` AS `faultCount`,`d`.`finishCount` AS `finishCount`,`d`.`joinDate` AS `joinDate`,`d`.`leaveDate` AS `leaveDate`,`d`.`remark` AS `remark`,`u`.`userId` AS `userId`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`phone` AS `phone`,`u`.`email` AS `email`,`u`.`gender` AS `gender`,`u`.`birthday` AS `birthday`,`u`.`registerDate` AS `registerDate`,`u`.`score` AS `score`,`u`.`lastLoginTime` AS `lastLoginTime`,`u`.`lastLogoutTime` AS `lastLogoutTime`,`u`.`loginCount` AS `loginCount` from (`sudi_deliver` `d` left join `sudi_user` `u` on((`d`.`userId` = `u`.`userId`))) */;

/*View structure for view sudi_view_foodsku */

/*!50001 DROP TABLE IF EXISTS `sudi_view_foodsku` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_foodsku` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_foodsku` AS select `sku`.`skuId` AS `skuId`,`sku`.`skuName` AS `skuName`,`sku`.`skuPrice` AS `skuPrice`,`sku`.`skuSale` AS `skuSale`,`sku`.`skuStock` AS `skuStock`,`spu`.`foodId` AS `foodId`,`spu`.`foodName` AS `foodName`,`spu`.`foodTypeId` AS `foodTypeId`,`spu`.`foodIngredient` AS `foodIngredient`,`spu`.`foodVegon` AS `foodVegon`,`spu`.`foodCookWay` AS `foodCookWay`,`spu`.`foodFaultCount` AS `foodFaultCount`,`spu`.`foodDesc` AS `foodDesc`,`spu`.`foodImage` AS `foodImage`,`spu`.`foodSaleCount` AS `foodSaleCount`,`spu`.`foodViewCount` AS `foodViewCount`,`spu`.`foodScore` AS `foodScore`,`spu`.`commentCount` AS `commentCount`,`spu`.`recommend` AS `recommend`,`spu`.`hotSale` AS `hotSale`,`spu`.`foodStatus` AS `foodStatus`,`spu`.`lastModifyBy` AS `lastModifyBy`,`spu`.`lastModifyTime` AS `lastModifyTime`,`spu`.`typeId` AS `typeId`,`spu`.`typeName` AS `typeName`,`spu`.`typeDesc` AS `typeDesc`,`spu`.`typeStatus` AS `typeStatus` from (`sudi_foodsku` `sku` left join `sudi_view_foodspu` `spu` on((`sku`.`foodId` = `spu`.`foodId`))) */;

/*View structure for view sudi_view_foodspu */

/*!50001 DROP TABLE IF EXISTS `sudi_view_foodspu` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_foodspu` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_foodspu` AS select `f`.`foodId` AS `foodId`,`f`.`foodName` AS `foodName`,`f`.`foodTypeId` AS `foodTypeId`,`f`.`foodIngredient` AS `foodIngredient`,`f`.`foodVegon` AS `foodVegon`,`f`.`foodCookWay` AS `foodCookWay`,`f`.`foodFaultCount` AS `foodFaultCount`,`f`.`foodDesc` AS `foodDesc`,`f`.`foodImage` AS `foodImage`,`f`.`foodSaleCount` AS `foodSaleCount`,`f`.`foodViewCount` AS `foodViewCount`,`f`.`foodScore` AS `foodScore`,`f`.`commentCount` AS `commentCount`,`f`.`recommend` AS `recommend`,`f`.`hotSale` AS `hotSale`,`f`.`foodStatus` AS `foodStatus`,`f`.`lastModifyBy` AS `lastModifyBy`,`f`.`lastModifyTime` AS `lastModifyTime`,`ft`.`typeId` AS `typeId`,`ft`.`typeName` AS `typeName`,`ft`.`typeDesc` AS `typeDesc`,`ft`.`typeStatus` AS `typeStatus` from (`sudi_food` `f` left join `sudi_foodtype` `ft` on((`ft`.`typeId` = `f`.`foodTypeId`))) */;

/*View structure for view sudi_view_orderdetail */

/*!50001 DROP TABLE IF EXISTS `sudi_view_orderdetail` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_orderdetail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_orderdetail` AS select `od`.`orderDetailId` AS `orderdetailId`,`od`.`orderId` AS `orderId`,`od`.`amount` AS `amount`,`od`.`itemPrice` AS `itemPrice`,`od`.`comment` AS `comment`,`s`.`skuId` AS `skuId`,`s`.`skuName` AS `skuName`,`s`.`skuPrice` AS `skuPrice`,`s`.`skuSale` AS `skuSale`,`s`.`skuStock` AS `skuStock`,`s`.`foodId` AS `foodId`,`s`.`foodName` AS `foodName`,`s`.`foodTypeId` AS `foodTypeId`,`s`.`foodIngredient` AS `foodIngredient`,`s`.`foodVegon` AS `foodVegon`,`s`.`foodCookWay` AS `foodCookWay`,`s`.`foodFaultCount` AS `foodFaultCount`,`s`.`foodDesc` AS `foodDesc`,`s`.`foodImage` AS `foodImage`,`s`.`foodSaleCount` AS `foodSaleCount`,`s`.`foodViewCount` AS `foodViewCount`,`s`.`foodScore` AS `foodScore`,`s`.`commentCount` AS `commentCount`,`s`.`recommend` AS `recommend`,`s`.`hotSale` AS `hotSale`,`s`.`foodStatus` AS `foodStatus`,`s`.`lastModifyBy` AS `lastModifyBy`,`s`.`lastModifyTime` AS `lastModifyTime`,`s`.`typeId` AS `typeId`,`s`.`typeName` AS `typeName`,`s`.`typeDesc` AS `typeDesc`,`s`.`typeStatus` AS `typeStatus` from (`sudi_orderdetail` `od` left join `sudi_view_foodsku` `s` on((`od`.`skuId` = `s`.`skuId`))) */;

/*View structure for view sudi_view_shopcart */

/*!50001 DROP TABLE IF EXISTS `sudi_view_shopcart` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_shopcart` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_shopcart` AS select `s`.`shopcartId` AS `shopcartId`,`s`.`userId` AS `userId`,`s`.`numCount` AS `numCount`,`sku`.`skuId` AS `skuId`,`sku`.`skuName` AS `skuName`,`sku`.`skuPrice` AS `skuPrice`,`sku`.`skuSale` AS `skuSale`,`sku`.`skuStock` AS `skuStock`,`sku`.`foodId` AS `foodId`,`sku`.`foodName` AS `foodName`,`sku`.`foodTypeId` AS `foodTypeId`,`sku`.`foodIngredient` AS `foodIngredient`,`sku`.`foodVegon` AS `foodVegon`,`sku`.`foodCookWay` AS `foodCookWay`,`sku`.`foodFaultCount` AS `foodFaultCount`,`sku`.`foodDesc` AS `foodDesc`,`sku`.`foodImage` AS `foodImage`,`sku`.`foodSaleCount` AS `foodSaleCount`,`sku`.`foodViewCount` AS `foodViewCount`,`sku`.`foodScore` AS `foodScore`,`sku`.`commentCount` AS `commentCount`,`sku`.`recommend` AS `recommend`,`sku`.`hotSale` AS `hotSale`,`sku`.`foodStatus` AS `foodStatus`,`sku`.`lastModifyBy` AS `lastModifyBy`,`sku`.`lastModifyTime` AS `lastModifyTime`,`sku`.`typeId` AS `typeId`,`sku`.`typeName` AS `typeName`,`sku`.`typeDesc` AS `typeDesc`,`sku`.`typeStatus` AS `typeStatus` from (`sudi_shopcart` `s` left join `sudi_view_foodsku` `sku` on((`sku`.`skuId` = `s`.`skuId`))) */;

/*View structure for view sudi_view_ticket */

/*!50001 DROP TABLE IF EXISTS `sudi_view_ticket` */;
/*!50001 DROP VIEW IF EXISTS `sudi_view_ticket` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sudi_view_ticket` AS select `t`.`ticketId` AS `ticketId`,`t`.`userId` AS `userId`,`t`.`startTime` AS `startTime`,`t`.`endTime` AS `endTime`,`t`.`ticketStatus` AS `ticketStatus`,`tt`.`ticketTypeId` AS `ticketTypeId`,`tt`.`ticketName` AS `ticketName`,`tt`.`requirement` AS `requirement`,`tt`.`cheap` AS `cheap`,`tt`.`ticketNum` AS `ticketNum`,`tt`.`receive` AS `receive`,`tt`.`liveTime` AS `liveTime`,`tt`.`lastModifyBy` AS `lastModifyBy`,`tt`.`lastModifyTime` AS `lastModifyTime`,`tt`.`ticketTypeStatus` AS `ticketTypeStatus`,`tt`.`needScore` AS `needScore`,`u`.`username` AS `username` from ((`sudi_ticket` `t` left join `sudi_tickettype` `tt` on((`t`.`ticketTypeId` = `tt`.`ticketTypeId`))) left join `sudi_user` `u` on((`u`.`userId` = `t`.`userId`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
