-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-06-04 22:41:47
-- 服务器版本： 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.16

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
-- 表的结构 `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL COMMENT 'id',
  `fix_phone` int(8) NOT NULL COMMENT '固话',
  `fix_phone_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '固话联系人名字',
  `telephone` varchar(11) NOT NULL COMMENT '移动电话',
  `telephone_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '移动电话联系人名字',
  `email` varchar(256) CHARACTER SET utf8 NOT NULL COMMENT '邮箱',
  `qq` int(11) NOT NULL COMMENT 'qq号',
  `qq_group` varchar(255) NOT NULL COMMENT 'qq群号(用逗号分割)',
  `wechat` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '微信号',
  `address` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '地址',
  `introduction` text CHARACTER SET utf8 NOT NULL COMMENT '公司简介',
  `development` text CHARACTER SET utf8 NOT NULL COMMENT '发展历程',
  `business` text CHARACTER SET utf8 NOT NULL COMMENT '主营业务'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `company`
--

INSERT INTO `company` (`id`, `fix_phone`, `fix_phone_name`, `telephone`, `telephone_name`, `email`, `qq`, `qq_group`, `wechat`, `address`, `introduction`, `development`, `business`) VALUES
(1, 0, '', '0', '', '', 0, '0', '', '', 'test', 'test', 'test'),
(2, 82824322, '蓝', '13662370755', '蓝2', 'rong54564@qq.com', 987654321, '15464', 'wechat', 'test2', '<p><img id="gaikuangimg" src="http://dongfuguiyuan.com/system/pictures/20141115162872727272.jpg" style="margin: 13px 0px 0px 15px; padding: 0px 10px 10px 0px; max-width: 400px; float: right;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; font-size: 15px; line-height: 26px; white-space: normal; vertical-align: baseline; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; line-height: 1.5;"><span style="margin: 0px; padding: 0px; font-size: 18px;">&nbsp; &nbsp; &nbsp;</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; font-size: 15px; line-height: 26px; white-space: normal; vertical-align: baseline; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; line-height: 1.5;"><span style="margin: 0px; padding: 0px; font-size: 18px;">&nbsp; &nbsp; &nbsp; &nbsp;中山市东富名龟养殖场组建于2004年10月，注资本金为2千万元人民币，2014年9月获得国家工商局批准，成功注册商标，是广东省龟鳖养殖行业协会理事单位，已成为中山市名龟养殖的龙头企业。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; font-size: 15px; line-height: 26px; white-space: normal; vertical-align: baseline; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 养殖基地总面积1800平方米，建有龟池38个，温室4间，工作室2间，医疗室1间，配备保安室2个，养殖员6名，会所餐厅1个，接待客厅2个，娱乐室1间，专用停车场1个。目前主要以养殖台湾大青为主，兼养南石、黄缘、红都拉斯木棉、安南、三线等，现有稳产大青种龟2800多只，龟碌5000多只，每年产苗20000多只。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; font-size: 15px; line-height: 26px; white-space: normal; vertical-align: baseline; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="margin: 0px; padding: 0px; line-height: 1.5; font-size: 18px;"><span style="margin: 0px; padding: 0px; line-height: 22px;">本场凭借十多年来对行业的摸索研究和养殖经验，全力打造 “专业养殖、诚</span></span><span style="margin: 0px; padding: 0px; font-size: 18px;">信经营、服务至上”的经营理念，以热心和优质的服务赢得四方龟友的信任和支持，在养龟行业树立了诚信品牌和良好口碑。</span></p><p><span style="margin: 0px; padding: 0px; font-size: 18px;"><br/></span></p><p><br/></p>', '<h6 style="margin-top: 5px;"><span class="Apple-tab-span" style="white-space: pre;"></span><span style="margin: 0px; padding: 0px; font-family: 微软雅黑; line-height: 26px; font-size: 18px; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-family: KaiTi_GB2312; font-size: 24px;"></span></span><span style="margin: 0px; padding: 0px; font-family: 微软雅黑; line-height: 26px; font-size: 18px; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-family: KaiTi_GB2312; font-size: 24px;"><strong style="margin: 0px; padding: 0px;">&nbsp; &nbsp; &nbsp; &nbsp;中山市东富名龟养殖场组建于2004年10月，原先以家庭式小规模娱乐式养殖，仅有十几平方龟池两个，龟只不足30只，品种单一。经过近年来对市场的研究与信心，养殖场逐步扩大规模。目前，养殖基地总面积1800平方米，建有龟池38个，温室4间，工作室2间，注资本金为2千万元人民币，2014年9月获得国家工商局批准，成功注册商标，是广东省龟鳖养殖行业协会理事单位，已成为中山市名龟养殖的龙头企业。。</strong></span></span><span style="font-family: 微软雅黑; font-size: 15px; line-height: 26px; background-color: rgb(255, 255, 255);"></span></h6><h6 style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; font-size: 15px; line-height: 26px; white-space: normal; vertical-align: baseline; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-family: FangSong_GB2312; font-size: 24px;"><strong style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: KaiTi_GB2312;">&nbsp;&nbsp;&nbsp;</span><span style="margin: 0px; padding: 0px; font-family: KaiTi_GB2312;">东富名龟园第三期扩大工程仍正在筹备建设中，三年内，我们的养殖面积与龟只将会进一步扩容。怀着万分的喜庆与坚定的信心，我们愿与广大龟友共同探讨龟业的稳固发展美好前景。</span></strong></span></h6>', '<p><span class="Apple-tab-span" style="white-space: pre;"></span><span style="margin: 0px; padding: 0px; font-family: 微软雅黑; line-height: 26px; font-size: 18px; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-family: KaiTi_GB2312; font-size: 24px;"><strong style="margin: 0px; padding: 0px;"></strong></span></span></p><p>&nbsp;本场以“专业养殖、诚信经营、服务至上”的经营理念，以生产、销售、服务为一体的经营模式赢得四方龟友的信任和支持。目前，主要以养殖台湾大青为主，兼养南石、黄缘、红都拉斯木棉、安南、三线等，现有稳产大青种龟2800多只，龟碌5000多只，每年产苗20000多只。 &nbsp;&nbsp;&nbsp;</p><p><img id="gaikuang-bottomimg" src="http://dongfuguiyuan.com/system/pictures/20141118140067886788.jpg" style="margin: 10px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 16px; white-space: normal; width: 636px; height: 403px; background-color: rgb(255, 255, 255);" width="636" height="403"/></p><p><br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `today_visit` int(11) NOT NULL DEFAULT '0' COMMENT '今日访问量',
  `total_visit` int(11) NOT NULL DEFAULT '0' COMMENT '总访问量',
  `notice` text CHARACTER SET utf8 NOT NULL COMMENT '公告',
  `admin_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '管理员密码'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`id`, `today_visit`, `total_visit`, `notice`, `admin_name`, `admin_password`) VALUES
