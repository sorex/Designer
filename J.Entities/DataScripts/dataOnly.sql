-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 06 月 05 日 09:42
-- 服务器版本: 5.1.61-community
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

--
-- 插入之前先把表清空（truncate） `addresses`
--

TRUNCATE TABLE `addresses`;
--
-- 插入之前先把表清空（truncate） `designworks`
--

TRUNCATE TABLE `designworks`;
--
-- 插入之前先把表清空（truncate） `materialcolors`
--

TRUNCATE TABLE `materialcolors`;
--
-- 转存表中的数据 `materialcolors`
--

INSERT INTO `materialcolors` (`GUID`, `MaterialID`, `ColorName`, `ColorCode`, `IsDefault`, `State`) VALUES
('17e6a0ee06504d4482e6cf34a8bee546', 'ShortRNeck', '绿色', '00ff00', b'0', 1),
('22b3beef5fc042adbb761bf740da92bb', 'ShortRNeck', '黑色', '000000', b'0', 1),
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

--
-- 插入之前先把表清空（truncate） `materialpictures`
--

TRUNCATE TABLE `materialpictures`;
--
-- 插入之前先把表清空（truncate） `materialpricelogs`
--

TRUNCATE TABLE `materialpricelogs`;
--
-- 插入之前先把表清空（truncate） `materials`
--

TRUNCATE TABLE `materials`;
--
-- 转存表中的数据 `materials`
--

INSERT INTO `materials` (`GUID`, `TypeID`, `Name`, `Price`, `Description`, `PictureNumber`, `State`) VALUES
('LongRNeck', 'TShirt', '长袖圆领', '40.00000000', '详细', 2, 1),
('LongVNeck', 'TShirt', '长袖V领', '40.00000000', '详细', 2, 1),
('ShortRNeck', 'TShirt', '短袖圆领', '40.00000000', '详细', 2, 1),
('ShortVNeck', 'TShirt', '短袖V领', '40.00000000', '详细', 2, 1);

--
-- 插入之前先把表清空（truncate） `materialsizes`
--

TRUNCATE TABLE `materialsizes`;
--
-- 插入之前先把表清空（truncate） `materialtypes`
--

TRUNCATE TABLE `materialtypes`;
--
-- 转存表中的数据 `materialtypes`
--

INSERT INTO `materialtypes` (`GUID`, `ParentID`, `Index`, `Name`, `IsLeafNode`, `State`) VALUES
('Clothes', NULL, 1, '上衣', b'0', 1),
('TShirt', 'Clothes', 2, 'T恤', b'1', 1);

--
-- 插入之前先把表清空（truncate） `orderdetails`
--

TRUNCATE TABLE `orderdetails`;
--
-- 插入之前先把表清空（truncate） `orders`
--

TRUNCATE TABLE `orders`;
--
-- 插入之前先把表清空（truncate） `singlelogin`
--

TRUNCATE TABLE `singlelogin`;
--
-- 插入之前先把表清空（truncate） `users`
--

TRUNCATE TABLE `users`;
--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`GUID`, `LoginName`, `Email`, `Password`, `StageName`, `CreateTime`, `State`) VALUES
('9ece1f8700bb4dd38832f14e4b480107', 'sorex@163.com', 'sorex@163.com', '8XGy06XKv+5g75/xEbvpwQ==', 'Jasper', '2013-05-31 16:48:35', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
