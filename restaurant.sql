-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2019 at 07:56 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminsignup`
--

CREATE TABLE `adminsignup` (
  `Id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `phone` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminsignup`
--

INSERT INTO `adminsignup` (`Id`, `name`, `username`, `password`, `email`, `phone`) VALUES
(26, 'suman rijal', 'sumanrijal12', '*58E08138F1A017FFCD4FC412F5EE7BD4702D31BD', 'xu.man.344@gmail.com', '9805110336'),
(27, 'suman rijal', 'admin', '*96966004E600D5B9044C9AB25A89CA07022C4C99', 'xu.man.355@gmail.com', '9805110336'),
(28, 'suman rijal', 'kitchen123', '*26F078C5D5D243A3EC8BA60B01BD8158C9E22691', 'xu.man@gmail.com', '9805110336');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`) VALUES
(1, 'SUMAN', 'xu.man.355@gmail.com', '56685495459', 'sfasf'),
(3, 'Suman', 'xu.man.355@gmail.com', '9845563834', 'mali khana man parena .. momo alli sudar garnu paryo'),
(4, 'Suraj', 'xu.man.355@gmail.com', '9845563834', 'mali momo man parean alli sudar garnu paryo... pizza ma chesse kam vayo'),
(5, 'Stuti', 'sushilane@hotmail.com', '9818676670', 'Haha, the pizza was terrible. I was expecting better than this. I suggest you fire cooks.');

-- --------------------------------------------------------

--
-- Table structure for table `likecount`
--

