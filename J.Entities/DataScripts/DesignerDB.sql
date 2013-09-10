-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- 涓绘満: localhost
-- 鐢熸垚鏃ユ湡: 2013 骞?09 鏈?10 鏃?15:15
-- 鏈嶅姟鍣ㄧ増鏈? 5.5.32
-- PHP 鐗堟湰: 5.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 鏁版嵁搴? `designerdb`
--
CREATE DATABASE IF NOT EXISTS `designerdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `designerdb`;

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `GUID` varchar(200) NOT NULL,
  `UserID` varchar(200) NOT NULL,
  `Consignee` varchar(200) NOT NULL COMMENT '鏀惰揣浜?,
  `Province` varchar(200) NOT NULL COMMENT '鐪?,
  `City` varchar(200) NOT NULL COMMENT '甯?,
  `County` varchar(200) NOT NULL COMMENT '鍖?鍘?,
  `StreetAddress` varchar(1000) NOT NULL COMMENT '琛楅亾鍦板潃',
  `ZipCode` varchar(200) NOT NULL COMMENT '閭紪',
  `Mobile` varchar(200) NOT NULL COMMENT '鎵嬫満鍙风爜',
  `Phone` varchar(200) NOT NULL COMMENT '鐢佃瘽鍙风爜',
  `IsDefault` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁榛樿鍦板潃',
  PRIMARY KEY (`GUID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 杞瓨琛ㄤ腑鐨勬暟鎹?`addresses`
--

