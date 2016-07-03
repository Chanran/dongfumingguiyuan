-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-03-17 21:29:07
-- 服务器版本： 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dfgy`
--

-- --------------------------------------------------------

--
-- 表的结构 `dfgy_company`
--

CREATE TABLE `dfgy_company` (
  `id` int(11) NOT NULL COMMENT '联系方式id',
  `fix_phone` int(8) NOT NULL COMMENT '固话',
  `fix_phone_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '固话联系人名字',
  `telephone` int(11) NOT NULL COMMENT '移动电话',
  `telephone_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '移动电话联系人名字',
  `email` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT '邮箱',
  `qq` int(11) NOT NULL COMMENT 'qq号',
  `qq_group` int(11) NOT NULL COMMENT 'qq群号',
  `wechat` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '微信号',
  `address` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '地址'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `dfgy_config`
--

CREATE TABLE `dfgy_config` (
  `id` int(11) NOT NULL,
  `today_visit` int(11) NOT NULL DEFAULT '0' COMMENT '今日访问量',
  `total_visit` int(11) NOT NULL DEFAULT '0' COMMENT '总访问量'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `dfgy_exchange`
--

CREATE TABLE `dfgy_exchange` (
  `id` int(11) NOT NULL COMMENT '留言id',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '游客名称',
  `comment` text CHARACTER SET utf8 NOT NULL COMMENT '评论内容',
  `comment_at` datetime NOT NULL COMMENT '评论时间',
  `reply` text CHARACTER SET utf32 NOT NULL COMMENT '回复内容',
  `reply_at` datetime NOT NULL COMMENT '回复时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `dfgy_img`
--

CREATE TABLE `dfgy_img` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '图片名称',
  `type_id` tinyint(4) NOT NULL COMMENT '类型id',
  `created_at` datetime NOT NULL COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `dfgy_link`
--

CREATE TABLE `dfgy_link` (
  `id` int(11) NOT NULL COMMENT '链接id',
  `name` varchar(255) NOT NULL COMMENT '链接的网站名称',
  `url` text CHARACTER SET utf8 NOT NULL COMMENT '链接url',
  `img_id` int(11) NOT NULL COMMENT '链接图片id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `dfgy_text`
--

CREATE TABLE `dfgy_text` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `type_id` tinyint(10) NOT NULL COMMENT '文章类型id',
  `img_id` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '文章对应的图片id(用逗号分割)',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '文章内容',
  `read_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `created_at` datetime NOT NULL COMMENT '文章发布时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `dfgy_text_type`
--

CREATE TABLE `dfgy_text_type` (
  `id` int(11) NOT NULL COMMENT '文章类型id',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '文章类型名称'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `dfgy_text_type`
--

INSERT INTO `dfgy_text_type` (`id`, `name`) VALUES
(1, '本场要闻'),
(2, '市场动态'),
(3, '行业评论'),
(4, '养殖交流'),
(5, '公司简介'),
(6, '发展历程'),
(7, '主营业务'),
(8, '友情链接'),
(9, '底部栏');

-- --------------------------------------------------------

--
-- 表的结构 `dfgy_turtle`
--

CREATE TABLE `dfgy_turtle` (
  `id` int(11) NOT NULL COMMENT '龟鳖id',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '龟鳖品种名称',
  `introduction` text CHARACTER SET utf8 NOT NULL COMMENT '龟鳖品种介绍',
  `img_id` varchar(255) NOT NULL COMMENT '龟鳖品种图片(用逗号分割)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dfgy_company`
--
ALTER TABLE `dfgy_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dfgy_config`
--
ALTER TABLE `dfgy_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dfgy_exchange`
--
ALTER TABLE `dfgy_exchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dfgy_img`
--
ALTER TABLE `dfgy_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dfgy_link`
--
ALTER TABLE `dfgy_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dfgy_text`
--
ALTER TABLE `dfgy_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dfgy_text_type`
--
ALTER TABLE `dfgy_text_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dfgy_turtle`
--
ALTER TABLE `dfgy_turtle`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `dfgy_company`
--
ALTER TABLE `dfgy_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '联系方式id';
--
-- 使用表AUTO_INCREMENT `dfgy_config`
--
ALTER TABLE `dfgy_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dfgy_exchange`
--
ALTER TABLE `dfgy_exchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id';
--
-- 使用表AUTO_INCREMENT `dfgy_img`
--
ALTER TABLE `dfgy_img`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `dfgy_link`
--
ALTER TABLE `dfgy_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '链接id';
--
-- 使用表AUTO_INCREMENT `dfgy_text`
--
ALTER TABLE `dfgy_text`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id';
--
-- 使用表AUTO_INCREMENT `dfgy_text_type`
--
ALTER TABLE `dfgy_text_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类型id', AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `dfgy_turtle`
--
ALTER TABLE `dfgy_turtle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '龟鳖id';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