CREATE TABLE `likecount` (
  `id` int(11) NOT NULL,
  `username` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likecount`
--

INSERT INTO `likecount` (`id`, `username`) VALUES
(1, 'user'),
(2, 'suman'),
(3, 'suman'),
(18, 'sumanrijal12'),
(38, 'sumanrijal1');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(255) NOT NULL,
  `category` varchar(1000) NOT NULL,
  `dishimage` varchar(1000) NOT NULL,
  `dishname` varchar(1000) NOT NULL,
  `dishprice` varchar(1000) NOT NULL,
  `dishdetail` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `category`, `dishimage`, `dishname`, `dishprice`, `dishdetail`) VALUES
(1, 'momo', 'Suman_IMG_1564210545342.jpg', 'Chicken Momo', '170', 'Served with coca cola and salad.'),
(2, 'burger', 'Suman_IMG_1564210724711.jpg', 'Veg Burger', '150', ' veg burger recipe can be made of vegetables, soya beans etc. '),
(3, 'BBQ', 'Suman_IMG_1564210707451.jpg', 'Chicken BBQ', '450', 'Served with masala vegetable and cocacola.'),
(4, 'chownim', 'Suman_IMG_1564210809340.jpg', 'Chicken Chowmin', '150', 'Loaded with fresh vegetables and easy to make.'),
(5, 'biryani', 'Suman_IMG_1564210909649.jpg', 'Chicken Biryani', '300', ' prepared using basmati rice, chicken thighs, Greek yoghurt or hung curd, onion, tomato,'),
(6, 'fryrice', 'Suman_IMG_1564211109556.jpg', 'Veg Fried Rice', '100', 'Stir-fry the onions, garlic, and carrots until tender.'),
(8, 'khajaset', 'Suman_IMG_1564211514788.jpg', 'Chicken Khajaset', '250', 'consists of meat items like choila, alu tama, types of pickle');

-- --------------------------------------------------------

--
-- Table structure for table `orderlist`
--

CREATE TABLE `orderlist` (
  `Id` int(11) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `dishname` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderlistback`
--

CREATE TABLE `orderlistback` (
  `id` int(11) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `dishname` varchar(1000) NOT NULL,
  `price` int(244) NOT NULL,
  `qty` int(244) NOT NULL,
  `total` int(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderlistback`
--

INSERT INTO `orderlistback` (`id`, `username`, `dishname`, `price`, `qty`, `total`) VALUES
(13, 'sumanrijal1', 'Veg Burger', 150, 1, 150),
(14, 'sumanrijal1', 'Chicken Momo', 170, 3, 510);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `Id` int(100) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `phone` varchar(1000) NOT NULL,
  `time` varchar(1000) NOT NULL,
  `date` varchar(1000) NOT NULL,
  `party` varchar(1000) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `status` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Id`, `username`, `phone`, `time`, `date`, `party`, `message`, `status`) VALUES
(9, 'sumanrijal12', '2', '11:04', '2019-12-16', 'Choose...', '', 'pending'),
(10, 'anu.lamatmg', '9818891647', '10:32', '2019-12-18', '2', 'Ready a birthday cake with my name ', 'accepted'),
(11, 'sumanrijal1', '9805110336', '17:36', '2019-12-18', '3', 'Please ready a birthday cake of my name ', 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `reservestatus`
--

CREATE TABLE `reservestatus` (
  `id` int(100) NOT NULL,
  `status` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservestatus`
--

INSERT INTO `reservestatus` (`id`, `status`, `username`) VALUES
(1, 'accept', 'sumanrijal1'),
(1, 'deny', 'sumanrijal1'),
(1, 'deny', 'sumanrijal1');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `Id` int(100) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `phone` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`Id`, `name`, `username`, `password`, `email`, `phone`) VALUES
(6, 'suman rijal', 'sumanrijal12', '*AE690A78C670D3FF25ADB05A60D4616B30F36543', 'xu.man.344@gmail.com', '9805110336'),
(7, 'suman rijal', 'sumanrijal1', '*AE690A78C670D3FF25ADB05A60D4616B30F36543', 'xu.man.355@gmail.com', '9805110336'),
(8, 'Bibek', 'Bibek', '*E110141E9940167ECFCA6EE9B1F98FC3156D6D7E', 'neupanebibek14@gmail.com', '9860002081'),
(9, 'Anu Tamang', 'anu.lamatmg', '*55707621F1741BB7F4F3709A6735BEB7C912AD7A', 'tmz.onnu@gmail.com', '9818891647');

-- --------------------------------------------------------

--
-- Table structure for table `userlocation`
--

CREATE TABLE `userlocation` (
  `id` int(11) NOT NULL,
  `lat` varchar(1000) NOT NULL,
  `lon` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `time` varchar(1000) NOT NULL,
  `date` varchar(1000) NOT NULL,
  `phone` varchar(1000) NOT NULL,
  `optionalphone` varchar(1000) NOT NULL,
  `addressdetail` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlocation`
--

INSERT INTO `userlocation` (`id`, `lat`, `lon`, `username`, `address`, `time`, `date`, `phone`, `optionalphone`, `addressdetail`) VALUES
(4, '20', '20', 'sumanrijal12', 'ktm, ktm', '10:48', '2019-11-06', '9805110336', '9805110336', 'gongabu chok shiva mandir'),
(6, '20', '20', 'sumanrijal1', 'Paiyunpata-07,Baglung', '12:17', '2019-12-18', '9805110336', '9805110336', 'g'),
(7, '20', '20', 'Bibek', 'ktm', '12:35', '2019-12-14', '9805110336', '', 'Kapan'),
(8, '20', '20', 'anu.lamatmg', 'Enabaha Marg,Jyatha, Kathmandu', '10:31', '2019-12-18', '9818891647', '', 'Jamal najik ... Jamal chok batw vitra thamel jane bato');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminsignup`
--
ALTER TABLE `adminsignup`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likecount`
--
ALTER TABLE `likecount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `orderlistback`
--
ALTER TABLE `orderlistback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `userlocation`
--
ALTER TABLE `userlocation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminsignup`
--
ALTER TABLE `adminsignup`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likecount`
--
ALTER TABLE `likecount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orderlist`
--
ALTER TABLE `orderlist`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orderlistback`
--
ALTER TABLE `orderlistback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userlocation`
--
ALTER TABLE `userlocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