INSERT INTO `addresses` (`GUID`, `UserID`, `Consignee`, `Province`, `City`, `County`, `StreetAddress`, `ZipCode`, `Mobile`, `Phone`, `IsDefault`) VALUES
('1e5dfe31d9ec478abcac8da9518f867d', '9ece1f8700bb4dd38832f14e4b480107', 'Jasper', 'hubei', 'wuhan ', 'qingshang', 'This is the test addresses', '400000', '18061234567', '', b'1'),
('5a3055278883456ab09a5bf12c7ec254', '9ece1f8700bb4dd38832f14e4b480107', 'Jasper', '婀栧寳鐪?, '姝︽眽甯?, '闈掑北鍖?, '杩欐槸涓€涓祴璇曠殑鍦板潃', '400000', '18067654321', '027-88888888', b'0');

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `designworks`
--

CREATE TABLE IF NOT EXISTS `designworks` (
  `GUID` varchar(200) NOT NULL,
  `DesignerID` varchar(200) NOT NULL COMMENT '璁捐鑰匢D',
  `MaterialID` varchar(200) NOT NULL COMMENT '鍘熸枡ID',
  `MaterialColorID` varchar(200) NOT NULL COMMENT '鍘熸潗鏂欓鑹?,
  `SalesGoal` int(11) NOT NULL COMMENT '閿€鍞洰鏍?,
  `BasePrice` decimal(18,8) NOT NULL COMMENT '搴曚环/鍗曚欢',
  `SellingPrice` decimal(18,8) NOT NULL COMMENT '鍞环/鍗曚欢',
  `CreateTime` datetime NOT NULL COMMENT '鍒涘缓鏃堕棿',
  `LongTime` int(11) NOT NULL COMMENT '娲诲姩鏃堕暱锛堝ぉ锛?,
  `StartTime` datetime DEFAULT NULL COMMENT '娲诲姩寮€濮嬫椂闂?,
  `EndTime` datetime DEFAULT NULL COMMENT '娲诲姩鎴鏃堕棿',
  `Title` varchar(200) NOT NULL COMMENT '娲诲姩鏍囬',
  `Description` varchar(4000) NOT NULL COMMENT '娲诲姩璇存槑',
  `Url` varchar(200) DEFAULT NULL COMMENT 'Url',
  `SalesVolume` int(11) DEFAULT NULL COMMENT '閿€鍞噺/缁熻鍊?,
  `State` int(11) NOT NULL COMMENT '鐘舵€乗r\n-1锛氶鍞笉瓒砛r\n0锛氳璁′腑\r\n1锛氶鍞腑\r\n2锛氱敓浜т腑\r\n3锛氬彂璐т腑\r\n4锛氭敹娆句腑\r\n5锛氳繑娆句腑\r\n6锛氬綊妗?,
  `ProcurementCost` decimal(18,8) DEFAULT NULL COMMENT '閲囪喘鎴愭湰',
  `ProductionCost` decimal(18,8) DEFAULT NULL COMMENT '鐢熶骇鎴愭湰',
  `SendCost` decimal(18,8) DEFAULT NULL COMMENT '鍙戣揣鎴愭湰',
  `CompletionTime` datetime DEFAULT NULL COMMENT '鎵€鏈変氦鏄撳畬鎴愭椂闂?,
  PRIMARY KEY (`GUID`),
  KEY `DesignerID` (`DesignerID`),
  KEY `MaterialID` (`MaterialID`),
  KEY `MaterialColorID` (`MaterialColorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `materialcolors`
--

CREATE TABLE IF NOT EXISTS `materialcolors` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `ColorName` varchar(200) NOT NULL,
  `ColorCode` varchar(200) NOT NULL,
  `IsDefault` bit(1) NOT NULL DEFAULT b'0' COMMENT '鏄惁鏄粯璁ら鑹?,
  `State` int(11) NOT NULL COMMENT '鐘舵€乗r\n0锛氬仠浜r\n1锛氭甯竆r\n2锛氱己璐?,
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 杞瓨琛ㄤ腑鐨勬暟鎹?`materialcolors`
--

INSERT INTO `materialcolors` (`GUID`, `MaterialID`, `ColorName`, `ColorCode`, `IsDefault`, `State`) VALUES
('01e09dc805c54493b203a1921a2538e4', 'vneckshorttee', '姗欒壊', 'e54d09', b'0', 1),
('05351318cab849aba9fc7c277902e8fd', 'longtee', '绱壊', '4b256e', b'0', 1),
('15fe082c7b044537b546134cabd34866', 'tanktops', '鐏拌壊', 'd4cfc3', b'0', 1),
('171eb4b405204ae69babfac594a4f2ec', 'hoodies', '绱壊', '4b256e', b'0', 1),
('1b7ab971321249d7823b3faab5053ab3', 'vneckshorttee', '鐧借壊', 'ffffff', b'1', 1),
('1e1a985f8e2346979b711aab05cd14e1', 'longtee', '娣辩孩鑹?, '9f0110', b'0', 1),
('1e413cca0663422ba635ee7d747a2eaf', 'tanktops', '姗欒壊', 'e54d09', b'0', 1),
('22d33b2ebcd84f59ade9c6b5dd94fd40', 'shorttee', '鐏拌壊', 'd4cfc3', b'0', 1),
('2423b15a66fb437fbed23b3c09c97ed7', 'longtee', '娣辫摑鑹?, '1a2f78', b'0', 1),
('2e38833a3007486d9642c6e620921af9', 'womanshorttee', '姗欒壊', 'e54d09', b'0', 1),
('2f9c5ef3a4c84834ba540d7dbd341dfa', 'hoodies', '鐧借壊', 'ffffff', b'1', 1),
('3579d1cc5231409ba43090b8d9318601', 'shorttee', '榛戣壊', '1a1a1a', b'0', 1),
('40cc9f242aa64bde9fb7ea68f2199597', 'vneckshorttee', '娣辫摑鑹?, '1a2f78', b'0', 1),
('417b6042d2b54a3787ab2e7227663fac', 'hoodies', '榛戣壊', '1a1a1a', b'0', 1),
('424a7a1549674b0991865057ce40c77b', 'vneckshorttee', '鐏拌壊', 'd4cfc3', b'0', 1),
('4ab050c435b1457a8fc0e98a1d95b63b', 'shorttee', '娣辫摑鑹?, '1a2f78', b'0', 1),
('4ac876fa4d5b4b21a6be884060b0dab5', 'hoodies', '姗欒壊', 'e54d09', b'0', 1),
('4c50a9be760045049c196391fc3c7bfe', 'longtee', '鐧借壊', 'ffffff', b'1', 1),
('4cd8891daae940e8873cf4a666c0fda7', 'shorttee', '娣辩孩鑹?, '9f0110', b'0', 1),
('4e8e95ad705a4ffc964161127f799424', 'hoodies', '鐏拌壊', 'd4cfc3', b'0', 1),
('4ff3967cbf9647c395b278fd2172879f', 'tanktops', '榛戣壊', '1a1a1a', b'0', 1),
('5020317d398443938e60c22481b4211b', 'womanshorttee', '娣辫摑鑹?, '1a2f78', b'0', 1),
('5f005782de264909bfa50435c9994484', 'hoodies', '娣辫摑鑹?, '1a2f78', b'0', 1),
('643c079b5e034c5192f73e502b3f3046', 'shorttee', '鐧借壊', 'ffffff', b'1', 1),
('6c61878a45364b518d059f8ffc710746', 'tanktops', '娣辫摑鑹?, '1a2f78', b'0', 1),
('7a906cae086142188615701a436bda19', 'shorttee', '姗欒壊', 'e54d09', b'0', 1),
('8360c16150fc42c8ae5a30a3ca16b41d', 'longtee', '鐏拌壊', 'd4cfc3', b'0', 1),
('9d46df7c56bb4fa7942e50dbd35aa853', 'womanshorttee', '鐏拌壊', 'd4cfc3', b'0', 1),
('a6ead6937e294affab1754ec829a6832', 'longtee', '榛戣壊', '1a1a1a', b'0', 1),
('a9430b61802c4d4f9b36325ad087ef6d', 'longtee', '姗欒壊', 'e54d09', b'0', 1),
('ab81fa6ed92340a4bc5b4de75369967a', 'hoodies', '娣辩孩鑹?, '9f0110', b'0', 1),
('b324c14ce13f4001b692488cd731bbfa', 'womanshorttee', '娣辩孩鑹?, '9f0110', b'0', 1),
('b3ae2b5af55b41b99882d6cee887003d', 'vneckshorttee', '绱壊', '4b256e', b'0', 1),
('b59a522d444943ee8c2dca57a54bea29', 'tanktops', '绱壊', '4b256e', b'0', 1),
('b7443ed96aa6469eb4c96ee89cd10f30', 'womanshorttee', '榛戣壊', '1a1a1a', b'0', 1),
('bdeeee99d0f945a18403fde056cf3aed', 'vneckshorttee', '榛戣壊', '1a1a1a', b'0', 1),
('bfa4e79d84684a2fb3db3deecf4597c3', 'vneckshorttee', '娣辩孩鑹?, '9f0110', b'0', 1),
('cd18fe60933245469627b5aa2effe1d0', 'womanshorttee', '绱壊', '4b256e', b'0', 1),
('f18793fc789449699b3496baf9e65982', 'tanktops', '娣辩孩鑹?, '9f0110', b'0', 1),
('fcf7848d045143d3a95e864e42a3fa99', 'tanktops', '鐧借壊', 'ffffff', b'1', 1),
('fd08d062b2fc414492aa7edc737dfff8', 'womanshorttee', '鐧借壊', 'ffffff', b'1', 1),
('fe8d2df0f8a34908a63af1041e688940', 'shorttee', '绱壊', '4b256e', b'0', 1);

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `materialpictures`
--

CREATE TABLE IF NOT EXISTS `materialpictures` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `Name` varchar(200) NOT NULL COMMENT '鍥剧墖鍚嶇О(渚嬶細姝ｉ潰锛岃儗闈?',
  `Index` int(11) NOT NULL COMMENT '鎺掑垪搴忓彿',
  `FileName` varchar(200) NOT NULL COMMENT '搴曞浘鏂囦欢鍚?,
  `Width` int(11) NOT NULL COMMENT '鍥剧墖瀹藉害',
  `Height` int(11) NOT NULL COMMENT '鍥剧墖楂樺害',
  `Top` int(11) NOT NULL COMMENT '涓婁紶鍥剧墖璺濈涓婅竟鐣岃窛绂?,
  `Left` int(11) NOT NULL COMMENT '涓婁紶鍥剧墖璺濈宸﹁竟鐣岃窛绂?,
  `UploadWidth` int(11) NOT NULL COMMENT '涓婁紶鍥剧墖瀹藉害',
  `UploadHeight` int(11) NOT NULL COMMENT '涓婁紶鍥剧墖楂樺害',
  `ShowScale` decimal(18,8) NOT NULL COMMENT '鏄剧ず鏃剁殑缂╂斁姣斾緥',
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 杞瓨琛ㄤ腑鐨勬暟鎹?`materialpictures`
--

INSERT INTO `materialpictures` (`GUID`, `MaterialID`, `Name`, `Index`, `FileName`, `Width`, `Height`, `Top`, `Left`, `UploadWidth`, `UploadHeight`, `ShowScale`) VALUES
('0e1e5810b77140d49d998ae5094d4d45', 'vneckshorttee', '鑳岄潰', 2, '02.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('3db03862e9ab4ae4bdfed310dcfabb16', 'longtee', '姝ｉ潰', 1, '01.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('5115749d814647c2862987fdd32d2979', 'womanshorttee', '鑳岄潰', 2, '02.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('5541a58e98294de4b9f4196fce1f2667', 'womanshorttee', '姝ｉ潰', 1, '01.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('717a3b3228a74b58b8160601bbf19afb', 'vneckshorttee', '姝ｉ潰', 1, '01.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('7ab334cdddc34f10bdcc611012490883', 'hoodies', '姝ｉ潰', 1, '01.png', 530, 630, 140, 145, 842, 1190, '0.28500000'),
('8e03040e035e41289a3f186312c5f3d2', 'tanktops', '鑳岄潰', 2, '02.png', 530, 630, 205, 145, 842, 1190, '0.28500000'),
('9093598fa164459ab90830b091f06940', 'shorttee', '姝ｉ潰', 1, '01.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('9e8865446e104000974132d8c4f21dd1', 'shorttee', '鑳岄潰', 2, '02.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('ca24307b22174b34a98e1c04a653a901', 'longtee', '鑳岄潰', 2, '02.png', 530, 630, 105, 145, 842, 1190, '0.28500000'),
('d16742e83aac40da907e6998ab70e594', 'hoodies', '鑳岄潰', 2, '02.png', 530, 630, 140, 145, 842, 1190, '0.28500000'),
('e207d929a1a14a61a3732b643acf82f6', 'tanktops', '姝ｉ潰', 1, '01.png', 530, 630, 205, 145, 842, 1190, '0.28500000');

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `materialpricelogs`
--

CREATE TABLE IF NOT EXISTS `materialpricelogs` (
  `GUID` varchar(200) NOT NULL,
  `MaterialID` varchar(200) NOT NULL,
  `Price` decimal(18,8) NOT NULL COMMENT '浠锋牸',
  `CreateTime` datetime NOT NULL COMMENT '褰曞叆鏃堕棿',
  PRIMARY KEY (`GUID`),
  KEY `MaterialID` (`MaterialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `GUID` varchar(200) NOT NULL,
  `TypeID` varchar(200) NOT NULL COMMENT '绫诲瀷\r\n1锛氱煭琚朤鎭r\n2锛氶暱琚朤鎭r\n3锛氳儗蹇僜r\n4锛氳繛甯借～',
  `Name` varchar(200) NOT NULL COMMENT '鍘熸枡缂栧彿',
  `Price` decimal(18,8) NOT NULL DEFAULT '0.00000000' COMMENT '鐩墠鍧囦环',
  `Description` varchar(4000) NOT NULL,
  `PictureNumber` int(11) NOT NULL COMMENT '闇€瑕佷笂浼犲浘鐗囧紶鏁?,
  `State` int(11) NOT NULL COMMENT '鐘舵€乗r\n0锛氬仠浜r\n1锛氭甯竆r\n2锛氱己璐r\n3锛氬仠鐢?鏈惎鐢?,
  PRIMARY KEY (`GUID`),
  KEY `TypeID` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 杞瓨琛ㄤ腑鐨勬暟鎹?`materials`
--

INSERT INTO `materials` (`GUID`, `TypeID`, `Name`, `Price`, `Description`, `PictureNumber`, `State`) VALUES
('hoodies', 'tshirt', '鍗。', '45.00000000', '', 2, 1),
('longtee', 'tshirt', '闀胯T鎭?, '45.00000000', '', 2, 1),
('shorttee', 'tshirt', '鐭T鎭?, '45.00000000', '', 2, 1),
('tanktops', 'tshirt', '鑳屽績', '45.00000000', '', 2, 1),
('vneckshorttee', 'tshirt', 'V棰嗙煭琚朤鎭?, '45.00000000', '', 2, 1),
('womanshorttee', 'tshirt', '濂冲＋鐭T鎭?, '45.00000000', '', 2, 1);

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `materialsizes`
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
-- 杞瓨琛ㄤ腑鐨勬暟鎹?`materialsizes`
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
-- 琛ㄧ殑缁撴瀯 `materialtypes`
--

CREATE TABLE IF NOT EXISTS `materialtypes` (
  `GUID` varchar(200) NOT NULL,
  `ParentID` varchar(200) DEFAULT NULL,
  `Index` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL COMMENT '绫诲瀷鍚嶇О',
  `IsLeafNode` bit(1) NOT NULL DEFAULT b'1' COMMENT '鏄惁鏄彾瀛愯妭鐐?,
  `State` int(11) NOT NULL COMMENT '鐘舵€乗r\n0锛氬仠鐢╘r\n1锛氭甯竆r\n',
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 杞瓨琛ㄤ腑鐨勬暟鎹?`materialtypes`
--

INSERT INTO `materialtypes` (`GUID`, `ParentID`, `Index`, `Name`, `IsLeafNode`, `State`) VALUES
('clothes', NULL, 1, '涓婅。', b'0', 1),
('tshirt', 'clothes', 2, 'T鎭?, b'1', 1);

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `GUID` varchar(200) NOT NULL,
  `OrderID` varchar(200) NOT NULL,
  `SizeID` varchar(200) NOT NULL,
  `SizeName` varchar(200) NOT NULL COMMENT '灏虹爜',
  `Quantity` int(11) NOT NULL COMMENT '璐拱鏁伴噺',
  PRIMARY KEY (`GUID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `GUID` varchar(200) NOT NULL,
  `UserID` varchar(200) NOT NULL,
  `DesignWorkID` varchar(200) NOT NULL COMMENT '璁捐ID',
  `State` int(11) NOT NULL COMMENT '鐘舵€乗r\n0锛氬垱寤鸿鍗曪紝绛夊緟纭璁㈠崟\r\n1锛氱‘璁よ鍗曪紝绛夊緟涔板浠樻\r\n2锛氬崠瀹朵粯娆撅紝绛夊緟鐢熶骇\r\n3锛氬紑濮嬬敓浜э紝绛夊緟鍙戣揣\r\n4锛氬彂璐э紝绛夊緟涔板纭\r\n5锛氱‘璁ゆ敹璐э紝鍗充氦鏄撴垚鍔焅r\n6锛氱敵璇烽€€娆綷r\n7锛氬悓鎰忛€€娆綷r\n8锛氭嫆缁濋€€娆綷r\n9锛氱敵璇烽€€璐r\n10锛氬悓鎰忛€€璐r\n11锛氭嫆缁濋€€璐r\n12锛氶€€璐у畬鎴愶紝绛夊緟閫€娆綷r\n13锛氶€€娆惧畬鎴怽r\n14锛氶€€娆惧叧闂璡r\n-1锛氫氦鏄撲腑閫斿叧闂?宸茬粨鏉燂紝鏈垚鍔熷畬鎴?',
  `CreateTime` datetime NOT NULL COMMENT '鍒涘缓璁㈠崟鏃堕棿锛岀瓑寰呯‘璁よ鍗?,
  `ConfirmOrderTime` datetime DEFAULT NULL COMMENT '纭璁㈠崟鏃堕棿锛岀瓑寰呬拱瀹朵粯娆?,
  `BuyerPayTime` datetime DEFAULT NULL COMMENT '鍗栧浠樻鏃堕棿锛岀瓑寰呯敓浜?,
  `StartProductionTime` datetime DEFAULT NULL COMMENT '寮€濮嬬敓浜ф椂闂达紝绛夊緟鍙戣揣',
  `SendGoodsTime` datetime DEFAULT NULL COMMENT '鍙戣揣鏃堕棿锛岀瓑寰呬拱瀹剁‘璁?,
  `ConfirmGoodsTime` datetime DEFAULT NULL COMMENT '纭鏀惰揣鏃堕棿锛屽嵆浜ゆ槗鎴愬姛',
  `RefundTime` datetime DEFAULT NULL COMMENT '鐢宠閫€娆炬椂闂?,
  `RefundAgreeTime` datetime DEFAULT NULL COMMENT '鍚屾剰閫€娆炬椂闂?,
  `RefundFefuseTime` datetime DEFAULT NULL COMMENT '鎷掔粷閫€娆炬椂闂?,
  `RefundGoodsTime` datetime DEFAULT NULL COMMENT '鐢宠閫€璐ф椂闂?,
  `RefundGoodsAgreeTime` datetime DEFAULT NULL COMMENT '鍚屾剰閫€璐ф椂闂?,
  `RefundGoodsFefuseTime` datetime DEFAULT NULL COMMENT '鎷掔粷閫€璐ф椂闂?,
  `RefundGoodsSuccessTime` datetime DEFAULT NULL COMMENT '閫€璐у畬鎴愭椂闂达紝绛夊緟閫€娆?,
  `RefundSuccessTime` datetime DEFAULT NULL COMMENT '閫€娆惧畬鎴愭椂闂?,
  `RefundClosedTime` datetime DEFAULT NULL COMMENT '閫€娆惧叧闂椂闂?,
  `Subject` varchar(200) NOT NULL COMMENT '鍟嗗搧鍚嶇О',
  `Price` decimal(18,8) NOT NULL COMMENT '鍗曚环',
  `Quantity` int(11) NOT NULL COMMENT '鏁伴噺',
  `Freight` decimal(18,8) NOT NULL COMMENT '杩愯垂',
  `Total` decimal(18,8) NOT NULL COMMENT '鎬讳环',
  `Body` varchar(4000) DEFAULT NULL COMMENT '鍟嗗搧鎻忚堪',
  `Consignee` varchar(200) DEFAULT NULL COMMENT '鏀朵欢浜哄鍚?,
  `Address` varchar(200) DEFAULT NULL COMMENT '鏀朵欢鍦板潃',
  `ZipCode` varchar(200) DEFAULT NULL COMMENT '閭紪',
  `Mobile` varchar(200) DEFAULT NULL COMMENT '鎵嬫満鍙?,
  `Phone` varchar(200) DEFAULT NULL COMMENT '搴ф満鍙?,
  `ShippingMethod` varchar(200) DEFAULT NULL COMMENT '閰嶉€佹柟寮?,
  `PayType` int(11) DEFAULT NULL COMMENT '鏀粯骞冲彴\r\n1锛欰lipay',
  `PayOrderNo` varchar(200) DEFAULT NULL COMMENT '鏀粯骞冲彴鍐呮祦姘村彿',
  `ExpressNumber` varchar(200) DEFAULT NULL COMMENT '蹇€掑崟鍙?,
  PRIMARY KEY (`GUID`),
  KEY `DesignWorkID` (`DesignWorkID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `singlelogin`
--

CREATE TABLE IF NOT EXISTS `singlelogin` (
  `GUID` varchar(200) NOT NULL,
  `UserID` varchar(200) NOT NULL,
  `LoginTime` datetime NOT NULL COMMENT '鐧婚檰鏃堕棿',
  PRIMARY KEY (`GUID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 琛ㄧ殑缁撴瀯 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `GUID` varchar(200) NOT NULL,
  `RealName` varchar(200) NOT NULL COMMENT '鏀粯瀹濈敤鎴峰鍚嶆垨娣樺疂鏄电О',
  `Email` varchar(200) NOT NULL COMMENT '鐢ㄦ埛鏀粯瀹濈櫥褰曡处鍙?閭鎴栨墜鏈哄彿)',
  `StageName` varchar(200) NOT NULL COMMENT '鑹哄悕',
  `CreateTime` datetime NOT NULL COMMENT '鐢ㄦ埛娉ㄥ唽鏃堕棿',
  `State` int(11) NOT NULL COMMENT '鐘舵€乗r\n0锛氱鐢╘r\n1锛氭甯?,
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 杞瓨琛ㄤ腑鐨勬暟鎹?`users`
--

INSERT INTO `users` (`GUID`, `RealName`, `Email`, `StageName`, `CreateTime`, `State`) VALUES
('9ece1f8700bb4dd38832f14e4b480107', 'sorex@163.com', 'sorex@163.com', 'sorex', '2013-06-01 21:35:12', 0);

--
-- 闄愬埗瀵煎嚭鐨勮〃
--

--
-- 闄愬埗琛?`addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`GUID`);

--
-- 闄愬埗琛?`designworks`
--
ALTER TABLE `designworks`
  ADD CONSTRAINT `designworks_ibfk_1` FOREIGN KEY (`DesignerID`) REFERENCES `users` (`GUID`),
  ADD CONSTRAINT `designworks_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`),
  ADD CONSTRAINT `designworks_ibfk_3` FOREIGN KEY (`MaterialColorID`) REFERENCES `materialcolors` (`GUID`);

--
-- 闄愬埗琛?`materialcolors`
--
ALTER TABLE `materialcolors`
  ADD CONSTRAINT `materialcolors_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

--
-- 闄愬埗琛?`materialpictures`
--
ALTER TABLE `materialpictures`
  ADD CONSTRAINT `materialpictures_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

--
-- 闄愬埗琛?`materialpricelogs`
--
ALTER TABLE `materialpricelogs`
  ADD CONSTRAINT `materialpricelogs_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

--
-- 闄愬埗琛?`materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `materialtypes` (`GUID`);

--
-- 闄愬埗琛?`materialsizes`
--
ALTER TABLE `materialsizes`
  ADD CONSTRAINT `materialsizes_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`GUID`);

--
-- 闄愬埗琛?`orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`GUID`);

--
-- 闄愬埗琛?`orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`DesignWorkID`) REFERENCES `designworks` (`GUID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`GUID`);

--
-- 闄愬埗琛?`singlelogin`
--
ALTER TABLE `singlelogin`
  ADD CONSTRAINT `singlelogin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`GUID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
