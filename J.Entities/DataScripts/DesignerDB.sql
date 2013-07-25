-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 07 月 25 日 09:19
-- 服务器版本: 5.5.32
-- PHP 版本: 5.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `designerdb`
--
CREATE DATABASE IF NOT EXISTS `designerdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `designerdb`;

-- --------------------------------------------------------

--
-- 表的结构 `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `GUID` varchar(200) NOT NULL,
  `UserID` varchar(200) NOT NULL,
  `Consignee` varchar(200) NOT NULL COMMENT '收货人',
  `Province` varchar(200) NOT NULL COMMENT '省',
  `City` varchar(200) NOT NULL COMMENT '市',
  `County` varchar(200) NOT NULL COMMENT '区/县',
  `StreetAddress` varchar(1000) NOT NULL COMMENT '街道地址',
  `ZipCode` varchar(200) NOT NULL COMMENT '邮编',
  `Mobile` varchar(200) NOT NULL COMMENT '手机号码',
  `Phone` varchar(200) NOT NULL COMMENT '电话号码',
  `IsDefault` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否默认地址',
  PRIMARY KEY (`GUID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `designworks`
--

CREATE TABLE IF NOT EXISTS `designworks` (
  `GUID` varchar(200) NOT NULL,
  `DesignerID` varchar(200) NOT NULL COMMENT '设计者ID',
  `MaterialID` varchar(200) NOT NULL COMMENT '原料ID',
  `MaterialColorID` varchar(200) NOT NULL COMMENT '原料颜色ID',
  `SalesGoal` int(11) NOT NULL COMMENT '销售目标',
  `BasePrice` decimal(18,8) NOT NULL COMMENT '底价/单件',
  `SellingPrice` decimal(18,8) NOT NULL COMMENT '售价/单件',
  `StartTime` datetime NOT NULL COMMENT '创建时间/活动开始时间',
  `EndTime` datetime NOT NULL COMMENT '活动截止时间',
  `Title` varchar(200) NOT NULL COMMENT '活动标题',
  `Description` varchar(4000) NOT NULL COMMENT '活动说明',
  `Url` varchar(200) DEFAULT NULL COMMENT 'Url',
  `SalesVolume` int(11) DEFAULT NULL COMMENT '销售量/统计值',
  `State` int(11) NOT NULL COMMENT '状态\r\n-1：预售不足\r\n0：设计中\r\n1：预售中\r\n2：生产中\r\n3：发货中\r\n4：收款中\r\n5：返款中\r\n6：归档',
  `ProcurementCost` decimal(18,8) DEFAULT NULL COMMENT '采购成本',
  `ProductionCost` decimal(18,8) DEFAULT NULL COMMENT '生产成本',
  `SendCost` decimal(18,8) DEFAULT NULL COMMENT '发货成本',
  `CompletionTime` datetime DEFAULT NULL COMMENT '所有交易完成时间',
  PRIMARY KEY (`GUID`),
  KEY `DesignerID` (`DesignerID`),
  KEY `MaterialID` (`MaterialID`),
  KEY `MaterialColorID` (`MaterialColorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `designworks`
--

INSERT INTO `designworks` (`GUID`, `DesignerID`, `MaterialID`, `MaterialColorID`, `SalesGoal`, `BasePrice`, `SellingPrice`, `StartTime`, `EndTime`, `Title`, `Description`, `Url`, `SalesVolume`, `State`, `ProcurementCost`, `ProductionCost`, `SendCost`, `CompletionTime`) VALUES
('7aa703935f244e53add6d53ea24d5b7a', '9ece1f8700bb4dd38832f14e4b480107', 'shortvneck', 'f9e8870e0e034868b6691e91c3bcf45b', 50, '35.00000000', '44.00000000', '2013-07-17 20:49:41', '2013-07-24 20:49:41', 'Test', 'Test', '', 0, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `materialcolors`
--

CREATE TABLE IF NOT EXISTS `materialcolors` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `ColorName` varchar(200) NOT NULL,
  `ColorCode` varchar(200) NOT NULL,
  `IsDefault` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否是默认颜色',
  `State` int(11) NOT NULL COMMENT '状态\r\n0：停产\r\n1：正常\r\n2：缺货',
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `materialcolors`
--

INSERT INTO `materialcolors` (`GUID`, `MaterialID`, `ColorName`, `ColorCode`, `IsDefault`, `State`) VALUES
('17e6a0ee06504d4482e6cf34a8bee546', 'shortrneck', '绿色', '00ff00', b'0', 0),
('22b3beef5fc042adbb761bf740da92bb', 'shortrneck', '黑色', '000000', b'0', 0),
('2d35bfc57cb04d259a501934c9cb2dbb', 'longvneck', '黑色', '000000', b'0', 1),
('3974d3d0e3d04b36aab2940d5cef70c0', 'shortvneck', '白色', 'ffffff', b'1', 1),
('3b71dbd2136840299affa832682ba1d7', 'longvneck', '绿色', '00ff00', b'0', 1),
('455c42eb011f42be800101fab0291187', 'longrneck', '白色', 'ffffff', b'1', 1),
('6286377937394dff902d658a39d7161b', 'shortrneck', '蓝色', '0000ff', b'0', 1),
('69d107839ad940cd94fb433b4ab0f217', 'longrneck', '蓝色', '0000ff', b'0', 1),
('6f679700555f4f23b28b8087d4d4c418', 'longrneck', '黑色', '000000', b'0', 1),
('85116c4e9751427aafe0124735086ac0', 'shortvneck', '蓝色', '0000ff', b'0', 1),
('89d8d523458f4a6ea3f5577cde82eb7c', 'shortvneck', '黑色', '000000', b'0', 1),
('c2b564b2e69c4c9f9fe9d8879f5d2ff9', 'shortrneck', '红色', 'ff0000', b'0', 1),
('c73b496c4bf347b2a9553ccca317a57d', 'shortvneck', '红色', 'ff0000', b'0', 1),
('c8ae37eed2af4fbcb050ba2f48c536cc', 'longrneck', '绿色', '00ff00', b'0', 1),
('cfdc884ecba041b594cd33392abb7ffa', 'longrneck', '红色', 'ff0000', b'0', 1),
('d13361dcf50e4406bed0cfd0a203fa15', 'longvneck', '白色', 'ffffff', b'1', 1),
('e07e6f0cd66d4656bb1866715caaa43e', 'longvneck', '蓝色', '0000ff', b'0', 1),
('e5e682d606d7454088df9d56e1b9a257', 'longvneck', '红色', 'ff0000', b'0', 1),
('f1b436a8973e41fb8f93bd616331d1b2', 'shortrneck', '白色', 'ffffff', b'1', 1),
('f9e8870e0e034868b6691e91c3bcf45b', 'shortvneck', '绿色', '00ff00', b'0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `materialpictures`
--

CREATE TABLE IF NOT EXISTS `materialpictures` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `Name` varchar(200) NOT NULL COMMENT '图片名称(例：正面，背面)',
  `Index` int(11) NOT NULL COMMENT '排列序号',
  `FileName` varchar(200) NOT NULL COMMENT '底图文件名',
  `Width` int(11) NOT NULL COMMENT '图片宽度',
  `Height` int(11) NOT NULL COMMENT '图片高度',
  `Top` int(11) NOT NULL COMMENT '上传图片距离上边界距离',
  `Left` int(11) NOT NULL COMMENT '上传图片距离左边界距离',
  `UploadWidth` int(11) NOT NULL COMMENT '上传图片宽度',
  `UploadHeight` int(11) NOT NULL COMMENT '上传图片高度',
  `ShowScale` decimal(18,8) NOT NULL COMMENT '显示时的缩放比例',
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `materialpictures`
--

INSERT INTO `materialpictures` (`GUID`, `MaterialID`, `Name`, `Index`, `FileName`, `Width`, `Height`, `Top`, `Left`, `UploadWidth`, `UploadHeight`, `ShowScale`) VALUES
('13693fbb296d48e5b0892b4704a5e61f', 'shortrneck', '正面', 1, '01.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('5cd6d4eeb3a54573a6af64adb2482fe0', 'shortvneck', '正面', 1, '01.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('7faee0a6e75141faa33e19d22889539c', 'longrneck', '正面', 1, '01.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('a43d06771c934016a0928026a956c924', 'shortrneck', '反面', 2, '02.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('cb5c8686fb174befb5a67613ced100cc', 'longvneck', '反面', 2, '02.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('cd9ea4742a094d269e5c6e8fec53e802', 'longvneck', '正面', 1, '01.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('f4bfa0c52531431887b61011d9269c4f', 'shortvneck', '反面', 2, '02.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('fcc26dd512b24d82a98e6cca38a881a3', 'longrneck', '反面', 2, '02.png', 550, 650, 165, 155, 842, 1190, '0.28500000');

-- --------------------------------------------------------

--
-- 表的结构 `materialpricelogs`
--

CREATE TABLE IF NOT EXISTS `materialpricelogs` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `Price` decimal(18,8) NOT NULL COMMENT '价格',
  `CreateTime` datetime NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `GUID` varchar(200) NOT NULL,
  `TypeID` varchar(200) NOT NULL COMMENT '类型\r\n1：短袖T恤\r\n2：长袖T恤\r\n3：背心\r\n4：连帽衫',
  `Name` varchar(200) NOT NULL COMMENT '原料编号',
  `Price` decimal(18,8) NOT NULL DEFAULT '0.00000000' COMMENT '目前均价',
  `Description` varchar(4000) NOT NULL,
  `PictureNumber` int(11) NOT NULL COMMENT '需要上传图片张数',
  `State` int(11) NOT NULL COMMENT '状态\r\n0：停产\r\n1：正常\r\n2：缺货\r\n3：停用/未启用',
  PRIMARY KEY (`GUID`),
  KEY `TypeID` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `materials`
--

INSERT INTO `materials` (`GUID`, `TypeID`, `Name`, `Price`, `Description`, `PictureNumber`, `State`) VALUES
('longrneck', 'tshirt', '长袖圆领', '40.00000000', '详细', 2, 1),
('longvneck', 'tshirt', '长袖V领', '40.00000000', '详细', 2, 1),
('shortrneck', 'tshirt', '短袖圆领', '40.00000000', '详细', 2, 1),
('shortvneck', 'tshirt', '短袖V领', '40.00000000', '详细', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `materialsizes`
--

CREATE TABLE IF NOT EXISTS `materialsizes` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `SizeName` varchar(200) NOT NULL,
  `Index` int(1) NOT NULL,
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `materialsizes`
--

INSERT INTO `materialsizes` (`GUID`, `MaterialID`, `SizeName`, `Index`) VALUES
('0aea20b3e393432480e34af50a0d03f1', 'shortrneck', 'XXXL', 6),
('0afa6b847ef748599dd8b6615f6e0073', 'longrneck', 'L', 3),
('24895233af8a4c51bcec3abcb369ef71', 'longvneck', 'M', 2),
('25c1674802cf432798653ceaadb1380a', 'longrneck', 'M', 2),
('30d19f76c7894437a9b996360e8a21ae', 'longvneck', 'XXL', 5),
('30eb2146efef493fbfc2b456915d1fa0', 'shortrneck', 'XXL', 5),
('47786f1477b14810a9cfe9742a540564', 'shortvneck', 'L', 3),
('527808531c4c4a17a7c68cbe61572f13', 'shortvneck', 'XXXL', 6),
('5591d8f8e7854dffa5a08006b7af65b6', 'longvneck', 'XXXL', 6),
('5cbee24fc5414dfb81ed304bcb25b180', 'shortrneck', 'L', 3),
('5d06b6a3e0df499bad870ce243fdb952', 'shortvneck', 'S', 1),
('62ba46cb6a0c4f5a99d47c8af0736a66', 'longvneck', 'XL', 4),
('68ed983e7dbb41e19c0609985925cb0c', 'shortrneck', 'M', 2),
('7470fd81281243cd969bf460133157cf', 'shortvneck', 'XL', 4),
('935f2711a7e24c17a661ac0bd155e025', 'longrneck', 'XXL', 5),
('9e89d438ef4148e5a703cbef343d205b', 'longrneck', 'XXXL', 6),
('a1030e3b60854fc69356d97d41251ec9', 'longvneck', 'S', 1),
('b5cd176b668b4a90a7d8c95babf567ce', 'shortvneck', 'M', 2),
('b64bac37616942b793990e0dfded1db8', 'shortrneck', 'S', 1),
('cae594d031404b23849d514b48237790', 'longrneck', 'XL', 4),
('cca01337e19a4b77b5a4477c0dcb2d38', 'longvneck', 'L', 3),
('da2890568bb3470db6b07064f90e618a', 'longrneck', 'S', 1),
('f4a1c19896f444d389b6b143e727dcbe', 'shortvneck', 'XXL', 5),
('fc7bc846866f4897a4f34c1502974125', 'shortrneck', 'XL', 4);

-- --------------------------------------------------------

--
-- 表的结构 `materialtypes`
--

CREATE TABLE IF NOT EXISTS `materialtypes` (
  `GUID` varchar(200) NOT NULL,
  `ParentID` varchar(200) DEFAULT NULL,
  `Index` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL COMMENT '类型名称',
  `IsLeafNode` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否是叶子节点',
  `State` int(11) NOT NULL COMMENT '状态\r\n0：停用\r\n1：正常\r\n',
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `materialtypes`
--

INSERT INTO `materialtypes` (`GUID`, `ParentID`, `Index`, `Name`, `IsLeafNode`, `State`) VALUES
('clothes', NULL, 1, '上衣', b'0', 1),
('tshirt', 'clothes', 2, 'T恤', b'1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `GUID` varchar(200) NOT NULL,
  `OrderID` varchar(200) NOT NULL,
  `SizeID` varchar(200) NOT NULL COMMENT '尺码',
  `SizeName` varchar(200) NOT NULL,
  `Quantity` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`GUID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `orderdetails`
--

INSERT INTO `orderdetails` (`GUID`, `OrderID`, `SizeID`, `SizeName`, `Quantity`) VALUES
('58e973f80c624702afcd4fd0e8fc5a87', 'c93571ac5b4a4d2183955d3b95b48094', '5d06b6a3e0df499bad870ce243fdb952', 'S', 1),
('e6c9b988cfef4067b306e87b6129c506', 'c93571ac5b4a4d2183955d3b95b48094', 'b5cd176b668b4a90a7d8c95babf567ce', 'M', 1);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `GUID` varchar(200) NOT NULL,
  `UserID` varchar(200) NOT NULL,
  `DesignWorkID` varchar(200) NOT NULL COMMENT '设计ID',
  `State` int(11) NOT NULL COMMENT '状态\r\n1：等待买家付款\r\n2：买家已付款，等待卖家发货\r\n3：卖家已发货，等待买家确认\r\n4：交易成功结束\r\n5：交易中途关闭(已结束，未成功完成)',
  `RefundState` int(11) NOT NULL COMMENT '退款状态\r\n0：未发生退款\r\n1：退款协议等待卖家确认中\r\n2：卖家不同意协议，等待买家修改\r\n3：退款成功\r\n4：退款关闭',
  `WaitBuyerPayTime` datetime DEFAULT NULL COMMENT '创建时间/等待买家付款时间',
  `WaitSellerSendGoodsTime` datetime DEFAULT NULL COMMENT '付款时间/买家已付款，等待卖家发货时间',
  `WaitBuyerConfirmGoodsTime` datetime DEFAULT NULL COMMENT '发货时间/卖家已发货，等待买家确认时间',
  `TradeFinishedTime` datetime DEFAULT NULL COMMENT '收款时间/交易成功结束时间',
  `TradeClosedTime` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `RefundWaitSellerAgreeTime` datetime DEFAULT NULL COMMENT '买家申请退款时间/退款协议等待卖家确认时间',
  `RefundSellerFefuseBuyerTime` datetime DEFAULT NULL COMMENT '卖家拒绝退款时间/等待买家修改时间',
  `RefundSuccessTime` datetime DEFAULT NULL COMMENT '退款成功时间',
  `RefundClosedTime` datetime DEFAULT NULL COMMENT '退款关闭时间',
  `Subject` varchar(200) NOT NULL COMMENT '商品名称',
  `Price` decimal(18,8) NOT NULL COMMENT '单价',
  `Quantity` int(11) NOT NULL COMMENT '数量',
  `Body` varchar(4000) DEFAULT NULL COMMENT '商品描述',
  `Consignee` varchar(200) DEFAULT NULL COMMENT '收件人姓名',
  `Address` varchar(200) DEFAULT NULL COMMENT '收件地址',
  `ZipCode` varchar(200) DEFAULT NULL COMMENT '邮编',
  `Mobile` varchar(200) DEFAULT NULL COMMENT '手机号',
  `Phone` varchar(200) DEFAULT NULL COMMENT '座机号',
  `ShippingMethod` varchar(200) DEFAULT NULL COMMENT '配送方式',
  `PayType` int(11) DEFAULT NULL COMMENT '支付平台\r\n1：Alipay',
  `PayOrderNo` varchar(200) DEFAULT NULL COMMENT '支付平台内流水号',
  PRIMARY KEY (`GUID`),
  KEY `DesignWorkID` (`DesignWorkID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`GUID`, `UserID`, `DesignWorkID`, `State`, `RefundState`, `WaitBuyerPayTime`, `WaitSellerSendGoodsTime`, `WaitBuyerConfirmGoodsTime`, `TradeFinishedTime`, `TradeClosedTime`, `RefundWaitSellerAgreeTime`, `RefundSellerFefuseBuyerTime`, `RefundSuccessTime`, `RefundClosedTime`, `Subject`, `Price`, `Quantity`, `Body`, `Consignee`, `Address`, `ZipCode`, `Mobile`, `Phone`, `ShippingMethod`, `PayType`, `PayOrderNo`) VALUES
('c93571ac5b4a4d2183955d3b95b48094', '9ece1f8700bb4dd38832f14e4b480107', '7aa703935f244e53add6d53ea24d5b7a', 0, 0, '2013-07-23 22:59:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test', '44.00000000', 2, '详细', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `singlelogin`
--

CREATE TABLE IF NOT EXISTS `singlelogin` (
  `GUID` varchar(200) NOT NULL,
  `UserID` varchar(200) NOT NULL,
  `LoginTime` datetime NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`GUID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `GUID` varchar(200) NOT NULL,
  `LoginName` varchar(200) NOT NULL COMMENT '登录名',
  `Email` varchar(200) NOT NULL COMMENT '邮箱，支付宝帐号，用于收款',
  `Password` varchar(200) NOT NULL COMMENT '密码',
  `StageName` varchar(200) NOT NULL COMMENT '艺名',
  `CreateTime` datetime NOT NULL COMMENT '用户注册时间',
  `State` int(11) NOT NULL COMMENT '状态\r\n0：禁用\r\n1：正常',
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`GUID`, `LoginName`, `Email`, `Password`, `StageName`, `CreateTime`, `State`) VALUES
('9ece1f8700bb4dd38832f14e4b480107', 'sorex@163.com', 'sorex@163.com', '8XGy06XKv+5g75/xEbvpwQ==', 'sorex', '2013-06-01 21:35:12', 0);

--
-- 限制导出的表
--

--
-- 限制表 `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`GUID`);

--
-- 限制表 `designworks`
--
ALTER TABLE `designworks`
  ADD CONSTRAINT `designworks_ibfk_1` FOREIGN KEY (`DesignerID`) REFERENCES `users` (`GUID`),
  ADD CONSTRAINT `designworks_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`),
  ADD CONSTRAINT `designworks_ibfk_3` FOREIGN KEY (`MaterialColorID`) REFERENCES `materialcolors` (`GUID`);

--
-- 限制表 `materialcolors`
--
ALTER TABLE `materialcolors`
  ADD CONSTRAINT `materialcolors_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

--
-- 限制表 `materialpictures`
--
ALTER TABLE `materialpictures`
  ADD CONSTRAINT `materialpictures_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

--
-- 限制表 `materialpricelogs`
--
ALTER TABLE `materialpricelogs`
  ADD CONSTRAINT `materialpricelogs_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

--
-- 限制表 `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `materialtypes` (`GUID`);

--
-- 限制表 `materialsizes`
--
ALTER TABLE `materialsizes`
  ADD CONSTRAINT `materialsizes_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

--
-- 限制表 `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`GUID`);

--
-- 限制表 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`DesignWorkID`) REFERENCES `designworks` (`GUID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`GUID`);

--
-- 限制表 `singlelogin`
--
ALTER TABLE `singlelogin`
  ADD CONSTRAINT `singlelogin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`GUID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
