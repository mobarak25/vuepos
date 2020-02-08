-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 08, 2020 at 06:02 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id12091916_vuepos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(9, 'Laptops'),
(10, 'MicroSD cards'),
(11, 'Bluetooth headphones'),
(12, 'Smart TVs'),
(13, 'Wireless earphones'),
(14, 'USB flash drives'),
(15, 'Bluetooth speakers'),
(16, 'Voice-activated speakers'),
(17, 'Mobile phone'),
(18, 'keyboard'),
(19, 'computer');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(15) NOT NULL,
  `company_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `company_name`) VALUES
(5, 'China Electronics Corporation'),
(6, 'Mitsubishi Electric'),
(7, 'Honeywell International'),
(8, 'LG Electronics'),
(9, 'Amer International Group'),
(10, 'Panasonic '),
(11, 'Sony'),
(12, 'Hitachi'),
(13, 'Samsung Electronics');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `address`, `phone`, `email`) VALUES
(9, 'Mobarak Ali', '119/3, Bejoy sarany, Tejkunipara, Dhaka-1215', '01767513948', 'mobarakali62@gmail.com'),
(10, 'Shorif Mehedi', '25/11, DIT project, Marul badda, Dhaka-1625', '01765139481', 'mehedi_cse@gmail.com'),
(12, 'Md. Shaiful Islam', '40/12 DIT project, Marul badda, Dhaka-1625	', '01767518945', 'ShaifulIslam@uotlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `expense_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cost` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `expDate` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `expDame` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `expense_type`, `cost`, `expDate`, `expDame`) VALUES
(4, 'Lunch', '500', '1/1/2020', 'mee'),
(5, 'Lunch', '700', '2/1/2020', 'hh'),
(6, 'Lunch', '100', '3/1/2020', 'rr'),
(7, 'Tea', '250', '21/1/2020', 'HR & Finance'),
(8, 'Lunch', 'xcv', '7/1/2020', 'xcv'),
(9, 'Tea', '300', '19/2/2020', 'xzcv'),
(10, 'Lunch', '200', '19/2/2020', 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `expense_type`
--

CREATE TABLE `expense_type` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense_type`
--

INSERT INTO `expense_type` (`id`, `name`) VALUES
(1, 'Tea'),
(2, 'Lunch');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `qty` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cost_price` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `selling_price` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `cat_id`, `description`, `qty`, `cost_price`, `selling_price`, `company`) VALUES
(73, '37', '9', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', '20', '25000', '40000', '5'),
(74, '36', '9', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', '20', '30200', '45000', '6'),
(75, '32', '9', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', '50', '50000', '70000', '13'),
(76, '33', '9', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', '12', '30400', '40500', '7'),
(77, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined'),
(78, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined'),
(79, '39', '9', 'lkhh', '10', '4000', '60000', '8'),
(80, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `product_name`
--

CREATE TABLE `product_name` (
  `id` int(50) NOT NULL,
  `product_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_name`
--

INSERT INTO `product_name` (`id`, `product_name`) VALUES
(30, 'Chuwi HeroBook Intel Atom'),
(31, 'Asus VivoBook X540YA AMD E1 6010'),
(32, 'Acer Aspire 3 A315-53 N17C4'),
(33, 'Asus A441MA'),
(34, 'Asus VivoBook X402YA'),
(35, 'Acer Aspire 3 A315-21'),
(36, 'Chuwi Hi10 Air'),
(37, 'Asus X441MA'),
(39, 'shirt'),
(40, 'shirt'),
(41, ''),
(42, '');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(50) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `contact_no`, `remarks`) VALUES
(15, 'Akahtarul Islam', '25/11, DIT project, Marul badda, Dhaka-1620', '01767515689', 'Whole sala supplier'),
(16, 'Jony Ahmed', '25/11, DIT project, Marul badda, Dhaka-1620', '01767515895', 'Retail'),
(17, 'undefined', 'undefined', 'undefined', 'undefined');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_type`
--
ALTER TABLE `expense_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_name`
--
ALTER TABLE `product_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `expense_type`
--
ALTER TABLE `expense_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `product_name`
--
ALTER TABLE `product_name`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
