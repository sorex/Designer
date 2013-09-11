-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 09 月 11 日 15:49
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

--
-- 转存表中的数据 `addresses`
--

INSERT INTO `addresses` (`GUID`, `UserID`, `Consignee`, `Province`, `City`, `County`, `StreetAddress`, `ZipCode`, `Mobile`, `Phone`, `IsDefault`) VALUES
('1e5dfe31d9ec478abcac8da9518f867d', '9ece1f8700bb4dd38832f14e4b480107', 'Jasper', 'hubei', 'wuhan ', 'qingshang', 'This is the test addresses', '400000', '18061234567', '', b'1'),
('5a3055278883456ab09a5bf12c7ec254', '9ece1f8700bb4dd38832f14e4b480107', 'Jasper', '湖北省', '武汉市', '青山区', '这是一个测试的地址', '400000', '18067654321', '027-88888888', b'0');

-- --------------------------------------------------------

--
-- 表的结构 `designworks`
--

CREATE TABLE IF NOT EXISTS `designworks` (
  `GUID` varchar(200) NOT NULL,
  `DesignerID` varchar(200) NOT NULL COMMENT '设计者ID',
  `MaterialID` varchar(200) NOT NULL COMMENT '原料ID',
  `MaterialColorID` varchar(200) NOT NULL COMMENT '原材料颜色',
  `SalesGoal` int(11) NOT NULL COMMENT '销售目标',
  `BasePrice` decimal(18,8) NOT NULL COMMENT '底价/单件',
  `SellingPrice` decimal(18,8) NOT NULL COMMENT '售价/单件',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `LongTime` int(11) NOT NULL COMMENT '活动时长（天）',
  `StartTime` datetime DEFAULT NULL COMMENT '活动开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '活动截止时间',
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
('01e09dc805c54493b203a1921a2538e4', 'vneckshorttee', '橙色', 'e54d09', b'0', 1),
('05351318cab849aba9fc7c277902e8fd', 'longtee', '紫色', '4b256e', b'0', 1),
('15fe082c7b044537b546134cabd34866', 'tanktops', '灰色', 'd4cfc3', b'1', 1),
('171eb4b405204ae69babfac594a4f2ec', 'hoodies', '紫色', '4b256e', b'0', 1),
('1b7ab971321249d7823b3faab5053ab3', 'vneckshorttee', '白色', 'ffffff', b'0', 1),
('1e1a985f8e2346979b711aab05cd14e1', 'longtee', '深红色', '9f0110', b'0', 1),
('1e413cca0663422ba635ee7d747a2eaf', 'tanktops', '橙色', 'e54d09', b'0', 1),
('22d33b2ebcd84f59ade9c6b5dd94fd40', 'shorttee', '灰色', 'd4cfc3', b'1', 1),
('2423b15a66fb437fbed23b3c09c97ed7', 'longtee', '深蓝色', '1a2f78', b'0', 1),
('2e38833a3007486d9642c6e620921af9', 'womanshorttee', '橙色', 'e54d09', b'0', 1),
('2f9c5ef3a4c84834ba540d7dbd341dfa', 'hoodies', '白色', 'ffffff', b'0', 1),
('3579d1cc5231409ba43090b8d9318601', 'shorttee', '黑色', '1a1a1a', b'0', 1),
('40cc9f242aa64bde9fb7ea68f2199597', 'vneckshorttee', '深蓝色', '1a2f78', b'0', 1),
('417b6042d2b54a3787ab2e7227663fac', 'hoodies', '黑色', '1a1a1a', b'0', 1),
('424a7a1549674b0991865057ce40c77b', 'vneckshorttee', '灰色', 'd4cfc3', b'1', 1),
('4ab050c435b1457a8fc0e98a1d95b63b', 'shorttee', '深蓝色', '1a2f78', b'0', 1),
('4ac876fa4d5b4b21a6be884060b0dab5', 'hoodies', '橙色', 'e54d09', b'0', 1),
('4c50a9be760045049c196391fc3c7bfe', 'longtee', '白色', 'ffffff', b'0', 1),
('4cd8891daae940e8873cf4a666c0fda7', 'shorttee', '深红色', '9f0110', b'0', 1),
('4e8e95ad705a4ffc964161127f799424', 'hoodies', '灰色', 'd4cfc3', b'1', 1),
('4ff3967cbf9647c395b278fd2172879f', 'tanktops', '黑色', '1a1a1a', b'0', 1),
('5020317d398443938e60c22481b4211b', 'womanshorttee', '深蓝色', '1a2f78', b'0', 1),
('5f005782de264909bfa50435c9994484', 'hoodies', '深蓝色', '1a2f78', b'0', 1),
('643c079b5e034c5192f73e502b3f3046', 'shorttee', '白色', 'ffffff', b'0', 1),
('6c61878a45364b518d059f8ffc710746', 'tanktops', '深蓝色', '1a2f78', b'0', 1),
('7a906cae086142188615701a436bda19', 'shorttee', '橙色', 'e54d09', b'0', 1),
('8360c16150fc42c8ae5a30a3ca16b41d', 'longtee', '灰色', 'd4cfc3', b'1', 1),
('9d46df7c56bb4fa7942e50dbd35aa853', 'womanshorttee', '灰色', 'd4cfc3', b'1', 1),
('a6ead6937e294affab1754ec829a6832', 'longtee', '黑色', '1a1a1a', b'0', 1),
('a9430b61802c4d4f9b36325ad087ef6d', 'longtee', '橙色', 'e54d09', b'0', 1),
('ab81fa6ed92340a4bc5b4de75369967a', 'hoodies', '深红色', '9f0110', b'0', 1),
('b324c14ce13f4001b692488cd731bbfa', 'womanshorttee', '深红色', '9f0110', b'0', 1),
('b3ae2b5af55b41b99882d6cee887003d', 'vneckshorttee', '紫色', '4b256e', b'0', 1),
('b59a522d444943ee8c2dca57a54bea29', 'tanktops', '紫色', '4b256e', b'0', 1),
('b7443ed96aa6469eb4c96ee89cd10f30', 'womanshorttee', '黑色', '1a1a1a', b'0', 1),
('bdeeee99d0f945a18403fde056cf3aed', 'vneckshorttee', '黑色', '1a1a1a', b'0', 1),
('bfa4e79d84684a2fb3db3deecf4597c3', 'vneckshorttee', '深红色', '9f0110', b'0', 1),
('cd18fe60933245469627b5aa2effe1d0', 'womanshorttee', '紫色', '4b256e', b'0', 1),
('f18793fc789449699b3496baf9e65982', 'tanktops', '深红色', '9f0110', b'0', 1),
('fcf7848d045143d3a95e864e42a3fa99', 'tanktops', '白色', 'ffffff', b'0', 1),
('fd08d062b2fc414492aa7edc737dfff8', 'womanshorttee', '白色', 'ffffff', b'0', 1),
('fe8d2df0f8a34908a63af1041e688940', 'shorttee', '紫色', '4b256e', b'0', 1);

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
('0e1e5810b77140d49d998ae5094d4d45', 'vneckshorttee', '背面', 2, '02.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('3db03862e9ab4ae4bdfed310dcfabb16', 'longtee', '正面', 1, '01.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('5115749d814647c2862987fdd32d2979', 'womanshorttee', '背面', 2, '02.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('5541a58e98294de4b9f4196fce1f2667', 'womanshorttee', '正面', 1, '01.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('717a3b3228a74b58b8160601bbf19afb', 'vneckshorttee', '正面', 1, '01.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('7ab334cdddc34f10bdcc611012490883', 'hoodies', '正面', 1, '01.png', 530, 630, 140, 145, 842, 1190, '0.28500000'),
('8e03040e035e41289a3f186312c5f3d2', 'tanktops', '背面', 2, '02.png', 530, 630, 205, 145, 842, 1190, '0.28500000'),
('9093598fa164459ab90830b091f06940', 'shorttee', '正面', 1, '01.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('9e8865446e104000974132d8c4f21dd1', 'shorttee', '背面', 2, '02.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('ca24307b22174b34a98e1c04a653a901', 'longtee', '背面', 2, '02.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('d16742e83aac40da907e6998ab70e594', 'hoodies', '背面', 2, '02.png', 530, 630, 140, 145, 842, 1190, '0.28500000'),
('e207d929a1a14a61a3732b643acf82f6', 'tanktops', '正面', 1, '01.png', 530, 630, 205, 145, 842, 1190, '0.28500000');

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
('hoodies', 'tshirt', '卫衣', '45.00000000', '', 2, 1),
('longtee', 'tshirt', '长袖T恤', '45.00000000', '', 2, 1),
('shorttee', 'tshirt', '短袖T恤', '45.00000000', '', 2, 1),
('tanktops', 'tshirt', '背心', '45.00000000', '', 2, 1),
('vneckshorttee', 'tshirt', 'V领短袖T恤', '45.00000000', '', 2, 1),
('womanshorttee', 'tshirt', '女士短袖T恤', '45.00000000', '', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `materialsizes`
--

CREATE TABLE IF NOT EXISTS `materialsizes` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `SizeName` varchar(200) NOT NULL,
  `Index` int(11) NOT NULL,
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `materialsizes`
--

INSERT INTO `materialsizes` (`GUID`, `MaterialID`, `SizeName`, `Index`) VALUES
('07337fad218f4bffa828b12658a27d0b', 'shorttee', 'M', 1),
('1bf756d81ee446af831f078394091e68', 'tanktops', 'XXL', 4),
('2b48b9d4ba66474a8e5f96ad8d73927d', 'shorttee', 'XL', 3),
('43ae3d1e708a480bae88e105d9735066', 'vneckshorttee', 'L', 2),
('4dd08e548dea46828d742caacaa6420c', 'vneckshorttee', 'XXL', 4),
('533e7948f6404c4083266b4ab34938fc', 'longtee', 'M', 1),
('5afda8510c7d4a0b81c3d35adc728bb8', 'tanktops', 'L', 2),
('6210eb6ab6104d5997ac17080aee7167', 'tanktops', 'XL', 3),
('6e317c821a7a4fcc922c246a023f9725', 'hoodies', 'M', 1),
('6ea708c03a574fa6ab097a5b6000d5c3', 'hoodies', 'XXL', 4),
('727e44c412fe40d09bcb848e6f1e9981', 'vneckshorttee', 'XL', 3),
('7a0d93f9c004410fa3633ac84d37f341', 'womanshorttee', 'XS', 1),
('7b0638820116476bb78cdd389af85b8b', 'hoodies', 'L', 2),
('9087438fa325467481514ca9d39b5f89', 'longtee', 'XXL', 4),
('a8bf500d047e494d9f14db7afaf82ca8', 'vneckshorttee', 'M', 1),
('ac4a8475f1cb4d25b3a4c284b1d90a4c', 'longtee', 'L', 2),
('af008af25a6240da942c7376dad1671b', 'hoodies', 'XL', 3),
('c1cb76b6d3654578912cdfdbc7f7f809', 'womanshorttee', 'S', 2),
('cafd1588250343fe929ca8c31efcd4d8', 'womanshorttee', 'L', 4),
('cb79f63fc2844a828aaec62275c98c9d', 'womanshorttee', 'M', 3),
('d64c4712706e44e4b2c4abcefc271011', 'longtee', 'XL', 3),
('e231b409583347dea3f19b04fc05ee46', 'shorttee', 'L', 2),
('e39ae75124c849bf848a214e568f4ad8', 'shorttee', 'XXL', 4),
('ed3d7f7db28c4aab81f9c5b4b31bc8b6', 'tanktops', 'M', 1);

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
  `SizeID` varchar(200) NOT NULL,
  `SizeName` varchar(200) NOT NULL COMMENT '尺码',
  `Quantity` int(11) NOT NULL COMMENT '购买数量',
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
  `State` int(11) NOT NULL COMMENT '状态\r\n0：创建订单，等待确认订单\r\n1：确认订单，等待买家付款\r\n2：卖家付款，等待生产\r\n3：开始生产，等待发货\r\n4：发货，等待买家确认\r\n5：确认收货，即交易成功\r\n6：申请退款\r\n7：同意退款\r\n8：拒绝退款\r\n9：申请退货\r\n10：同意退货\r\n11：拒绝退货\r\n12：退货完成，等待退款\r\n13：退款完成\r\n14：退款关闭\r\n-1：交易中途关闭(已结束，未成功完成)',
  `CreateTime` datetime NOT NULL COMMENT '创建订单时间，等待确认订单',
  `ConfirmOrderTime` datetime DEFAULT NULL COMMENT '确认订单时间，等待买家付款',
  `BuyerPayTime` datetime DEFAULT NULL COMMENT '卖家付款时间，等待生产',
  `StartProductionTime` datetime DEFAULT NULL COMMENT '开始生产时间，等待发货',
  `SendGoodsTime` datetime DEFAULT NULL COMMENT '发货时间，等待买家确认',
  `ConfirmGoodsTime` datetime DEFAULT NULL COMMENT '确认收货时间，即交易成功',
  `RefundTime` datetime DEFAULT NULL COMMENT '申请退款时间',
  `RefundAgreeTime` datetime DEFAULT NULL COMMENT '同意退款时间',
  `RefundFefuseTime` datetime DEFAULT NULL COMMENT '拒绝退款时间',
  `RefundGoodsTime` datetime DEFAULT NULL COMMENT '申请退货时间',
  `RefundGoodsAgreeTime` datetime DEFAULT NULL COMMENT '同意退货时间',
  `RefundGoodsFefuseTime` datetime DEFAULT NULL COMMENT '拒绝退货时间',
  `RefundGoodsSuccessTime` datetime DEFAULT NULL COMMENT '退货完成时间，等待退款',
  `RefundSuccessTime` datetime DEFAULT NULL COMMENT '退款完成时间',
  `RefundClosedTime` datetime DEFAULT NULL COMMENT '退款关闭时间',
  `Subject` varchar(200) NOT NULL COMMENT '商品名称',
  `Price` decimal(18,8) NOT NULL COMMENT '单价',
  `Quantity` int(11) NOT NULL COMMENT '数量',
  `Freight` decimal(18,8) NOT NULL COMMENT '运费',
  `Total` decimal(18,8) NOT NULL COMMENT '总价',
  `Body` varchar(4000) DEFAULT NULL COMMENT '商品描述',
  `Consignee` varchar(200) DEFAULT NULL COMMENT '收件人姓名',
  `Address` varchar(200) DEFAULT NULL COMMENT '收件地址',
  `ZipCode` varchar(200) DEFAULT NULL COMMENT '邮编',
  `Mobile` varchar(200) DEFAULT NULL COMMENT '手机号',
  `Phone` varchar(200) DEFAULT NULL COMMENT '座机号',
  `ShippingMethod` varchar(200) DEFAULT NULL COMMENT '配送方式',
  `PayType` int(11) DEFAULT NULL COMMENT '支付平台\r\n1：Alipay',
  `PayOrderNo` varchar(200) DEFAULT NULL COMMENT '支付平台内流水号',
  `ExpressNumber` varchar(200) DEFAULT NULL COMMENT '快递单号',
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
  `RealName` varchar(200) NOT NULL COMMENT '支付宝用户姓名或淘宝昵称',
  `Email` varchar(200) NOT NULL COMMENT '用户支付宝登录账号(邮箱或手机号)',
  `StageName` varchar(200) NOT NULL COMMENT '艺名',
  `CreateTime` datetime NOT NULL COMMENT '用户注册时间',
  `State` int(11) NOT NULL COMMENT '状态\r\n0：禁用\r\n1：正常',
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`GUID`, `RealName`, `Email`, `StageName`, `CreateTime`, `State`) VALUES
('9ece1f8700bb4dd38832f14e4b480107', 'sorex@163.com', 'sorex@163.com', 'sorex', '2013-06-01 21:35:12', 0);

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