(1, 0, 0, '<p>\n    <div id="contact"><p>&nbsp;</p>\n                            <span style="margin-left:80px;">欢迎预约参观本场</span>\n                            <p><p>\n                                <span style="color:#003399;font-size:14px;">&nbsp;</span><span style="color:#003399;font-size:16px;">&nbsp;&nbsp;&nbsp; <span style="font-size:14px;">欢迎各位龟友前来本场参观指导！</span></span><span style="color:#003399;font-size:14px;">请提前两天预约，预约电话：13680296899（陈生）。</span>\n                            </p>\n                            <p>\n                                <span style="color:#003399;font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="font-size:14px;">&nbsp; </span><span style="color:#003399;font-size:14px;">每天接待时间：9：00-17：00 ，谢谢！</span>\n                            </p>\n                            <p>\n                                <span style="font-size:16px;">&nbsp;</span> <span style="color:#E53333;"></span>\n                            </p></p>\n                        </div>\n</p>', 'dfmgy', '3de69bf7ce31cd930672973af7923aff');

-- --------------------------------------------------------

--
-- 表的结构 `exchange`
--

CREATE TABLE `exchange` (
  `id` int(11) NOT NULL COMMENT '留言id',
  `guest_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '游客名称',
  `email` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '留言人邮箱',
  `comment` text CHARACTER SET utf8 NOT NULL COMMENT '评论内容',
  `comment_at` datetime NOT NULL COMMENT '评论时间',
  `reply` text CHARACTER SET utf32 NOT NULL COMMENT '回复内容',
  `reply_at` datetime NOT NULL COMMENT '回复时间',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否在前台显示(0:不显示;1:显示)',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:在后台显示  2:删除'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `exchange`
--

INSERT INTO `exchange` (`id`, `guest_name`, `email`, `comment`, `comment_at`, `reply`, `reply_at`, `is_show`, `status`) VALUES
(1, 'test1', 'rong650751@163.com', 'test1', '2016-04-16 00:00:00', 'test1 reply', '2016-04-17 00:00:00', 1, 1),
(2, 'test2', 'blue@163.com', 'test2', '2016-04-17 00:00:00', 'test2 rep', '2016-04-18 00:00:00', 0, 1),
(3, 'test3', 'test3', 'test3', '2016-04-18 00:00:00', 'test3', '2016-04-17 00:00:00', 1, 1),
(4, 'test4', 'test4', 'test4', '2016-04-19 00:00:00', 'test4', '2016-04-17 00:00:00', 1, 1),
(5, 'rterf', 'dsfds', 'fsdfds', '2016-04-26 17:05:25', '', '2016-04-26 17:05:25', 1, 1),
(6, 'rterf', 'dsfds', 'fsdfds', '2016-04-26 17:07:34', '', '2016-04-26 17:07:34', 1, 1),
(7, 'terrsefds', 'fdsfds', 'fdsfsdf', '2016-04-26 19:46:38', '', '2016-04-26 19:46:38', 1, 1),
(8, 'lan', 'rong@f5sdf', 'test', '2016-05-28 13:02:58', '', '2016-05-28 13:02:58', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `img`
--

CREATE TABLE `img` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '图片对应的文字',
  `img_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '图片名称',
  `img_type` tinyint(4) NOT NULL COMMENT '1为轮播图,2为养殖品种,3为养殖场,4为近期推荐,5为常年推荐',
  `status` tinyint(4) NOT NULL COMMENT '1为前台显示,2为前台不显示,3为删除',
  `created_at` datetime NOT NULL COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `img`
--

INSERT INTO `img` (`id`, `title`, `img_name`, `img_type`, `status`, `created_at`) VALUES
(1, 'fdsf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:16:44'),
(2, 'fdsf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:18:16'),
(3, 'fdsf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:25:44'),
(4, 'fdsf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:26:24'),
(5, 'fdsf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:28:04'),
(6, 'fdsf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:30:20'),
(7, 'fdsf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:36:14'),
(8, 'fdf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:36:49'),
(9, 'fdf', '2016-04-22 15:56:08屏幕截图.png', 4, 1, '2016-05-01 15:47:53'),
(10, 'vim', 'vim快捷键.png', 2, 1, '2016-05-25 08:19:35'),
(11, 'vim', 'vim快捷键.png', 2, 1, '2016-05-25 08:19:51'),
(12, 'vim', 'vim快捷键.png', 2, 1, '2016-05-25 08:19:53'),
(13, 'vim', 'vim快捷键.png', 2, 1, '2016-05-25 08:19:55'),
(14, 'vim', 'vim快捷键.png', 2, 1, '2016-05-25 08:19:56'),
(15, 'vim', 'vim快捷键.png', 2, 1, '2016-05-25 08:19:58'),
(16, 'ste', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 2, 1, '2016-05-25 08:20:28'),
(17, 'ste', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 2, 1, '2016-05-25 08:20:30'),
(18, 'ste', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 2, 1, '2016-05-25 08:20:31'),
(19, 'ste', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 2, 1, '2016-05-25 08:20:33'),
(20, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:34'),
(21, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:35'),
(22, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:37'),
(23, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:38'),
(24, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:39'),
(25, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:40'),
(26, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:41'),
(27, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:43'),
(28, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:50'),
(29, 'test', '2016-05-05 21:42:51屏幕截图.png', 3, 1, '2016-05-25 08:25:51'),
(30, 'test', '2016-04-22 15:56:08屏幕截图.png', 3, 1, '2016-05-25 08:26:03'),
(31, 'test', '2016-04-22 15:56:08屏幕截图.png', 3, 1, '2016-05-25 08:26:04'),
(32, 'test', '2016-04-22 15:56:08屏幕截图.png', 3, 1, '2016-05-25 08:26:06'),
(33, 'fsdfsd', '2016-05-04 19:10:35屏幕截图.png', 4, 1, '2016-05-25 08:27:13'),
(34, 'fsdfsd', '2016-05-04 19:10:35屏幕截图.png', 4, 1, '2016-05-25 08:27:15'),
(35, 'fsdfsd', '2016-05-04 19:10:35屏幕截图.png', 4, 1, '2016-05-25 08:27:16'),
(36, 'fsdfsd', '2016-05-04 19:10:35屏幕截图.png', 4, 1, '2016-05-25 08:27:17'),
(37, 'fsdfsd', '2016-05-04 19:10:35屏幕截图.png', 4, 1, '2016-05-25 08:27:18'),
(38, 'fsdfsd', '2016-05-04 19:10:35屏幕截图.png', 4, 1, '2016-05-25 08:27:20'),
(39, 'fsdfsd', '2016-05-04 19:10:35屏幕截图.png', 4, 1, '2016-05-25 08:27:21'),
(40, 'fsdfsd', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 4, 1, '2016-05-25 08:27:43'),
(41, 'fsdfsd', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 4, 1, '2016-05-25 08:27:44'),
(42, 'tfsadfdsafds', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 08:56:17'),
(43, 'tfsadfdsafds', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 08:56:18'),
(44, 'tfsadfdsafds', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 08:56:20'),
(45, 'tfsadfdsafds', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 08:56:22'),
(46, 'tfsadfdsafds', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 08:56:31'),
(47, 'tfsadfdsafds', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 08:56:32'),
(48, 'fdsfsd', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 09:01:32'),
(49, 'fdsfsd', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 09:05:31'),
(50, 'fdsfsd', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 09:06:13'),
(51, 'fdsfsd', '2016-05-05 21:42:51屏幕截图.png', 4, 1, '2016-05-25 09:08:28'),
(52, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:23'),
(53, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:36'),
(54, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:38'),
(55, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:38'),
(56, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:39'),
(57, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:40'),
(58, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:41'),
(59, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:42'),
(60, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:43'),
(61, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:44'),
(62, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:45'),
(63, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:46'),
(64, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:47'),
(65, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:48'),
(66, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:49'),
(67, 'test', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 5, 1, '2016-05-25 09:09:49'),
(68, 'lantern', '2016-04-22 15:56:08屏幕截图.png', 1, 1, '2016-05-25 15:11:18'),
(69, 'download', '2016-04-22 15:58:36屏幕截图.png', 1, 1, '2016-05-25 15:11:42'),
(70, '吐槽', '吐槽楼架构(给小白看的,别打我,我不是误导她们)', 1, 1, '2016-05-25 15:11:53'),
(71, 'blue', '2016-04-22 15:58:36屏幕截图.png', 1, 1, '2016-05-30 15:11:03');

-- --------------------------------------------------------

--
-- 表的结构 `text`
--

CREATE TABLE `text` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `type_id` tinyint(10) NOT NULL COMMENT '文章类型id',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '文章内容',
  `read_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `created_at` datetime NOT NULL COMMENT '文章发布时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `text`
--

INSERT INTO `text` (`id`, `type_id`, `title`, `content`, `read_quantity`, `created_at`) VALUES
(2, 1, '东富名龟园参加2015年东莞龟展会活1dssad动', '<p>test2</p>', 11, '2016-04-11 22:23:40'),
(3, 2, '东富名龟园参加2015年东莞（全国）龟展会\n', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;">金秋十月，是个丰收的季节，也是全国各地龟友值得喜庆的日子。10月16日，中山东富名龟园参与了2015年东莞（全国）龟展会，并与广东省龟协会会长陈小石、荣誉会长李艺以及《神龟网》等龟业养殖知名人士进行了研讨和交流，大家对龟市的火热感到产高兴与激动，对未来龟市的健康发展充满信心与期待。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="5312" height="2989" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016212282718271.jpg" style="margin: 0px; padding: 0px; width: 594px; height: 409px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><br style="margin: 0px; padding: 0px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="5310" height="2988" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016212448394839.jpg" style="margin: 0px; padding: 0px; width: 594px; height: 390px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><br style="margin: 0px; padding: 0px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="5310" height="2986" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016212677347734.jpg" style="margin: 0px; padding: 0px; width: 596px; height: 358px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><br style="margin: 0px; padding: 0px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="5311" height="2988" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016212758715871.jpg" style="margin: 0px; padding: 0px; width: 596px; height: 337px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><br style="margin: 0px; padding: 0px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="4910" height="3262" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016213032003200.JPG" style="margin: 0px; padding: 0px; width: 601px; height: 383px;"/></span></p><p><br/></p>', 5, '2016-04-11 22:24:05'),
(4, 3, 'test3', '<p>test3</p>', 0, '2016-04-11 22:24:11'),
(5, 4, 'test4', '<p>test4</p>', 1, '2016-04-11 22:24:18'),
(7, 2, 'testdfsdaf', '<p><img src="/uploadImg/ueditor/735987132769898496.png" title="" alt="2016-05-05 21:42:51屏幕截图.png"/></p>', 13, '2016-05-27 08:13:01'),
(8, 1, 'tesf', '<p>fdsafsdafdafsd</p><p>;jkl<br/>j<br/>lkj;</p><p>ghk</p><p>ghjlk</p><p>jlk</p><p><br/></p>', 1, '2016-05-27 13:13:35'),
(9, 2, 'tesf', '<p>fdsafsdafdafsd</p><p>;jkl<br/>j<br/>lkj;</p><p>ghk</p><p>ghjlk</p><p>jlk</p><p><br/></p>', 1, '2016-05-27 16:01:37'),
(10, 3, 'tesf', '<p>fdsafsdafdafsd</p><p>;jkl<br/>j<br/>lkj;</p><p>ghk</p><p>ghjlk</p><p>jlk</p><p><br/></p>', 1, '2016-05-27 16:01:40'),
(11, 4, 'tesf', '<p>fdsafsdafdafsd</p><p>;jkl<br/>j<br/>lkj;</p><p>ghk</p><p>ghjlk</p><p>jlk</p><p><br/></p>', 6, '2016-05-27 16:01:43'),
(12, 1, '东富名龟园参加2015年东莞龟展会活动', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;">金秋十月，是个丰收的季节，也是全国各地龟友值得喜庆的日子。10月16日，中山东富名龟园参与了2015年东莞（全国）龟展会，并与广东省龟协会会长陈小石、荣誉会长李艺以及《神龟网》等龟业养殖知名人士进行了研讨和交流，大家对龟市的火热感到产高兴与激动，对未来龟市的健康发展充满信心与期待。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="5312" height="2989" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016212282718271.jpg" style="margin: 0px; padding: 0px; width: 594px; height: 409px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><br style="margin: 0px; padding: 0px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="5310" height="2988" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016212448394839.jpg" style="margin: 0px; padding: 0px; width: 594px; height: 390px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><br style="margin: 0px; padding: 0px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="5310" height="2986" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016212677347734.jpg" style="margin: 0px; padding: 0px; width: 596px; height: 358px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><br style="margin: 0px; padding: 0px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="5311" height="2988" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016212758715871.jpg" style="margin: 0px; padding: 0px; width: 596px; height: 337px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><br style="margin: 0px; padding: 0px;"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: &#39;Times New Roman&#39;; font-size: medium; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="margin: 0px; padding: 0px; font-size: 16px;"><img width="4910" height="3262" alt="" src="http://dongfuguiyuan.com/system/pictures/20151016213032003200.JPG" style="margin: 0px; padding: 0px; width: 601px; height: 383px;"/></span></p><p><br/></p>', 8, '2016-05-29 07:49:58');

-- --------------------------------------------------------

--
-- 表的结构 `text_type`
--

CREATE TABLE `text_type` (
  `id` int(11) NOT NULL COMMENT '文章类型id',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '文章类型名称'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `text_type`
--

INSERT INTO `text_type` (`id`, `name`) VALUES
(1, '本场要闻'),
(2, '市场动态'),
(3, '行业评论'),
(4, '养殖交流');

-- --------------------------------------------------------

--
-- 表的结构 `turtle`
--

CREATE TABLE `turtle` (
  `id` int(11) NOT NULL COMMENT '龟鳖id',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '龟鳖品种名称',
  `introduction` text CHARACTER SET utf8 NOT NULL COMMENT '龟鳖品种介绍',
  `img_id` varchar(255) NOT NULL COMMENT '龟鳖品种图片(用逗号分割)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `turtle`
--

INSERT INTO `turtle` (`id`, `name`, `introduction`, `img_id`) VALUES
(1, 'fdsfd', '<p>fdsfds</p>', '53'),
(2, 'fdsf', '<p>fdsf</p>', '54'),
(3, 'vim', '<p>fsdafjdslkfjdsaljfldsajflsdafjldsafjlkdsajlfdsfdsafaf</p>', '10'),
(4, 'vim', '<p>fsdafjdslkfjdsaljfldsajflsdafjldsafjlkdsajlfdsfdsafaf</p>', '11'),
(5, 'vim', '<p>fsdafjdslkfjdsaljfldsajflsdafjldsafjlkdsajlfdsfdsafaf</p>', '12'),
(6, 'vim', '<p>fsdafjdslkfjdsaljfldsajflsdafjldsafjlkdsajlfdsfdsafaf</p>', '13'),
(7, 'vim', '<p>fsdafjdslkfjdsaljfldsajflsdafjldsafjlkdsajlfdsfdsafaf</p>', '14'),
(8, 'vim', '<p>fsdafjdslkfjdsaljfldsajflsdafjldsafjlkdsajlfdsfdsafaf</p>', '15'),
(9, 'ste', '<p>sdfadfadddddddddddddddd</p>', '16'),
(10, 'ste', '<p>sdfadfadddddddddddddddd</p>', '17'),
(11, 'ste', '<p>sdfadfadddddddddddddddd</p>', '18'),
(12, 'ste', '<p>sdfadfadddddddddddddddd</p>', '19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange`
--
ALTER TABLE `exchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_type`
--
ALTER TABLE `text_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `turtle`
--
ALTER TABLE `turtle`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `exchange`
--
ALTER TABLE `exchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id', AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `img`
--
ALTER TABLE `img`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- 使用表AUTO_INCREMENT `text`
--
ALTER TABLE `text`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id', AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `text_type`
--
ALTER TABLE `text_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类型id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `turtle`
--
ALTER TABLE `turtle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '龟鳖id', AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
