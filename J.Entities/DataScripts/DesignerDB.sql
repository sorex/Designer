-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 06 月 12 日 15:36
-- 服务器版本: 5.5.32
-- PHP 版本: 5.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

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
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('17e6a0ee06504d4482e6cf34a8bee546', 'ShortRNeck', '绿色', '00ff00', b'0', 0),
('22b3beef5fc042adbb761bf740da92bb', 'ShortRNeck', '黑色', '000000', b'0', 0),
('2d35bfc57cb04d259a501934c9cb2dbb', 'LongVNeck', '黑色', '000000', b'0', 1),
('3974d3d0e3d04b36aab2940d5cef70c0', 'ShortVNeck', '白色', 'ffffff', b'1', 1),
('3b71dbd2136840299affa832682ba1d7', 'LongVNeck', '绿色', '00ff00', b'0', 1),
('455c42eb011f42be800101fab0291187', 'LongRNeck', '白色', 'ffffff', b'1', 1),
('6286377937394dff902d658a39d7161b', 'ShortRNeck', '蓝色', '0000ff', b'0', 1),
('69d107839ad940cd94fb433b4ab0f217', 'LongRNeck', '蓝色', '0000ff', b'0', 1),
('6f679700555f4f23b28b8087d4d4c418', 'LongRNeck', '黑色', '000000', b'0', 1),
('85116c4e9751427aafe0124735086ac0', 'ShortVNeck', '蓝色', '0000ff', b'0', 1),
('89d8d523458f4a6ea3f5577cde82eb7c', 'ShortVNeck', '黑色', '000000', b'0', 1),
('c2b564b2e69c4c9f9fe9d8879f5d2ff9', 'ShortRNeck', '红色', 'ff0000', b'0', 1),
('c73b496c4bf347b2a9553ccca317a57d', 'ShortVNeck', '红色', 'ff0000', b'0', 1),
('c8ae37eed2af4fbcb050ba2f48c536cc', 'LongRNeck', '绿色', '00ff00', b'0', 1),
('cfdc884ecba041b594cd33392abb7ffa', 'LongRNeck', '红色', 'ff0000', b'0', 1),
('d13361dcf50e4406bed0cfd0a203fa15', 'LongVNeck', '白色', 'ffffff', b'1', 1),
('e07e6f0cd66d4656bb1866715caaa43e', 'LongVNeck', '蓝色', '0000ff', b'0', 1),
('e5e682d606d7454088df9d56e1b9a257', 'LongVNeck', '红色', 'ff0000', b'0', 1),
('f1b436a8973e41fb8f93bd616331d1b2', 'ShortRNeck', '白色', 'ffffff', b'1', 1),
('f9e8870e0e034868b6691e91c3bcf45b', 'ShortVNeck', '绿色', '00ff00', b'0', 1);

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
('13693fbb296d48e5b0892b4704a5e61f', 'ShortRNeck', '正面', 1, '01.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('5cd6d4eeb3a54573a6af64adb2482fe0', 'ShortVNeck', '正面', 1, '01.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('7faee0a6e75141faa33e19d22889539c', 'LongRNeck', '正面', 1, '01.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('a43d06771c934016a0928026a956c924', 'ShortRNeck', '反面', 2, '02.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('cb5c8686fb174befb5a67613ced100cc', 'LongVNeck', '反面', 2, '02.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('cd9ea4742a094d269e5c6e8fec53e802', 'LongVNeck', '正面', 1, '01.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('f4bfa0c52531431887b61011d9269c4f', 'ShortVNeck', '反面', 2, '02.png', 550, 650, 165, 155, 842, 1190, '0.28500000'),
('fcc26dd512b24d82a98e6cca38a881a3', 'LongRNeck', '反面', 2, '02.png', 550, 650, 165, 155, 842, 1190, '0.28500000');

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
('LongRNeck', 'TShirt', '长袖圆领', '40.00000000', '详细', 2, 1),
('LongVNeck', 'TShirt', '长袖V领', '40.00000000', '详细', 2, 1),
('ShortRNeck', 'TShirt', '短袖圆领', '40.00000000', '详细', 2, 1),
('ShortVNeck', 'TShirt', '短袖V领', '40.00000000', '详细', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `materialsizes`
--

CREATE TABLE IF NOT EXISTS `materialsizes` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `SizeName` varchar(200) NOT NULL,
  `IsDefault` bit(1) NOT NULL,
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('Clothes', NULL, 1, '上衣', b'0', 1),
('TShirt', 'Clothes', 2, 'T恤', b'1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `GUID` varchar(200) NOT NULL,
  `OrderID` varchar(200) NOT NULL,
  `Size` varchar(200) DEFAULT NULL COMMENT '尺码',
  `Number` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`GUID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `GUID` varchar(200) NOT NULL,
  `UserID` varchar(200) NOT NULL,
  `DesignWorkID` varchar(200) NOT NULL COMMENT '设计ID',
  `State` int(11) NOT NULL COMMENT '状态\r\n1：等待买家付款\r\n2：买家已付款，等待卖家发货\r\n3：卖家已发货，等待买家确认\r\n4：交易成功结束\r\n5：交易中途关闭(已结束，未成功完成)',
  `RefundState` int(11) DEFAULT NULL COMMENT '退款状态\r\n0：未发生退款\r\n1：退款协议等待卖家确认中\r\n2：卖家不同意协议，等待买家修改\r\n3：退款成功\r\n4：退款关闭',
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
  `Quantity` int(11) DEFAULT NULL COMMENT '数量',
  `Body` varchar(4000) DEFAULT NULL COMMENT '商品描述',
  `Consignee` varchar(200) DEFAULT NULL COMMENT '收件人姓名',
  `Address` varchar(200) DEFAULT NULL COMMENT '收件地址',
  `ZipCode` varchar(200) DEFAULT NULL COMMENT '邮编',
  `Mobile` varchar(200) DEFAULT NULL COMMENT '手机号',
  `Phone` varchar(200) DEFAULT NULL COMMENT '座机号',
  `PayType` int(11) DEFAULT NULL COMMENT '支付平台\r\n1：Alipay',
  `PayOrderNo` varchar(200) DEFAULT NULL COMMENT '支付平台内流水号',
  PRIMARY KEY (`GUID`),
  KEY `DesignWorkID` (`DesignWorkID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD CONSTRAINT `designworks_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

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
