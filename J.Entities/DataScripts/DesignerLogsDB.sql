-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 06 月 12 日 15:38
-- 服务器版本: 5.5.32
-- PHP 版本: 5.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- 数据库: `designerlogsdb`
--
CREATE DATABASE IF NOT EXISTS `designerlogsdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `designerlogsdb`;

-- --------------------------------------------------------

--
-- 表的结构 `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `ID` varchar(200) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `LogLevel` varchar(5) NOT NULL,
  `CallSite` varchar(4000) DEFAULT NULL,
  `Massage` varchar(4000) DEFAULT NULL,
  `StackTrace` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
